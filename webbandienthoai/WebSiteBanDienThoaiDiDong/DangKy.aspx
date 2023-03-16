<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.DangKy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="center_title_bar">Đăng Ký Tài Khoản Sử Dụng</div>
	
	<div class="contact_form">
	<div class="form_row">
        <asp:Label ID="lblThongBaoDangKy" runat="server" Font-Size="Small" 
            Font-Names="Arial" ForeColor="Red"></asp:Label>
        <asp:ValidationSummary ID="vsDangKy" runat="server" ValidationGroup="DangKy" 
            DisplayMode="List" Font-Bold="False" Font-Names="Arial" 
            Font-Size="Small" />
	</div>
	</div>
	
	<div class="prod_box_big">
	<div class="top_prod_box_big"></div>
	
	<div class="center_prod_box_big">
	
	<div class="contact_form">
	
	<div class="form_row">
	<label class="contact"><strong>Tên đăng nhập:</strong></label>
        <asp:TextBox ID="txtTenDangNhap" runat="server" 
                Height="18px" Width="245px" CssClass="textbox_kael" MaxLength="20" ></asp:TextBox><span class="star_kael">
        (*)</span>
	    <asp:RequiredFieldValidator ID="rfvTenDangNhap" runat="server" 
            ControlToValidate="txtTenDangNhap" Display="None" 
            ErrorMessage="Tên đăng nhập không được để trống!" ValidationGroup="DangKy" 
            SetFocusOnError="True"></asp:RequiredFieldValidator>
	    <asp:RegularExpressionValidator ID="revTenDangNhap" runat="server" 
            ControlToValidate="txtTenDangNhap" Display="None" 
            ErrorMessage="Tên đăng nhập phải từ 4-20 ký tự!" SetFocusOnError="True" 
            ValidationExpression=".{4,20}" ValidationGroup="DangKy"></asp:RegularExpressionValidator>
	    </div>
	<div class="form_row">
	<label class="contact"><strong>Mật khẩu:</strong></label>
	    <asp:TextBox ID="txtMatKhau" runat="server" Height="18px" MaxLength="30" 
            TextMode="Password" Width="245px" CssClass="textbox_kael"></asp:TextBox><span class="star_kael">
        (*)</span>
	    <asp:RequiredFieldValidator ID="rfvMatKhau" runat="server" 
            ControlToValidate="txtMatKhau" Display="None" 
            ErrorMessage="Mật khẩu không được để trống!" SetFocusOnError="True" 
            ValidationGroup="DangKy"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revMatKhau" runat="server" 
            ControlToValidate="txtMatKhau" Display="None" 
            ErrorMessage="Mật khẩu phải từ 6-30 ký tự!" SetFocusOnError="True" 
            ValidationExpression=".{6,30}" ValidationGroup="DangKy"></asp:RegularExpressionValidator>
	</div>
	<div class="form_row">
	<label class="contact"><strong>Xác nhận mật khẩu:</strong></label>
	    <asp:TextBox ID="txtXacNhanMatKhau" runat="server" CssClass="textbox_kael" 
            Height="18px" MaxLength="30" TextMode="Password" Width="245px"></asp:TextBox><span class="star_kael">
        (*)</span>
	    <asp:CompareValidator ID="cvMatKhau" runat="server" 
            ControlToCompare="txtXacNhanMatKhau" ControlToValidate="txtMatKhau" 
            Display="None" ErrorMessage="Mật khẩu gõ lại không chính xác!" 
            SetFocusOnError="True" ValidationGroup="DangKy"></asp:CompareValidator>
	</div>
	<div class="form_row">
	<label class="contact"><strong>Họ và tên:</strong></label>
	    <asp:TextBox ID="txtHoVaTen" runat="server" CssClass="textbox_kael" 
            Height="18px" MaxLength="50" Width="245px"></asp:TextBox></asp:TextBox><span class="star_kael">
        (*)</span>
	    <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" 
            ControlToValidate="txtHoVaTen" Display="None" 
            ErrorMessage="Họ tên không được để trống!" SetFocusOnError="True" 
            ValidationGroup="DangKy"></asp:RequiredFieldValidator>
	</div>
	<div class="form_row">
	<label class="contact"><strong>Địa chỉ:</strong></label>
	    <asp:TextBox ID="txtDiaChi" runat="server" CssClass="textbox_kael" 
            Font-Names="Arial" Font-Size="Small" TextMode="MultiLine" Width="245px"></asp:TextBox>
	</div>
	<div class="form_row">
        <asp:Button ID="cmd_DangKy" runat="server" Text="Đăng Ký" BorderColor="Black" 
            BorderStyle="Solid" ValidationGroup="DangKy" onclick="cmd_DangKy_Click" 
            BorderWidth="1px" />
            
	</div>
	
	</div>
	
	</div>
	
	<div class="bottom_prod_box_big"></div>
	</div>
</asp:Content>
