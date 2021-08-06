import { Layout } from "antd";
import React from "react";
import Reports from "./Reports";
import Header from "./Header";

const { Content, Footer } = Layout;

export default () => (
  <Layout className="layout">
    <Header />
    <Content style={{ padding: "0 50px" }}>
      <div className="site-layout-content" style={{ margin: "100px auto" }}>
        <h1>DINO's Rocket Report Templates!</h1>
        <Beers />
      </div>
    </Content>
    <Footer style={{ textAlign: "center" }}>e-Laoshi © 2021</Footer>
  </Layout>)