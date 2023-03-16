<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="ThemVaoGio.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.ThemVaoGio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%if (Request["IDDT"] == null) Response.Redirect("Default.aspx"); %>
</asp:Content>
