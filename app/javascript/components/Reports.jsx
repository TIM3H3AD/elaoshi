import { Table, message, Popconfirm } from "antd";
import React from "react";
import AddReportModal from "./AddReportModal";

class Reports extends React.Component {
	columns = [
		{
			title: "Student Name",
			dataIndex: "student_name",
			key: "student_name",
		},
		{
			title: "Course",
			dataIndex: "course",
			key: "course",
		},
		{
			title: "Unit",
			dataIndex: "unit",
			key: "unit",
		},
		{
			title: "Classroom",
			dataIndex: "classroom",
			key: "classroom",
		},
        {
			title: "Greeting",
			dataIndex: "greeting",
			key: "greeting",
		}, 
        {
			title: "Salutation",
			dataIndex: "salutation",
			key: "salutation",
		},
        {
			title: "0",
			dataIndex: "scored_lead_0",
			key: "scored_lead_0",
		},
        {
			title: "1",
			dataIndex: "scored_lead_1",
			key: "scored_lead_1",
		},
        {
			title: "2",
			dataIndex: "scored_lead_2",
			key: "scored_lead_2",
		},
        {
			title: "3",
			dataIndex: "scored_lead_3",
			key: "scored_lead_3",
		},
        {
			title: "4",
			dataIndex: "scored_lead_4",
			key: "scored_lead_4",
		},
		{
			title: "",
			key: "action",
			render: (_text, record) => (
				<Popconfirm
					title="Are you sure delete this report?"
					onConfirm={() => this.deleteReport(record.id)}
					okText="Yes"
					cancelText="No"
				>
					<a href="#" type="danger">
						Delete{" "}
					</a>
				</Popconfirm>
			),
		},
	];

	state = {
		reports: [],
	};

	componentDidMount() {
		this.loadReports();
	}

	loadReports = () => {
		const url = "api/v1/reports/index";
		fetch(url)
			.then((data) => {
				if (data.ok) {
					return data.json();
				}
				throw new Error("Network error.");
			})
			.then((data) => {
				data.forEach((report) => {
					const newEl = {
						key: report.id,
						id: report.id,
						student_name: report.student_name,
						course: report.course,
						level: report.level,
						unit: report.unit,
                        classroom: report.classroom,
                        scored_lead_0: report.scored_lead_0,
						scored_lead_1: report.scored_lead_1,
						scored_lead_2: report.scored_lead_2,
						scored_lead_3: report.scored_lead_3,
                        scored_lead_4: report.scored_lead_4,
                        greeting: report.greeting,
                        salutation: report.salutation
					};

					this.setState((prevState) => ({
						reports: [...prevState.reports, newEl],
					}));
				});
			})
			.catch((err) => message.error("Error: " + err));
	};

	reloadReports = () => {
		this.setState({ reports: [] });
		this.loadReports();
	};

	deleteReport = (id) => {
		const url = `api/v1/reports/${id}`;

		fetch(url, {
			method: "delete",
		})
			.then((data) => {
				if (data.ok) {
					this.reloadReports();
					return data.json();
				}
				throw new Error("Network error.");
			})
			.catch((err) => message.error("Error: " + err));
	};

	render() {
		return (
			<>
				<Table
					className="table-striped-rows"
					dataSource={this.state.reports}
					columns={this.columns}
					pagination={{ pageSize: 5 }}
				/>

				<AddReportModal reloadReports={this.reloadReports} />
			</>
		);
	}
}

export default Reports;
