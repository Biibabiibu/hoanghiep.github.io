<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_NCC.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_NCC" %>
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
<h1>Quản lý thông tin nhà cung cấp</h1>
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
                <asp:Button ID="cmdTimKiem" runat="server" Text="Tìm kiếm tên nhà cung cấp" 
                ValidationGroup="TimKiem" onclick="cmdTimKiem_Click" />
		    </label>
		    <label>
                <asp:Button ID="cmdShow" runat="server" Text="Hiện toàn bộ bản ghi" 
                onclick="cmdShow_Click" />
		    </label>
	</div>	    
    <asp:GridView ID="gvNCC" runat="server" Width=100% CssClass="listing" AutoGenerateColumns=False 
        EmptyDataText="Không có bản ghi nào!" AllowPaging="True" CellPadding="0" 
        AllowSorting="True" DataKeyNames="IDNCC" DataSourceID="sdsNCC" 
                onselectedindexchanged="gvNCC_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="IDNCC" HeaderText="Mã NCC" InsertVisible="False" 
                ReadOnly="True" SortExpression="IDNCC" />
            <asp:BoundField DataField="TenNCC" HeaderText="Tên NCC" 
                SortExpression="TenNCC" />
            <asp:BoundField DataField="GioiThieu" HeaderText="Giới Thiệu" 
                SortExpression="GioiThieu" />
            <asp:TemplateField HeaderText="Chức Năng">
            <ItemTemplate>
                <asp:ImageButton ID="ibDelete" runat="server" title="header=[Xóa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/hr.gif" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa bản ghi này hay không?');" />
                <asp:ImageButton ID="ibSelect" runat="server" title="header=[Sửa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/edit-icon.gif" CommandName="Select"/>
            </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
           
		   

<div class="table">
    <asp:SqlDataSource ID="sdsNCC" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT * FROM [tblNCC] ORDER BY IDNCC DESC" 
        DeleteCommand="DELETE FROM tblNCC WHERE (IDNCC = @IDNCC)">
        <DeleteParameters>
            <asp:Parameter Name="IDNCC" />
        </DeleteParameters>
    </asp:SqlDataSource>
<div id="quyenXem" runat="server">
<div style="border-top:2px solid #f70;margin-top:17px;">
   <h3 style="color:#43729F">Chi tiết nhà cung cấp</h3>

    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td class="nhan">
                Mã số:</td>
            <td>
                <asp:Label ID="lMaSo" runat="server" Text="Tự động" ForeColor="Red" Font-Bold=true></asp:Label></td>
        </tr>
        <tr>
            <td class="nhan">
                Tên nhà cung cấp:</td>
            <td>
                <asp:TextBox ID="txtTenNCC" runat="server" Height="18px" Width="245px" 
                    MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rfvTenNCC" runat="server" ErrorMessage="(*)" 
                    ControlToValidate="txtTenNCC" Display="Dynamic" SetFocusOnError="True" 
                    ValidationGroup="NCC"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="nhan">Giới thiệu:</td>
            <td>
                <asp:TextBox ID="txtGioiThieu" runat="server" TextMode="MultiLine" 
                    Width="245px"></asp:TextBox>
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
                    onclick="cmdCapNhat_Click" ValidationGroup="NCC" />&nbsp;<asp:Button ID="cmdThem"
                    runat="server" Text="Thêm mới" onclick="cmdThem_Click" 
                    ValidationGroup="NCC" />&nbsp;<asp:Button ID="cmdHuy" runat="server" 
                    Text="Hủy bỏ" onclick="cmdHuy_Click" />
            </td>
       </tr>
    </table>
</div>   
</div>
</div>
</div>
</asp:Content>
