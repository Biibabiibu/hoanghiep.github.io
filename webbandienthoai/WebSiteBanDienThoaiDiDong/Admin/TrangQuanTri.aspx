<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="TrangQuanTri.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.TrangQuanTri" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="left-column">
			
		</div>
		<div id="center-column">
<div class="top-bar">
				<h1>Xin chào <%= Session["TenDangNhap"] %></h1>
			</div><br />
		  <div class="select-bar">
		    <label>- Trang web hiện có <span style="color:Red; font-weight:bold"><%= Application["SoNguoiOnline"] %></span> người đang online.</label>
		    <br /><label>- Số lượt truy cập: <span style="color:Red; font-weight:bold"><%= Application["SoLuotTruyCap"] %></span></label>
		  </div>
			<div class="table">
		

		  </div></div>
</asp:Content>
