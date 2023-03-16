<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="DangKy_ThanhCong.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.DangKy_ThanhCong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style=" border: thin solid #000000; width:520px; height:33px; float:left; padding:0 0 0 40px; margin: 40px 0 0 12px; _margin:0 0 0 6px; line-height:33px; font-size:12px; color:#ffffff; font-weight:bold; background-color:#59939E">
    Đăng Ký Tài Khoản Thành Công</div>
<div style=" border-width: thin; border-color: #000000; width:520px; float:left; padding:0 0 0 40px; margin: 0 0 0 12px; background-color: #CCCCFF; font-size: 12px; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; text-decoration: none; font-weight: bold;">
    Cảm ơn bạn đã đăng ký sử dụng dịch vụ của chúng tôi!<br />
    <asp:HyperLink ID="hlDangKyThanhCong" runat="server" NavigateUrl="Default.aspx" 
        ForeColor="Black" Font-Underline=true>Quay lại trang chủ.</asp:HyperLink></div>
</asp:Content>
