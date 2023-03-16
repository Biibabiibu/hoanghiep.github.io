<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="ThanhToanThanhCong.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.ThanhToanThanhCong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style=" border: thin solid #000000; width:520px; height:33px; float:left; padding:0 0 0 40px; margin: 40px 0 0 12px; _margin:0 0 0 6px; line-height:33px; font-size:12px; color:#ffffff; font-weight:bold; background-color:#59939E">
    Thanh toán thành công</div>
<div style=" border-width: thin; border-color: #000000; width:520px; float:left; padding:0 0 0 40px; margin: 0 0 0 12px; background-color: #CCCCFF; font-size: 12px; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; text-decoration: none; font-weight: bold;">
<br />
    Bạn đã thanh toán đơn hàng thành công.
    <br /><br />
    Sản phẩm sẽ được chuyển đến địa chỉ khách hàng đã yêu cầu
    trong thời gian sớm nhất.
    <br /><br />
    Cảm ơn bạn đã chọn mua điện thoại tại cửa hàng!
    <br /><br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Default.aspx">Quay lại trang chủ.</asp:HyperLink>
    
    <br />&nbsp;</div>
</asp:Content>
