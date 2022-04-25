<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_QuyenSD.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_QuyenSD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style type="text/css">
        .style1
        {
            padding-left: 100px;            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="left-column">
</div>
<div id="center-column">
<div class="top-bar">
<h1>Quản lý quyền sử dụng</h1>
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
    <asp:GridView ID="gvChucNang" runat="server" Width="100%" CssClass="listing" AutoGenerateColumns="False"
        EmptyDataText="Không có bản ghi nào!" AllowPaging="True" CellPadding="0" 
        AllowSorting="True" DataSourceID="sdsQuyen" 
        onselectedindexchanged="gvChucNang_SelectedIndexChanged" DataKeyNames="ID">
        <Columns>

            <asp:BoundField DataField="TenDangNhap" HeaderText="TenDangNhap" 
                SortExpression="TenDangNhap" />
            <asp:BoundField DataField="IDChucNang" HeaderText="IDChucNang" 
                SortExpression="IDChucNang" />
            <asp:BoundField DataField="MoTa" HeaderText="MoTa" 
                SortExpression="MoTa" />
            <asp:BoundField DataField="Page" HeaderText="Trang" 
                SortExpression="Page" />
            <asp:TemplateField HeaderText="Chức Năng">
            <ItemTemplate>
                <asp:ImageButton ID="ibDelete" runat="server" title="header=[Xóa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/hr.gif" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa bản ghi này hay không?');" />
                <asp:ImageButton ID="ibSelect" runat="server" title="header=[Sửa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/edit-icon.gif" CommandName="Select"/>                
                <asp:HiddenField ID="hfID" Value='<%# Eval("ID") %>' runat="server" />
            </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
           
		   

    <asp:SqlDataSource ID="sdsQuyen" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT * FROM [tblQuyen]" 
        DeleteCommand="DELETE FROM [tblQuyen] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [tblQuyen] ([TenDangNhap], [IDChucNang], [MoTa]) VALUES (@TenDangNhap, @IDChucNang, @MoTa)" 
        UpdateCommand="UPDATE [tblQuyen] SET [TenDangNhap] = @TenDangNhap, [IDChucNang] = @IDChucNang, [MoTa] = @MoTa WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenDangNhap" Type="String" />
            <asp:Parameter Name="IDChucNang" Type="Int32" />
            <asp:Parameter Name="MoTa" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenDangNhap" Type="String" />
            <asp:Parameter Name="IDChucNang" Type="Int32" />
            <asp:Parameter Name="MoTa" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
           
		   

<div class="table">
<div style="border-top:2px solid #f70;margin-top:17px;">
   <h3 style="color:#43729F">Chi tiết Quyền sử dụng</h3>

    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td class="nhan">
                Tên đăng nhập:</td>
            <td>
                <asp:TextBox ID="txtTenDN" runat="server" Height="18px" Width="245px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtTenDN" ValidationGroup="cn" runat="server" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                <asp:HiddenField ID="hfIDCN" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="nhan">
                Chức năng:</td>
            <td>
                <asp:DropDownList ID="ddlChucNang" runat="server" DataSourceID="sdsCN" 
                    DataTextField="TenChucNang" DataValueField="IDChucNang" Width="80px" 
                    Height="21px" AutoPostBack="True" 
                    onselectedindexchanged="ddlChucNang_SelectedIndexChanged"></asp:DropDownList>
                <asp:SqlDataSource ID="sdsCN" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
                    SelectCommand="SELECT [IDChucNang], [TenChucNang] FROM [tblChucNang]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="nhan">Quyền thực thi: </td>
            <td>
                <asp:CheckBoxList ID="cbPage" runat="server" RepeatColumns="3" 
                    RepeatDirection="Vertical">
                <asp:ListItem Text="QL_NguoiSuDung [0]" Value="0"></asp:ListItem>
                <asp:ListItem Text="QL_KhachHang [1]" Value="1"></asp:ListItem>
                <asp:ListItem Text="QL_LienHe [2]" Value="2"></asp:ListItem>
                <asp:ListItem Value="3">QL_TinTuc [3]</asp:ListItem>
                <asp:ListItem Value="4">QL_NhaSanXuat [4]</asp:ListItem>
                <asp:ListItem Value="5">QL_DienThoai [5]</asp:ListItem>
                <asp:ListItem Value="6">QL_NhaCungCap [6]</asp:ListItem>
                <asp:ListItem Value="7">QL_ChucNang [7]</asp:ListItem>
                <asp:ListItem Value="8">QL_QuyenSD [8]</asp:ListItem>
                <asp:ListItem Value="9">QL_Comment [9]</asp:ListItem>
                                            
                </asp:CheckBoxList>  
                &nbsp;
                <asp:LinkButton ID="lbCheckAll" runat="server" onclick="lbCheckAll_Click">Chọn tất cả</asp:LinkButton>
                &nbsp;&nbsp;
                <asp:LinkButton ID="lbUnCheckAll" runat="server" onclick="lbUnCheckAll_Click">Bỏ chọn tất cả</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="nhan">Mô tả:</td>
            <td>
                <asp:TextBox ID="txtMota" runat="server" TextMode="MultiLine" Width="245px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="nhan">&nbsp;</td>
            <td>&nbsp;</td>
       </tr>
       <tr>
            <td  class="nhan"></td>
            <td>
                <asp:Button ID="cmdCapNhat" runat="server" Text="Cập nhật" ValidationGroup="cn" 
                     onclick="cmdCapNhat_Click" />&nbsp;<asp:Button ID="cmdThem"
                    runat="server" Text="Thêm mới" ValidationGroup="cn" 
                    onclick="cmdThem_Click" />&nbsp;<asp:Button 
                    ID="cmdHuy" runat="server" 
                    Text="Hủy bỏ" onclick="cmdHuy_Click" />
            </td>
       </tr>
    </table>
</div>   
</div>
</div>
</asp:Content>
