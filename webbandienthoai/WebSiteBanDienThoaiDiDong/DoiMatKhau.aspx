<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="DoiMatKhau.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.DoiMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%if (Session["DangNhapThanhCong"] != "1") Response.Redirect("Default.aspx"); %>

    <div class="center_title_bar">Thông tin Admin</div>
    <div class="prod_box_big">
    <div class="top_prod_box_big"></div>
    <div class="center_prod_box_big">
    <div class="contact_form">
        <asp:Repeater ID="rThongTinCaNhan" runat="server" DataSourceID="sdsThongTinCaNhan">
        <ItemTemplate>
        <label class="contact">Tên đăng nhập:</label><label class="show_infor"><strong><%# Eval("TenDangNhap") %></strong></label>
        <label class="contact">Họ và tên:</label><label class="show_infor"><strong><%# Eval("HoTen") %></strong></label>
        <label class="contact">Email:</label><label class="show_infor"><strong><%# Eval("Email") %></strong></label>
        <label class="contact">Số điện thoại:</label><label class="show_infor"><strong><%# Eval("SDT") %></strong></label>
        <label class="contact">Địa chỉ:</label><label class="show_infor"><strong><%# Eval("DiaChi") %></strong></label>
        </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="sdsThongTinCaNhan" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
            SelectCommand="SELECT * FROM [tblNguoiSuDung] WHERE ([TenDangNhap] = @TenDangNhap)">
            <SelectParameters>
                <asp:SessionParameter Name="TenDangNhap" SessionField="TenDangNhap" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>        
    </div>
    <div class="bottom_prod_box_big"></div>        
    </div>  
    <div class="center_title_bar">Thay đổi mật khẩu</div> 
    <div class="prod_box_big">
	<div class="top_prod_box_big"></div>
	
	<div class="center_prod_box_big">
	
	<div class="contact_form">
	<div class="form_row">
	<label class="contact"><strong>Mật khẩu cũ:</strong></label>
	    <asp:TextBox ID="txtMatKhauCu" runat="server" CssClass="textbox_kael" 
            Height="18px" TextMode="Password" Width="245px" MaxLength="30"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvMatKhauCu" runat="server" 
            ControlToValidate="txtMatKhauCu" CssClass="star_kael" Display="Dynamic" 
            ErrorMessage="(*)" ValidationGroup="DoiMatKhau" SetFocusOnError="True"></asp:RequiredFieldValidator>
	</div>
	<div class="form_row">
	<label class="contact"><strong>Mật khẩu mới:</strong></label>
        <asp:TextBox ID="txtMatKhauMoi" runat="server" CssClass="textbox_kael" 
            Height="18px" TextMode="Password" Width="245px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvMatKhauMoi" runat="server" 
            ErrorMessage="(*)" ControlToValidate="txtMatKhauMoi" CssClass="star_kael" 
            Display="Dynamic" SetFocusOnError="True" ValidationGroup="DoiMatKhau"></asp:RequiredFieldValidator>
	</div>
	<div class="form_row">
	<label class="contact"><strong>Nhập lại mật khẩu:</strong></label>
        <asp:TextBox ID="txtNhapLaiMatKhau" runat="server" CssClass="textbox_kael" 
            Height="18px" TextMode="Password" Width="245px"></asp:TextBox>
        <asp:CompareValidator ID="cvMatKhauMoi" runat="server" ErrorMessage="(*)" 
            ControlToCompare="txtNhapLaiMatKhau" ControlToValidate="txtMatKhauMoi" 
            CssClass="star_kael" Display="Dynamic" SetFocusOnError="True" 
            ValidationGroup="DoiMatKhau"></asp:CompareValidator>
	</div>
	<div class="form_row">
        <asp:Button ID="cmdDoiMatKhau" runat="server" Text="Thay đổi" 
            BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
            ValidationGroup="DoiMatKhau" onclick="cmdDoiMatKhau_Click" />
	</div>
	</div>
	</div>
	<div class="bottom_prod_box_big"></div>  
	</div>   
</asp:Content>
