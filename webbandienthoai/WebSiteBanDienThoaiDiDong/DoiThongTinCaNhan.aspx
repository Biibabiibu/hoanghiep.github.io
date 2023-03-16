<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="DoiThongTinCaNhan.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.DoiThongTinCaNhan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%if (Session["DangNhapThanhCong"] != "1") Response.Redirect("Default.aspx"); %>

    <div class="center_title_bar">Thay đổi thông tin cá nhân</div> 
    <div class="prod_box_big">
	<div class="top_prod_box_big"></div>
	
	<div class="center_prod_box_big">
	
	<div class="contact_form">
	
        <asp:FormView ID="fvThayDoiThongTin" DataKeyNames="TaiKhoan" DataSourceID="sdsThayDoiThongTin" runat="server">
        <ItemTemplate>
        <label class="contact">Tên đăng nhập:</label><label class="show_infor"><strong><%# Eval("TaiKhoan") %></strong></label><label class="contact">Họ và tên:</label><label class="show_infor"><strong><%# Eval("TenKH") %></strong></label><label class="contact">Địa chỉ:</label><label class="show_infor"><strong><%# Eval("DiaChi") %></strong></label><div class="form_row">
            <asp:Button ID="cmdEdit" runat="server" Text="Thay đổi" CommandName="Edit" BorderWidth="1px" BorderStyle="Solid" BorderColor="Black" />
        </div>
        </ItemTemplate>
        <EditItemTemplate>
        <div class="form_row">
        <label class="contact"><strong>Tên đăng nhập:</strong></label>

                    <label class="contact"><strong style="float: left"><%# Eval("TaiKhoan") %></strong></label>
        </div>

        <div class="form_row">
        <label class="contact"><strong>Tên khách hàng:</strong></label>
            <asp:TextBox ID="txtTenKH" runat="server" Height="18px" Width="245px" CssClass="textbox_kael" Text='<%# Bind("TenKH") %>'></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" CssClass="star_kael" ControlToValidate="txtTenKH"></asp:RequiredFieldValidator>
        </div>
        <div class="form_row">
        <label class="contact"><strong>Địa chỉ:</strong></label>
            <asp:TextBox ID="txtDiaChi" runat="server" Height="18px" Width="245px" CssClass="textbox_kael" Text='<%# Bind("DiaChi") %>'></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDiaChi" runat="server" ErrorMessage="(*)" CssClass="star_kael" ControlToValidate="txtDiaChi"></asp:RequiredFieldValidator>
        </div>
        <div class="form_row">
            <asp:Button ID="cmdUpdate" runat="server" Text="Cập nhật" ValidationGroup="DoiThongTin" CommandName="Update" BorderWidth="1px" BorderStyle="Solid" BorderColor="Black" />
        </div>
        </EditItemTemplate>
        </asp:FormView>
        
        <asp:SqlDataSource ID="sdsThayDoiThongTin" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
            
            SelectCommand="SELECT * FROM [tblKhachHang] WHERE ([TaiKhoan] = @TenTK)" 
            UpdateCommand="UPDATE tblKhachHang SET TaiKhoan = @TaiKhoan, TenKH = @TenKH, DiaChi = @DiaChi WHERE (TaiKhoan = @TenTK)">
            <SelectParameters>
                <asp:SessionParameter Name="TenTK" SessionField="TenTK" 
                    Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="TaiKhoan" />
                <asp:Parameter Name="TenKH" />
                <asp:Parameter Name="DiaChi" />                
                <asp:SessionParameter Name="TenTK" SessionField="TenTK" />
            </UpdateParameters>
        </asp:SqlDataSource>
	</div>
	
	</div>
	<div class="bottom_prod_box_big"></div>  
	</div>
</asp:Content>
