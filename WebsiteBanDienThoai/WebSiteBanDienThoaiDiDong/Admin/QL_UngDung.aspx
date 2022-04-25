<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_UngDung.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_UngDung" %>
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
<h1>Quản lý ứng dụng</h1>
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
                <asp:Button ID="cmdTimKiem" runat="server" Text="Tìm kiếm ứng dụng" 
                ValidationGroup="TimKiem" onclick="cmdTimKiem_Click" />
		    </label>
		    <label>
                <asp:Button ID="cmdShow" runat="server" Text="Hiện toàn bộ bản ghi" 
                onclick="cmdShow_Click" />
		    </label>
</div>
<div class="table">
    <asp:GridView ID="gvUngDung" runat="server" AllowPaging="True" 
        CssClass="listing" AutoGenerateColumns=False 
        EmptyDataText="Không có bản ghi nào!" Width="100%" CellPadding="0" 
        AllowSorting="True" DataKeyNames="MaUngDung" DataSourceID="sdsUngDung" 
        onselectedindexchanged="gvUngDung_SelectedIndexChanged" PageSize="5">
        <Columns>
            <asp:BoundField DataField="MaUngDUng" HeaderText="Mã Số" InsertVisible="False" 
                ReadOnly="True" SortExpression="MaUngDung" />
            <asp:BoundField DataField="TenUngDung" HeaderText="Tên Ứng Dụng" 
                SortExpression="TenUngDung" />
            <asp:BoundField DataField="TomTat" HeaderText="Tóm Tắt" 
                SortExpression="TomTat" />
            <asp:BoundField DataField="NoiDung" HeaderText="Nội Dung" 
                SortExpression="NoiDung" />
             <asp:BoundField DataField="DongMay" HeaderText="Dòng Máy" 
                SortExpression="DongMay" />
             <asp:BoundField DataField="PhienBan" HeaderText="Phiên Bản" 
                SortExpression="PhienBan" />
            <asp:BoundField DataField="NgayCapNhat" HeaderText="Ngày Cập Nhật" 
                SortExpression="NgayCapNhat" />
            <asp:BoundField DataField="CTyPhatHanh" HeaderText="Công Ty Phát Hành" 
                SortExpression="CTyPhatHanh" />
             <asp:BoundField DataField="HinhAnh" HeaderText="Hình Ảnh" 
                SortExpression="HinhAnh" />
             <asp:BoundField DataField="File" HeaderText="File" 
                SortExpression="File" />
            <asp:TemplateField HeaderText="Chức Năng">
            <ItemTemplate>
                <asp:ImageButton ID="ibDelete" runat="server" title="header=[Xóa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/hr.gif" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa bản ghi này hay không?');" />
                <asp:ImageButton ID="ibSelect" runat="server" title="header=[Sửa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/edit-icon.gif" CommandName="Select"/>
            </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsUngDung" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT * FROM [tblUngDung] ORDER BY [MaUngDung] DESC" 
        DeleteCommand="DELETE FROM tblUngDung WHERE (MaUngDung = @MaUngDung)">
        <DeleteParameters>
            <asp:Parameter Name="MaUngDung" />
        </DeleteParameters>
    </asp:SqlDataSource>
<div id="quyenXem" runat="server">
<div style="border-top:2px solid #f70;margin-top:17px;">
   <h3 style="color:#43729F">Chi tiết ứng dụng</h3>
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td class="nhan">
                Mã ứng dụng:</td>
            <td>
                <asp:Label ID="lMaUngDung" runat="server" Text="Tự động" Font-Bold="True" 
                    ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td class="nhan">
                Tên ứng dụng</td>
            <td>
                <asp:TextBox ID="txtTenUngDung" runat="server" Height="18px" Width="300px"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rfvTenUngDung" runat="server" ErrorMessage="(*)" 
                    ControlToValidate="txtTenUngDung" Display="Dynamic" SetFocusOnError="True" 
                    ValidationGroup="TinTuc"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="nhan">Tóm tắt:</td>
            <td>
                <asp:TextBox ID="txtTomTat" runat="server" TextMode="MultiLine" Font-Names="Arial" Font-Size="Small" Width="300px" Height="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="nhan">Nội Dung:</td>
            <td><FCKeditorV2:FCKeditor ID="fckNoiDung" runat=server BasePath="~/fckeditor/"></FCKeditorV2:FCKeditor></td>
        </tr>
        <tr>
            <td class="nhan">Dòng máy:</td>
            <td>
                <asp:TextBox ID="txtDongMay" runat="server" TextMode="MultiLine" Font-Names="Arial" Font-Size="Small" Width="300px" Height="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="nhan">Phiên bản:</td>
            <td>
                <asp:TextBox ID="txtPhienBan" runat="server" Height="18px" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="nhan">Ngày cập nhật:</td>
            <td>
                <asp:TextBox ID="txtNgayCapNhat" runat="server" Height="18px" Width="300px"></asp:TextBox><asp:Calendar
                    ID="Calendar1" runat="server" 
                    onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="nhan">Công ty phát hành:</td>
            <td>
                <asp:TextBox ID="txtCTyPhatHanh" runat="server" Height="18px" Width="300px"></asp:TextBox>
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
            <td class="nhan">File phần mềm:</td>
            <td>
                  <table width="100%">
                        <tr>
                            <td class="checkbox">
                                <asp:RadioButtonList ID="rdLuaChon" runat="server">
                        <asp:ListItem Selected="True" Value="01">Chọn đường dẫn</asp:ListItem>
                        <asp:ListItem Value="02">Chọn File tải lên</asp:ListItem>
                    </asp:RadioButtonList>
                            </td>
                            <td>
                                &nbsp;<asp:TextBox ID="txtDuongDan" runat="server" CssClass="smallfont" Width="86.2%"></asp:TextBox><br />
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lbFiletruoc" runat="server" CssClass="smallfont"></asp:Label>
                                <asp:Label ID="lbFile" runat="server" CssClass="smallfont"></asp:Label>
                            </td>
                        </tr>
                    </table>
                                        
               
            </td>
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