<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.GioHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="center_title_bar">Giỏ Hàng</div>
<div class="prod_box_big">
<asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ProductID" 
        EmptyDataText="Bạn chưa mua mặt hàng nào cả" ShowFooter="True" 
        Width="100%" onrowcommand="gvCart_RowCommand" 
        onrowdatabound="gvCart_RowDataBound" BackColor="White" 
        BorderColor="#DEDFDE" BorderWidth="1px" ForeColor="Black" 
        GridLines="Vertical" BorderStyle="None">
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" 
            HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" ForeColor="White" Font-Bold="True" />
        <HeaderStyle HorizontalAlign="Left" BackColor="#6B696B" Font-Bold="True" 
            ForeColor="White" />
				<FooterStyle HorizontalAlign="Right" BackColor="#CCCC99" />
				<AlternatingRowStyle BackColor="White" />
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Tên điện thoại" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Price" HeaderText="Giá" DataFormatString="{0:n0}" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate>
                    <asp:TextBox ID="txtQuantity" runat="server" Columns="5" 
                        Text='<%#Eval("Quantity") %>' Width="30px" OnLoad="txtQuantity_TextChanged"></asp:TextBox>
                    <br />
                    <asp:LinkButton runat="server" ID="btnRemove" Text="Loại bỏ" CommandName="Remove" CommandArgument='<%# Eval("ProductID") %>' style="font-size:12px;"></asp:LinkButton>
                    <asp:HiddenField ID="hdProductID" runat="server" Value='<%#Eval("ProductID") %>' />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" 
                DataFormatString="{0:n0}" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <br />
    <table width="400" border="0" cellspacing="10" cellpadding="0">
      <tr>
        <td align="left" valign="top">
            <asp:Button ID="btnUpdateCart" runat="server" Text="Cập nhật giỏ hàng" 
                onclick="btnUpdateCart_Click" BorderColor="Black" BorderStyle="Solid" 
                BorderWidth="1px" />
        </td>
        <td align="left" valign="top">
            <asp:Button ID="btnClearCart" runat="server" Text="Xóa toàn bộ giỏ hàng" 
                onclick="btnClearCart_Click" BorderColor="Black" BorderStyle="Solid" 
                BorderWidth="1px" />
        </td>
        <td></td>
      </tr>
      <tr>
        <td align="left" valign="top">
            <asp:Button ID="btnBackToShop" runat="server" Text="Tiếp tục mua hàng" 
                onclick="btnBackToShop_Click" BorderColor="Black" BorderStyle="Solid" 
                BorderWidth="1px" />
        </td>
        <td align="left" valign="top">
            <asp:Button ID="btnCheckOut" runat="server" Text="Thanh toán đơn hàng" 
                onclick="btnCheckOut_Click" BorderColor="Black" BorderStyle="Solid" 
                BorderWidth="1px" />
        </td>
        <td>
            &nbsp;</td>
      </tr>
    </table>
</div>
</asp:Content>
