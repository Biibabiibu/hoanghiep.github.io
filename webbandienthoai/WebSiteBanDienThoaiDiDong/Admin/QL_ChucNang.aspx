<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_ChucNang.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_ChucNang" %>
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
<h1>Quản lý Chức năng</h1>
</div>
<div class="select-bar">

	</div>	    
    <asp:GridView ID="gvChucNang" runat="server" Width=100% CssClass="listing" AutoGenerateColumns=False 
        EmptyDataText="Không có bản ghi nào!" AllowPaging="True" CellPadding="0" 
        AllowSorting="True" DataKeyNames="IDChucNang" DataSourceID="sdsChucNang" 
                onselectedindexchanged="gvChucNang_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="IDChucNang" HeaderText="Mã ChucNang" InsertVisible="False" 
                ReadOnly="True" SortExpression="IDChucNang" />
            <asp:BoundField DataField="TenChucNang" HeaderText="Tên ChucNang" 
                SortExpression="TenChucNang" />
            <asp:BoundField DataField="Mota" HeaderText="Giới Thiệu" 
                SortExpression="Mota" />
            <asp:TemplateField HeaderText="Chức Năng">
            <ItemTemplate>
                
                <asp:ImageButton ID="ibSelect" runat="server" title="header=[Sửa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/edit-icon.gif" CommandName="Select"/>
            </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
           
		   

<div class="table">
    <asp:SqlDataSource ID="sdsChucNang" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT * FROM [tblChucNang] ORDER BY IDChucNang ASC" 
        DeleteCommand="DELETE FROM tblChucNang WHERE (IDChucNang = @IDChucNang)">
        <DeleteParameters>
            <asp:Parameter Name="IDChucNang" />
        </DeleteParameters>
    </asp:SqlDataSource>
<div id="quyenXem" runat="server">
<div style="border-top:2px solid #f70;margin-top:17px;">
   <h3 style="color:#43729F">Chi tiết Chức năng</h3>

    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td class="nhan">
                Mã chức năng:</td>
            <td>
                <asp:Label ID="lMaSo" runat="server" Text="Tự động" ForeColor="Red" Font-Bold=true></asp:Label></td>
        </tr>
        <tr>
            <td class="nhan">
                Tên chức năng:</td>
            <td>
                <asp:TextBox ID="txtTenChucNang" runat="server" Height="18px" Width="245px" 
                    MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rfvTenChucNang" runat="server" ErrorMessage="(*)" 
                    ControlToValidate="txtTenChucNang" Display="Dynamic" SetFocusOnError="True" 
                    ValidationGroup="ChucNang"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="nhan">Mô tả:</td>
            <td>
                <asp:TextBox ID="txtMota" runat="server" TextMode="MultiLine" 
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
                    onclick="cmdCapNhat_Click" ValidationGroup="ChucNang" />&nbsp;
                    <asp:Button ID="cmdHuy" runat="server" 
                    Text="Hủy bỏ" onclick="cmdHuy_Click" />
            </td>
       </tr>
    </table>
</div>   
</div>
</div>
</div>
</asp:Content>
