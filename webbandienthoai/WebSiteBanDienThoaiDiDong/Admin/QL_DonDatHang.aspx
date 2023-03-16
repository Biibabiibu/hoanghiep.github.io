<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_DonDatHang.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_DonDatHang1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="left-column">
</div>
<div id="center-column">
<div class="top-bar">
<h1>Quản lý đơn hàng</h1>
</div>
<div class="select-bar">
            <label>
                <asp:TextBox ID="txtTimKiem" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rfvTimKiem" runat="server" 
                ErrorMessage="Bạn cần nhập từ khóa tìm kiếm!" ControlToValidate="txtTimKiem" 
                Display="None" SetFocusOnError="True" ValidationGroup="TimKiem"></asp:RequiredFieldValidator><asp:ValidationSummary
                    ID="vsTimKiem" runat="server" ShowMessageBox="True" 
                ShowSummary="False" ValidationGroup="TimKiem" />
		    </label>
		    <label>
                <asp:Button ID="cmdTimKiem" runat="server" Text="Tìm kiếm khách hàng" 
                ValidationGroup="TimKiem" onclick="cmdTimKiem_Click" /></label>
		    <label>
                <asp:Button ID="cmdShow" runat="server" Text="Hiện toàn bộ bản ghi" 
                onclick="cmdShow_Click" />
                </label>
                <label>
                <asp:Button ID="cmdTimKiem0" runat="server" Text="Đã thanh toán"  
                 onclick="cmdTimKiemDTT_Click" /></label>
                 <label>
                <asp:Button ID="cmdTimKiem1" runat="server" Text="Chưa thanh toán"  
                 onclick="cmdTimKiemCTT_Click" /></label>
</div>
<div class="table">
    <asp:GridView ID="gvDonHang" runat="server" AllowPaging="True" 
        CssClass="listing" AutoGenerateColumns=False 
        EmptyDataText="Không có bản ghi nào!" Width="100%" CellPadding="0" 
        AllowSorting="True" DataKeyNames="IDDonHang" DataSourceID="sdsDonHang" 
        onselectedindexchanged="gvDonHang_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="IDDonHang" HeaderText="IDDonHang" ReadOnly="True" 
                SortExpression="IDDonHang" />
            <asp:BoundField DataField="TaiKhoan" HeaderText="TaiKhoan" 
                SortExpression="TaiKhoan" />
            <asp:BoundField DataField="TenKH" HeaderText="TenKH" SortExpression="TenKH" />
            <asp:BoundField DataField="NgayLap" HeaderText="NgayLap" 
                SortExpression="NgayLap" />
            <asp:BoundField DataField="DiaChiGiao" HeaderText="DiaChiGiao" 
                SortExpression="DiaChiGiao" />
            <asp:BoundField DataField="TongTien" HeaderText="TongTien" 
                SortExpression="TongTien" DataFormatString="{0:n0} VND" />
            <asp:BoundField DataField="TrangThai" HeaderText="TrangThai" 
                SortExpression="TrangThai" />

            <asp:TemplateField HeaderText="Chức Năng">
            <ItemTemplate>
                <asp:ImageButton ID="ibDelete" runat="server" title="header=[Xóa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/hr.gif" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa bản ghi này hay không?');" />
                <asp:ImageButton ID="ibSelect" runat="server" title="header=[Sửa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/edit-icon.gif" CommandName="Select"/>
                <asp:HiddenField ID="hfNgayHuy" Value='<%# Eval("NgayHuy") %>' runat="server" />
            </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsDonHang" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>"                 
        SelectCommand="SELECT tblDonHang.IDDonHang, tblDonHang.TaiKhoan, tblDonHang.NgayLap, tblDonHang.DiaChiGiao, tblDonHang.TongTien, tblDonHang.TrangThai, tblDonHang.NgayHuy, tblKhachHang.TenKH FROM tblDonHang INNER JOIN tblKhachHang ON tblDonHang.TaiKhoan = tblKhachHang.TaiKhoan  ORDER BY tblDonHang.IDDonHang DESC" 
        DeleteCommand="DELETE FROM tblDonHang WHERE (IDDonHang = @IDDonHang)">
        <DeleteParameters>
            <asp:Parameter Name="IDDonHang" />
        </DeleteParameters>
    </asp:SqlDataSource>
<div style="border-top:2px solid #f70;margin-top:17px;">
   <h3 style="color:#43729F">Chi tiết đơn hàng</h3>

    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td class="nhan">
                Mã ĐH:</td>
            <td>
                <asp:Label ID="lMaDH" runat="server" Text="Tự động" Font-Bold="True" 
                    ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td class="nhan">
                ID khách hàng:</td>
            <td>
                <asp:TextBox ID="txtTenDN" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Họ và tên:</td>
            <td>
                <asp:TextBox ID="txtHoTen" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Ngày lập đơn:</td>
            <td>
                <asp:TextBox ID="txtNgayLap" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Ngày hủy đơn:</td>
            <td>
                <asp:TextBox ID="txtNgayHuy" runat="server" Height="18px" Width="245px"></asp:TextBox></td>                
        </tr>
        <tr>
            <td class="nhan">Địa chỉ giao hàng:</td>
            <td>
                <asp:TextBox ID="txtDC" runat="server" Width="245px" TextMode="MultiLine" Font-Names="Arial" Font-Size="Small"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Chi tiết ĐH:</td>
            <td>
                <asp:GridView ID="gvChiTietDH" runat="server" AllowPaging="True" 
                    AutoGenerateColumns=False CssClass="listing" 
                    EmptyDataText="Không có bản ghi nào!" CellPadding="0" 
                    DataKeyNames="IDDonHang,IDDT" DataSourceID="sdsChiTietDH" Width=100%>
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                            <ItemTemplate>
                                 <%# Container.DataItemIndex + 1 %>
                                 <asp:HiddenField ID="hfID" Value='<%# Eval("IDDT")  %>' runat="server" />
                            </ItemTemplate>
                            <HeaderStyle ForeColor="Black" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="TenDT" HeaderText="Tên ĐT" 
                            SortExpression="TenDT" >
                            <HeaderStyle ForeColor="Black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SLMua" HeaderText="Số Lượng Mua" 
                            SortExpression="SLMua" >
                            <HeaderStyle ForeColor="Black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SoLuong" HeaderText="Trong Kho" 
                            SortExpression="SoLuong" >
                            <HeaderStyle ForeColor="Black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Gia" HeaderText="Giá" SortExpression="Gia" 
                            DataFormatString="{0:n0} VNĐ" >
                            <HeaderStyle ForeColor="Black" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsChiTietDH" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" >
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="nhan">Tổng tiền:</td>
            <td>
                <asp:Label ID="lTongTien" runat="server" Font-Bold="True" ForeColor="Red" Text="Tiền thanh toán đơn hàng"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="nhan">Trạng thái:</td>
            <td>
                <asp:DropDownList ID="ddlTrangThai" runat="server">
                    <asp:ListItem Selected="True" Value="0">Chưa thanh toán</asp:ListItem>
                    <asp:ListItem Value="1">Đã thanh toán</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td></td>
            <td align=center>
                <asp:Button ID="cmdCapNhat" runat="server" Text="Cập nhật" 
                    onclick="cmdCapNhat_Click" />
            </td>
        </tr>
    </table>
</div>   
</div>
</div>
</asp:Content>
