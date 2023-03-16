<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_DienThoai.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_DienThoai" %>
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
<h1>Quản lý thông tin điện thoại</h1>
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
                <asp:Button ID="cmdTimKiem" runat="server" Text="Tìm kiếm tên điện thoại" 
                ValidationGroup="TimKiem" onclick="cmdTimKiem_Click" />
		    </label>
		    <label>
                <asp:Button ID="cmdShow" runat="server" Text="Hiện toàn bộ bản ghi" 
                onclick="cmdShow_Click" />
		    </label>
</div>
<div class="table">
    <asp:GridView ID="gvDienThoai" runat="server" AllowPaging="True" 
        CssClass="listing" EmptyDataText="Không có bản ghi nào!" Width=100% CellPadding="0" 
        AllowSorting="True" AutoGenerateColumns=False DataKeyNames="IDDT" 
        DataSourceID="sdsDienThoai" 
        onselectedindexchanged="gvDienThoai_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="IDDT" HeaderText="Mã ĐT" InsertVisible="False" 
                ReadOnly="True" SortExpression="IDDT" />
            <asp:BoundField DataField="IDNSX" HeaderText="Mã NSX" SortExpression="IDNSX" />
            <asp:BoundField DataField="TenDT" HeaderText="Tên ĐT" SortExpression="TenDT" />
            <asp:BoundField DataField="Gia" DataFormatString="{0:n0} VNĐ" HeaderText="Giá" 
                SortExpression="Gia" />
            <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" 
                SortExpression="SoLuong" />
            <asp:TemplateField HeaderText="Chức Năng">
            <ItemTemplate>
                <asp:ImageButton ID="ibDelete" runat="server" title="header=[Xóa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/hr.gif" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa bản ghi này hay không?');" />
                <asp:ImageButton ID="ibSelect" runat="server" title="header=[Sửa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/edit-icon.gif" CommandName="Select"/>
            </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsDienThoai" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT * FROM [tblDienThoai] ORDER BY [IDDT] DESC" 
        DeleteCommand="DELETE FROM tblDienThoai WHERE (IDDT = @IDDT)">
        <DeleteParameters>
            <asp:Parameter Name="IDDT" />
        </DeleteParameters>
    </asp:SqlDataSource>
<div id="quyenXem" runat="server">
<div style="border-top:2px solid #f70;margin-top:17px;">
   <h3 style="color:#43729F">Chi tiết điện thoại</h3>

    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td class="nhan">
                Mã ĐT:
                <asp:HiddenField ID="hfMaDT" runat="server" />
            </td>
            <td>
                <asp:DropDownList ID="ddlMaDT" runat="server" DataSourceID="sdsMaDT" 
                    DataTextField="IDDT" DataValueField="IDDT" 
                    onselectedindexchanged="ddlMaDT_SelectedIndexChanged" AutoPostBack="True">

                    </asp:DropDownList>
                <asp:SqlDataSource ID="sdsMaDT" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
                    
                    
                    SelectCommand="SELECT [IDDT], [TenDT] FROM [tblDongPN] WHERE IDDT NOT IN (SELECT [IDDT] FROM [tblDienThoai])">
                </asp:SqlDataSource>
                <asp:Label ID="lbMaDT" runat="server" ForeColor="Red"></asp:Label>
                <asp:HiddenField ID="hfID"  runat="server" />
            </td>
        </tr>
        <tr>
            <td class="nhan">Số phiếu nhập: </td>
            <td><asp:Label ID="lbSoPN" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="nhan">
                Nhà sản xuất:</td>
            <td>
                <asp:DropDownList ID="ddlNSX" runat="server" DataSourceID="sdsNSX" 
                    DataTextField="TenNSX" DataValueField="IDNSX">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsNSX" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
                    SelectCommand="SELECT [IDNSX], [TenNSX] FROM [tblNSX]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="nhan">Tên điện thoại:</td>
            <td>
                <asp:TextBox ID="txtTenDT" runat="server" Height="18px" Width="245px"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rfvTenDT" runat="server" ErrorMessage="(*)" 
                    ControlToValidate="txtTenDT" Display="Dynamic" SetFocusOnError="True" 
                    ValidationGroup="DienThoai"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="nhan">Giá:</td>
            <td>
                <asp:TextBox ID="txtGia" runat="server" Height="18px" Width="143px"></asp:TextBox>&nbsp;<strong>Số lượng:</strong>&nbsp;<asp:TextBox ID="txtSL" runat="server" Height="18px" Width="40px"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="nhan">Kích thước:</td>
            <td>
                <asp:TextBox ID="txtKichThuoc" runat="server" Height="18px" Width="245px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="nhan">Trọng lượng:</td>
            <td><asp:TextBox ID="txtTrongLuong" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Camera Trước:</td>
            <td><asp:TextBox ID="txtCam" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">
                Nhà cung cấp: 
            </td>
            <td>
                <asp:DropDownList ID="ddlNCC" runat="server" DataSourceID="sdsNCC" 
                    DataTextField="TenNCC" DataValueField="IDNCC">                
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsNCC" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
                    SelectCommand="SELECT * FROM [tblNCC]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="nhan">Thẻ nhớ:</td>
            <td>
                <asp:DropDownList ID="ddlTheNho" runat="server">
                    <asp:ListItem Selected="True" Value="0">Không</asp:ListItem>
                    <asp:ListItem Value="1">Có</asp:ListItem>
                </asp:DropDownList>&nbsp;<strong>3G:</strong>&nbsp;<asp:DropDownList ID="ddl3G"
                    runat="server">
                    <asp:ListItem Selected="True" Value="0">Không</asp:ListItem>
                    <asp:ListItem Value="1">Có</asp:ListItem>
                </asp:DropDownList>&nbsp;<strong>Wifi:</strong>&nbsp;<asp:DropDownList ID="ddlWifi"
                    runat="server">
                    <asp:ListItem Selected="True" Value="0">Không</asp:ListItem>
                    <asp:ListItem Value="1">Có</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="nhan">Java:</td>
            <td>
                <asp:DropDownList ID="ddlJava" runat="server">
                    <asp:ListItem Selected="True" Value="0">Không</asp:ListItem>
                    <asp:ListItem Value="1">Có</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="nhan">Pin:</td>
            <td><asp:TextBox ID="txtPin" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Thời gian chờ:</td>
            <td><asp:TextBox ID="txtTGCho" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Thời gian đàm thoại:</td>
            <td><asp:TextBox ID="txtTGThoai" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Bảo hành:</td>
            <td><asp:TextBox ID="txtBaoHanh" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
         <tr>
            <td class="nhan">Phụ kiện:</td>
            <td><asp:TextBox ID="txtPhuKien" runat="server" Font-Names="Arial" Font-Size="Small" TextMode="MultiLine" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Lượt xem:</td>
            <td>
                <asp:TextBox ID="txtLuotXem" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Hình ảnh 1:</td>
            <td><asp:TextBox ID="txtHA" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Upload ảnh 1:</td>
            <td>
                <asp:FileUpload ID="fuHA" runat="server" /></td>
        </tr>
        <tr>
            <td class="nhan">Hình ảnh 2:</td>
            <td><asp:TextBox ID="txtHA2" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Upload ảnh 2:</td>
            <td>
                <asp:FileUpload ID="fuHA2" runat="server" /></td>
        </tr>
        <tr>
            <td class="nhan">Hình ảnh 3:</td>
            <td><asp:TextBox ID="txtHA3" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Upload ảnh 3:</td>
            <td>
                <asp:FileUpload ID="fuHA3" runat="server" /></td>
        </tr>
        <tr>
            <td class="nhan">Hình ảnh 4:</td>
            <td><asp:TextBox ID="txtHA4" runat="server" Height="18px" Width="245px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="nhan">Upload ảnh 4:</td>
            <td>
                <asp:FileUpload ID="fuHA4" runat="server" /></td>
        </tr>
        
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="cmdCapNhat" runat="server" Text="Cập nhật" 
                    ValidationGroup="DienThoai" onclick="cmdCapNhat_Click" />&nbsp;<asp:Button 
                    ID="cmdThem" runat="server" 
                    Text="Thêm mới" ValidationGroup="DienThoai" onclick="cmdThem_Click" />&nbsp;<asp:Button
                        ID="cmdHuy" runat="server" Text="Hủy bỏ" onclick="cmdHuy_Click" />
            </td>
        </tr>
    </table>
</div>   
</div>
</div>
</div>
</asp:Content>
