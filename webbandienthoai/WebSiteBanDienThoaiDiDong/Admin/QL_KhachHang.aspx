<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_KhachHang.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_KhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .txtBox
    {
        height: 18px;
        width: 245px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="left-column">
</div>
<div id="center-column">
<div class="top-bar">
<h1>QUẢN LÝ KHÁCH HÀNG</h1>
</div>
<div class="select-bar">
            <label>
                <asp:TextBox ID="txtTimKiem" runat="server" Width="200px"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rfvTimKiem" runat="server" 
                ErrorMessage="Bạn cần nhập từ khóa tìm kiếm!" ControlToValidate="txtTimKiem" 
                Display="None" SetFocusOnError="True" ValidationGroup="TimKiem"></asp:RequiredFieldValidator><asp:ValidationSummary
                    ID="vsTimKiem" runat="server" ShowMessageBox="True" 
                ShowSummary="False" ValidationGroup="TimKiem" />
		    </label>
		    <label>
                <asp:Button ID="cmdTimKiem" runat="server" Text="Tìm kiếm tên khách hàng" 
                ValidationGroup="TimKiem" onclick="cmdTimKiem_Click" />
		    </label>
		    <label>
                <asp:Button ID="cmdShow" runat="server" Text="Hiện toàn bộ bản ghi" 
                onclick="cmdShow_Click" />
		    </label>
</div>
    
<div class="table">
    <asp:GridView ID="grvKhachHang" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MaKH" DataSourceID="sdsKhachHang" AllowPaging="True" 
        AllowSorting="True" CssClass="listing" 
        onselectedindexchanged="grvKhachHang_SelectedIndexChanged">
        <Columns>            
            <asp:BoundField DataField="TaiKhoan" HeaderText="TaiKhoan" 
                SortExpression="TaiKhoan" />
            <asp:BoundField DataField="MatKhau" HeaderText="MatKhau" 
                SortExpression="MatKhau" />
            <asp:BoundField DataField="TenKH" HeaderText="TenKH" SortExpression="TenKH" />
            <asp:BoundField DataField="DiaChi" HeaderText="DiaChi" 
                SortExpression="DiaChi" />
            <asp:BoundField DataField="MaTK" HeaderText="MaTK" SortExpression="MaTK" />
            <asp:BoundField DataField="SoTien" HeaderText="SoTien" DataFormatString="{0:n0} VND" 
                SortExpression="SoTien" />
            <asp:TemplateField HeaderText="Chức Năng">
            <ItemTemplate>
                <asp:ImageButton ID="ibDelete" runat="server" title="header=[Xóa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/hr.gif" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa bản ghi này hay không?');" />
                <asp:ImageButton ID="ibSelect" runat="server" title="header=[Sửa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/edit-icon.gif" CommandName="Select"/>
                <asp:HiddenField ID="hfMaKH" runat="server" Value='<%# Eval("MaKH") %>' />
            </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            Không có bản ghi nào!
        </EmptyDataTemplate>
    </asp:GridView>    

    <asp:SqlDataSource ID="sdsKhachHang" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT * FROM [tblKhachHang]" 
        DeleteCommand="DELETE FROM [tblKhachHang] WHERE [MaKH] = @MaKH" 
        InsertCommand="INSERT INTO [tblKhachHang] ([TaiKhoan], [MatKhau], [TenKH], [DiaChi], [MaTK], [SoTien]) VALUES (@TaiKhoan, @MatKhau, @TenKH, @DiaChi, @MaTK, @SoTien)" 
        UpdateCommand="UPDATE [tblKhachHang] SET [TaiKhoan] = @TaiKhoan, [MatKhau] = @MatKhau, [TenKH] = @TenKH, [DiaChi] = @DiaChi, [MaTK] = @MaTK, [SoTien] = @SoTien WHERE [MaKH] = @MaKH">
        <DeleteParameters>
            <asp:Parameter Name="MaKH" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TaiKhoan" Type="String" />
            <asp:Parameter Name="MatKhau" Type="String" />
            <asp:Parameter Name="TenKH" Type="String" />
            <asp:Parameter Name="DiaChi" Type="String" />
            <asp:Parameter Name="MaTK" Type="Int32" />
            <asp:Parameter Name="SoTien" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TaiKhoan" Type="String" />
            <asp:Parameter Name="MatKhau" Type="String" />
            <asp:Parameter Name="TenKH" Type="String" />
            <asp:Parameter Name="DiaChi" Type="String" />
            <asp:Parameter Name="MaTK" Type="Int32" />
            <asp:Parameter Name="SoTien" Type="Decimal" />
            <asp:Parameter Name="MaKH" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
<div id="quyenXem" runat="server">
<div style="border-top:2px solid #f70;margin-top:17px;" >
   <h3 style="color:#43729F">Chi tiết khách hàng</h3>
   <table cellpadding="0" cellspacing="0" style="padding-left: 100px">
        <tr>
            <td class="nhan">
                Mã khách hàng:</td>
            <td>
                <asp:Label ID="lMaKH" runat="server" Text="Tự động" Font-Bold=true ForeColor="Red"></asp:Label></td>
                <asp:HiddenField ID="hfMaKH" runat="server" />
        </tr>
    <tr>
        <td class="nhan">Tên đăng nhập: </td>
        <td><asp:TextBox ID="txtTenDN" runat="server" Width="245px"></asp:TextBox></td>
    </tr>

    <tr>
        <td class="nhan">Mật khẩu: </td>
        <td><asp:TextBox ID="txtMatKhau" runat="server" Width="245px"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="nhan">Nhập lại mật khẩu: </td>
        <td><asp:TextBox ID="txtNhapLaiMK" runat="server" CssClass="txtBox"></asp:TextBox></td>
    </tr>

    <tr>
        <td class="nhan">Tên khách hàng:</td>
        <td><asp:TextBox ID="txtTenKH" runat="server" CssClass="txtBox"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="nhan">Địa chỉ: </td>
        <td><asp:TextBox ID="txtDiachi" runat="server" Width="245" TextMode="MultiLine" Height="50"></asp:TextBox></td>
    </tr>

    <tr>
        <td class="nhan">Mã tài khoản: </td>
        <td><asp:Label ID="lbMaTK" runat="server" ForeColor="Blue"></asp:Label></asp:TextBox></td>
    </tr>

    <tr>
        <td class="nhan">Số tiền: </td>
        <td><asp:TextBox ID="txtSotien" runat="server" CssClass="txtBox"></asp:TextBox></td>
    </tr>
       <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
       </tr>
    <tr>

        <td colspan="2" style="text-align: center">
            <asp:Button ID="btnThemMoi" runat="server" Text="Thêm mới" 
                onclick="btnThemMoi_Click" />
            <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" 
                onclick="btnCapNhat_Click" />
            <asp:Button ID="btnReset" runat="server" Text="Làm lại" 
                onclick="btnReset_Click" />
        </td>
    </tr>
   </table>
</div>
</div>
</div>

</div>
</asp:Content>
