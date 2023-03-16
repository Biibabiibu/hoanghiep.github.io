<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_TinTuc.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_TinTuc" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
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
<h1>Quản lý tin tức</h1>
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
                <asp:Button ID="cmdTimKiem" runat="server" Text="Tìm kiếm tiêu đề" 
                ValidationGroup="TimKiem" onclick="cmdTimKiem_Click" />
		    </label>
		    <label>
                <asp:Button ID="cmdShow" runat="server" Text="Hiện toàn bộ bản ghi" 
                onclick="cmdShow_Click" />
		    </label>
</div>
<div class="table">
    <asp:GridView ID="gvTinTuc" runat="server" AllowPaging="True" 
        CssClass="listing" AutoGenerateColumns=False 
        EmptyDataText="Không có bản ghi nào!" Width="100%" CellPadding="0" 
        AllowSorting="True" DataKeyNames="MaTinTuc" DataSourceID="sdsTinTuc" 
        onselectedindexchanged="gvTinTuc_SelectedIndexChanged" PageSize="5">
        <Columns>
            <asp:BoundField DataField="MaTinTuc" HeaderText="Mã Số" InsertVisible="False" 
                ReadOnly="True" SortExpression="MaTinTuc" />
            <asp:BoundField DataField="TieuDe" HeaderText="Tiêu Đề" 
                SortExpression="TieuDe" />
            <asp:BoundField DataField="TomTat" HeaderText="Tóm Tắt" 
                SortExpression="TomTat" />
            <asp:BoundField DataField="NgayDangTin" HeaderText="Ngày Đăng" 
                SortExpression="NgayDangTin" />
            <asp:BoundField DataField="TacGia" HeaderText="Tác Giả" 
                SortExpression="TacGia" />
            <asp:TemplateField HeaderText="Chức Năng">
            <ItemTemplate>
                <asp:ImageButton ID="ibDelete" runat="server" title="header=[Xóa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/hr.gif" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa bản ghi này hay không?');" />
                <asp:ImageButton ID="ibSelect" runat="server" title="header=[Sửa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/edit-icon.gif" CommandName="Select"/>
            </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsTinTuc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT * FROM [tblTinTuc] ORDER BY [MaTinTuc] DESC" 
        DeleteCommand="DELETE FROM tblTinTuc WHERE (MaTinTuc = @MaTinTuc)">
        <DeleteParameters>
            <asp:Parameter Name="MaTinTuc" />
        </DeleteParameters>
    </asp:SqlDataSource>
<div id="quyenXem" runat="server">
<div style="border-top:2px solid #f70;margin-top:17px;">
   <h3 style="color:#43729F">Chi tiết tin tức</h3>
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td class="nhan">
                Mã tin tức:</td>
            <td>
                <asp:Label ID="lMaTin" runat="server" Text="Tự động" Font-Bold="True" 
                    ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td class="nhan">
                Tiêu đề:</td>
            <td>
                <asp:TextBox ID="txtTieuDe" runat="server" Height="18px" Width="300px"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rfvTieuDe" runat="server" ErrorMessage="(*)" 
                    ControlToValidate="txtTieuDe" Display="Dynamic" SetFocusOnError="True" 
                    ValidationGroup="TinTuc"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="nhan">Tóm tắt:</td>
            <td>
                <asp:TextBox ID="txtTomTat" runat="server" TextMode="MultiLine" Font-Names="Arial" Font-Size="Small" Width="640px" Height="50px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="nhan">Nội Dung:</td>
            <td><FCKeditorV2:FCKeditor ID="fckNoiDung" runat="server" BasePath="~/fckeditor/"></FCKeditorV2:FCKeditor></td>
        </tr>
        <tr>
            <td class="nhan">Ngày đăng tin:</td>
            <td>
                <asp:TextBox ID="txtNgayDang" runat="server" Height="18px" Width="300px"></asp:TextBox><asp:Calendar
                    ID="Calendar1" runat="server" 
                    onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="nhan">Tác giả:</td>
            <td>
                <asp:TextBox ID="txtTacGia" runat="server" Height="18px" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="nhan">Hình ảnh:</td>
            <td>
                <asp:TextBox ID="txtHinhAnh" runat="server" Height="18px" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="nhan">Upload hình ảnh:</td>
            <td>
                <asp:FileUpload ID="fuHinhAnh" runat="server" /></td>
        </tr>
         <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
       </tr>
       <tr>
            <td></td>
            <td>
                <asp:Button ID="cmdCapNhat" runat="server" Text="Cập nhật" 
                    ValidationGroup="TinTuc" onclick="cmdCapNhat_Click" />&nbsp;<asp:Button 
                    ID="cmdThem" runat="server" 
                    Text="Thêm mới" ValidationGroup="TinTuc" onclick="cmdThem_Click" />&nbsp;<asp:Button ID="cmdHuyBo" runat="server" Text="Hủy bỏ" 
                    onclick="cmdHuyBo_Click" />
            </td>
       </tr>
    </table>
</div>   
</div>
</div>
</div>
</asp:Content>
