<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DemSoNguoi.ascx.cs" Inherits="WebSiteBanDienThoaiDiDong.UserControl.DemSoNguoi" %>
<div class="title_box">Thống Kê</div> 
<div class="border_box_tin">
<asp:Image ID="iTinMoi" runat="server" ImageUrl="~/images/user.png"/>&nbsp;Đang trực tuyến:&nbsp;<span style="font-weight:bold;color:Red"><%= Application["SoNguoiOnline"] %></span><br />
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/user.png"/>&nbsp;Lượt truy cập:&nbsp;<span style="font-weight:bold;color:Red"><%= Application["SoLuotTruyCap"] %></span>
</div>