<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_PhieuXuat.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_PhieuXuat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="left-column">
</div>
<div id="center-column">
<div class="top-bar">
<h1>Quản lý phiếu xuất</h1>
</div>
<div class="select-bar">
            <label>
                <asp:TextBox ID="txtTimKiem" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rfvTimKiem" runat="server" 
                ErrorMessage="Bạn cần nhập từ khóa tìm kiếm!" ControlToValidate="txtTimKiem" 
                Display="None" SetFocusOnError="True" ValidationGroup="TimKiem"></asp:RequiredFieldValidator> <asp:ValidationSummary
                    ID="vsTimKiem" runat="server" ShowMessageBox="True" 
                ShowSummary="False" ValidationGroup="TimKiem" /> </label>
		    <label>
                <asp:Button ID="cmdTimKiem" runat="server" Text="Tìm kiếm tên đăng nhập" 
                ValidationGroup="TimKiem" onclick="cmdTimKiem_Click" />
		    </label>
		    <label>
                <asp:Button ID="cmdShow" runat="server" Text="Hiện toàn bộ bản ghi" 
                onclick="cmdShow_Click" />
		    </label>
	</div>	    
    <asp:GridView ID="gvPhieuXuat" runat="server" Width="100%" CssClass="listing" AutoGenerateColumns=False 
        EmptyDataText="Không có bản ghi nào!" AllowPaging="True" CellPadding="0" 
        AllowSorting="True" DataSourceID="sdsPhieuXuat" 
        DataKeyNames="SoPX,MaKH" 
        onselectedindexchanged="gvPhieuXuat_SelectedIndexChanged">
        <Columns>
            
            <asp:BoundField DataField="SoPX" HeaderText="SoPX" 
                SortExpression="SoPX" ReadOnly="True" />
            <asp:BoundField DataField="TaiKhoan" HeaderText="TaiKhoan" 
                SortExpression="TaiKhoan" />
            <asp:BoundField DataField="TenKH" HeaderText="TenKH" SortExpression="TenKH" />
            <asp:BoundField DataField="NgayXuat" HeaderText="NgayXuat" 
                SortExpression="NgayXuat" />
            <asp:BoundField DataField="DiaChiGiao" HeaderText="DiaChiGiao" 
                SortExpression="DiaChiGiao" />
            <asp:BoundField DataField="TongTien" HeaderText="TongTien" 
                SortExpression="TongTien" DataFormatString="{0:n0} VND" />
            <asp:TemplateField HeaderText="Chức Năng">
                <ItemTemplate>
                    <asp:ImageButton ID="ibDelete" runat="server" title="header=[Xóa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/hr.gif" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa bản ghi này hay không?');" />
                    <asp:ImageButton ID="ibSelect" runat="server" title="header=[Sửa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/edit-icon.gif" CommandName="Select"/>
                </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>           


        </Columns>

    </asp:GridView>
           
		   

    <asp:SqlDataSource ID="sdsPhieuXuat" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        
        SelectCommand="select tblPhieuXuat.*, tblKhachHang.TaiKhoan, tblKhachHang.TenKH From tblPhieuXuat inner join tblKhachHang on tblPhieuXuat.MaKH = tblKhachHang.MaKH" 
        DeleteCommand="DELETE FROM tblPhieuXuat WHERE (SoPX = @SoPX)"
        UpdateCommand="UPDATE [tblPhieuXuat] SET [DiaChiGiao] = @DiaChi WHERE [SoPX] = @SoPX">
        <DeleteParameters>
            <asp:Parameter Name="SoPX" />
        </DeleteParameters>
         <UpdateParameters>
                    <asp:Parameter Name="DiaChiGiao" Type="String" />
                    <asp:Parameter Name="SoPX" Type="Int32" />
                </UpdateParameters>
    </asp:SqlDataSource>
           
		   

<div class="table">
<div style="border-top:2px solid #f70;margin-top:17px;">
   <h3 style="color:#43729F">Chi tiết phiếu xuất</h3>

    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td class="nhan">
                Số phiếu xuất:</td>
            <td>
                <asp:Label ID="lPhieuXuat" runat="server" Text="Tự động" ForeColor="Red"></asp:Label></td>
                <asp:HiddenField ID="hfPhieuXuat" runat="server" />
        </tr>
        <tr>
           <td class="nhan">Họ tên:</td>
            <td>
                <asp:TextBox ID="txtHoTen" runat="server" 
                    Width="180px"></asp:TextBox>
            </td>
        </tr>
        <tr>
           <td class="nhan">Ngày Xuất:</td>
            <td>
                <asp:TextBox ID="txtNgayXuat" runat="server" 
                    Width="180px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="nhan">Địa chỉ giao: </td>
            <td>
                <asp:TextBox ID="txtDiaChi" TextMode="MultiLine" Rows="3" Width="255" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="nhan">Chi tiết phiếu xuất: </td>
            <td>
                <asp:GridView ID="gvChiTietPX" runat="server" DataSourceID="sdsChiTietPX" 
                CssClass="listing" AutoGenerateColumns="false" Width="100%" >
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                            <ItemTemplate>
                                 <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <HeaderStyle ForeColor="Black" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="TenDT" HeaderText="Tên Điện Thoại" />
                        <asp:BoundField DataField="SoLuongMua" HeaderText="Số lượng mua" />
                        <asp:BoundField DataField="SoLuong" HeaderText="Trong Kho" />
                        <asp:BoundField DataField="GiaBan" HeaderText="Giá" DataFormatString="{0:n0} VND" />
                    </Columns>
                    <EmptyDataTemplate>
                        Không có bản ghi nào!
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsChiTietPX" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>"></asp:SqlDataSource>
            </td>
        </tr>        
        <tr>
            <td class="nhan">&nbsp;</td>
            <td>&nbsp;</td>
       </tr>  
       <tr>
        <td>
            
        </td>
        <td>
        <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" 
                onclick="btnCapNhat_Click" />
        </td>
       </tr>     
    </table>
</div>   
</div>
</div>
</asp:Content>
