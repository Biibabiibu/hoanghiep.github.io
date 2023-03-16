<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="Loi.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Loi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%if (Session["DangNhapThanhCong"] == "1") Response.Redirect("Default.aspx"); %>
<div style=" border: thin solid #000000; width:520px; height:33px; float:left; padding:0 0 0 40px; margin: 40px 0 0 12px; _margin:0 0 0 6px; line-height:33px; font-size:12px; color:#ffffff; font-weight:bold; background-color:#59939E">
    Bạn không thể sử dụng chức năng này</div>
<div style=" border-width: thin; border-color: #000000; width:520px; float:left; padding:0 0 0 40px; margin: 0 0 0 12px; background-color: #CCCCFF; font-size: 12px; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; text-decoration: none; font-weight: bold;">
<br />
    Bạn hãy đăng nhập hoặc
    <asp:HyperLink ID="hlDK" runat="server" NavigateUrl="DangKy.aspx" 
        ForeColor="RED" Font-Underline=true>đăng ký</asp:HyperLink> để sử dụng chức năng này!<br />&nbsp;</div>

</asp:Content>
