<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_NguoiSuDung.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_NguoiSuDung" %>
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
<h1>Quản lý tài khoản người sử dụng</h1>
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
                <asp:Button ID="cmdTimKiem" runat="server" Text="Tìm kiếm tên đăng nhập" 
                ValidationGroup="TimKiem" onclick="cmdTimKiem_Click" />
            
			</label>
			    <asp:Button ID="cmdShow" runat="server"
                    Text="Hiện toàn bộ bản ghi" onclick="cmdShow_Click" />
		  </div>
<div class="table">
    <asp:GridView ID="gvNguoiSuDung" runat="server" AllowPaging="True" 
        AutoGenerateColumns="false" Width="100%" CssClass="listing" 
        AllowSorting="True" CellPadding="0" DataKeyNames="TenDangNhap" 
        DataSourceID="sdsNguoiSuDung" 
        onselectedindexchanged="gvNguoiSuDung_SelectedIndexChanged" 
        EmptyDataText="Không có bản ghi nào!">
        <Columns>
            <asp:BoundField DataField="TenDangNhap" HeaderText="Tên Đăng Nhập" 
                ReadOnly="True" SortExpression="TenDangNhap" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" SortExpression="HoTen" />
            <asp:BoundField DataField="SDT" HeaderText="SĐT" SortExpression="SDT" />
            <asp:TemplateField HeaderText="Quyền" SortExpression="Quyen">
            <ItemTemplate><%# checkout(Convert.ToInt32(Eval("Quyen"))) %><asp:HiddenField ID="hfMK"
                    runat="server" Value='<%# Eval("MatKhau") %>' /><asp:HiddenField ID="hfQuyen"
                    runat="server" Value='<%# Eval("Quyen") %>' />
            </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Chức Năng">
            <ItemTemplate>
                <asp:ImageButton ID="ibDelete" runat="server" title="header=[Xóa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/hr.gif" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa bản ghi này hay không?');" />
                <asp:ImageButton ID="ibSelect" runat="server" title="header=[Sửa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/edit-icon.gif" CommandName="Select"/>
            </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsNguoiSuDung" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT * FROM [tblNguoiSuDung]" 
        DeleteCommand="DELETE FROM tblNguoiSuDung WHERE (TenDangNhap = @TenDangNhap)">
        <DeleteParameters>
            <asp:Parameter Name="TenDangNhap" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <div id="quyenXem" runat="server">
   <div style="border-top:2px solid #f70;margin-top:17px;">
   <h3 style="color:#43729F">Thông tin người sử dụng</h3>
   <table cellpadding="0" cellspacing="0" class="style1">
       <tr>
           <td class="nhan">
               Tên đăng nhập:</td>
           <td>
               <asp:TextBox ID="txtTenDN" runat="server" Height="18px" Width="245px" 
                   MaxLength="20"></asp:TextBox><asp:RequiredFieldValidator
                   ID="rfvTenDN" runat="server" ErrorMessage="(*)" 
                   ControlToValidate="txtTenDN" Display="Dynamic" SetFocusOnError="True" 
                   ValidationGroup="NguoiSuDung"></asp:RequiredFieldValidator></td>
       </tr>
       <tr>
           <td class="nhan">
               Mật khẩu:</td>
           <td>
               <asp:TextBox ID="txtMK" runat="server" Height="18px" MaxLength="30" 
                   TextMode="Password" Width="245px"></asp:TextBox><asp:RequiredFieldValidator ID="rfvMK"
                       runat="server" ErrorMessage="(*)" ControlToValidate="txtMK" 
                   Display="Dynamic" SetFocusOnError="True" ValidationGroup="NguoiSuDung"></asp:RequiredFieldValidator></td>
       </tr>
       <tr>
            <td class="nhan">
                Gõ lại mật khẩu:
            </td>
            <td>
                <asp:TextBox ID="txtMK2" runat="server" Height="18px" MaxLength="30" 
                    TextMode="Password" Width="245px"></asp:TextBox><asp:CompareValidator ID="cvMK"
                        runat="server" ErrorMessage="(*)" ControlToCompare="txtMK2" 
                    ControlToValidate="txtMK" Display="Dynamic" SetFocusOnError="True" 
                    ValidationGroup="NguoiSuDung"></asp:CompareValidator>
            </td>
       </tr>
       <tr>
            <td class="nhan">Email:</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Height="18px" Width="245px" MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rfvEmail" runat="server" ErrorMessage="(*)" 
                    ValidationGroup="NguoiSuDung" SetFocusOnError="True" 
                    ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
       </tr>
       <tr>
            <td class="nhan">Họ và tên:</td>
            <td>
                <asp:TextBox ID="txtHoTen" runat="server" Height="18px" MaxLength="50" 
                    Width="245px"></asp:TextBox><asp:RequiredFieldValidator ID="rfvHoTen"
                        runat="server" ErrorMessage="(*)" ControlToValidate="txtHoTen" 
                    Display="Dynamic" SetFocusOnError="True" ValidationGroup="NguoiSuDung"></asp:RequiredFieldValidator>
            </td>
       </tr>
       <tr>
            <td class="nhan">Số điện thoại:</td>
            <td>
                <asp:TextBox ID="txtSDT" runat="server" Height="18px" MaxLength="50" 
                    Width="245px"></asp:TextBox><asp:RegularExpressionValidator ID="revSDT"
                        runat="server" ErrorMessage="(*)" ControlToValidate="txtSDT" 
                    Display="Dynamic" SetFocusOnError="True" ValidationExpression="\d*" 
                    ValidationGroup="NguoiSuDung"></asp:RegularExpressionValidator>
            </td>
       </tr>
       <tr>
            <td class="nhan">Quyền:</td>
            <td>
                <asp:DropDownList ID="ddlQuyen" runat="server">
                    <asp:ListItem Selected="True" Value="1">Admin</asp:ListItem>
                    <asp:ListItem Value="2">Nhân viên</asp:ListItem>
                </asp:DropDownList>
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
                    ValidationGroup="NguoiSuDung" onclick="cmdCapNhat_Click" />&nbsp;<asp:Button
                    ID="cmdThem" runat="server" Text="Thêm mới" ValidationGroup="NguoiSuDung" 
                    onclick="cmdThem_Click" />&nbsp;<asp:Button
                        ID="cmdHuyBo" runat="server" Text="Hủy bỏ" onclick="cmdHuyBo_Click" /></td>
       </tr>
       </table>

   </div> 
   </div>
</div>

</div>
</asp:Content>
