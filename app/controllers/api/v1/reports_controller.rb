class Api::V1::ReportsController < ApplicationController
        before_action :set_report, only: [:show, :edit, :update, :destroy]
      
        # GET /reports
        # GET /reports.json
        def index
          @reports = Report.all.order(brand: :asc)
          render json: @reports
        end
      
        # GET /reports/1
        # GET /reports/1.json
        def show
          if @report
            render json: @report
          else
            render json: @report.errors
          end
        end
      
        # GET /reports/new
        def new
          @report = Report.new
        end
      
        # GET /reports/1/edit
        def edit
        end
      
        # POST /reports
        # POST /reports.json
        def create
          @report = Report.new(report_params)
      
      
          if @report.save
            render json: @report
          else
            render json: @report.errors
          end
        end
      
        # PATCH/PUT /reports/1
        # PATCH/PUT /reports/1.json
        def update
        end
      
        # DELETE /reports/1
        # DELETE /reports/1.json
        def destroy
          @report.destroy
      
          render json: { notice: 'Report was successfully removed.' }
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_report
            @report = Report.find(params[:id])
          end
      
          # Only allow a list of trusted parameters through.
          def report_params
            params.permit(:brand, :style, :country, :quantity)
          end
      end
end
