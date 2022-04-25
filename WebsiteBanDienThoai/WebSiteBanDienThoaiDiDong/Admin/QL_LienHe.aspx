<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_LienHe.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_LienHe" %>
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
<h1>Quản lý ý kiến đóng góp/ liên hệ</h1>
</div>
<div class="select-bar">
    <asp:GridView ID="gvLienHe" runat="server" AllowPaging="True" 
        AutoGenerateColumns="false" Width="100%" CssClass="listing" AllowSorting="True" 
        CellPadding="0" DataKeyNames="MaLienHe" DataSourceID="sdsLienHe" 
        EmptyDataText="Không có bản ghi nào!" 
        onselectedindexchanged="gvLienHe_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="STT">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                    <asp:HiddenField ID="hfMaLH" runat="server" Value='<%# Eval("MaLienHe") %>' />
                </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>                
            <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" SortExpression="HoTen" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="SDT" HeaderText="SĐT" SortExpression="SDT" />
            <asp:BoundField DataField="NoiDung" HeaderText="Nội Dung" 
                SortExpression="NoiDung" />
            <asp:TemplateField HeaderText="Chức Năng">
            <ItemTemplate>
                <asp:ImageButton ID="ibDelete" runat="server" title="header=[Xóa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/hr.gif" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa bản ghi này hay không?');" />
                <asp:ImageButton ID="ibSelect" runat="server" title="header=[Sửa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/edit-icon.gif" CommandName="Select"/>
            </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
<div class="table">
    <asp:SqlDataSource ID="sdsLienHe" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT * FROM [tblLienHe] ORDER BY MaLienHe DESC" 
        DeleteCommand="DELETE FROM tblLienHe WHERE (MaLienHe = @MaLienHe)">
        <DeleteParameters>
            <asp:Parameter Name="MaLienHe" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <div id="quyenXem" runat="server">
    <div style="border-top:2px solid #f70;margin-top:17px;">
    <h3 style="color:#43729F">Ý kiến người sử dụng</h3>
    <table id="tbLienHe" cellpadding="0" 
            cellspacing="0" class="style1">
        <tr>
            <td class="nhan">
                Mã số:</td>
            <td style="color:Red">
                <asp:Label ID="lbMaLH" Text="Tự động" runat="server"></asp:Label>
                <asp:HiddenField ID="hfMaLH" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="nhan">
                Họ và tên:
            </td>
            <td>            
                <asp:TextBox ID="txtHoTen" runat="server" Height="18px" Width="245px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvHoTen" ControlToValidate="txtHoTen" ErrorMessage="(*)" runat="server"></asp:RequiredFieldValidator>
            </td>

        </tr>
        <tr>
            <td class="nhan">Email:</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Height="18px" Width="245px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtEmail" ErrorMessage="(*)" runat="server"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="nhan">Số điện thoại:</td>
            <td>
                <asp:TextBox ID="txtSDT" runat="server" Height="18px" Width="245px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="nhan">Nội dung:</td>
            <td>
                <asp:TextBox ID="txtND" runat="server" TextMode="MultiLine" Font-Names="Arial" Font-Size="Small" Width="245px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>

            </td>
            <td>
                <asp:Button ID="cmdThemMoi"  Text="Thêm mới" runat="server" 
                    onclick="cmdThemMoi_Click" />
                <asp:Button ID="cmdCapNhat"  Text="Cập nhật" runat="server" 
                    onclick="cmdCapNhat_Click" />
                <asp:Button id="cmdLamLai" Text="Làm lại" runat="server" 
                    onclick="cmdLamLai_Click" />
            </td>
        </tr>
        </table>
    </div>

    </div>
</div>
</div>
</asp:Content>
