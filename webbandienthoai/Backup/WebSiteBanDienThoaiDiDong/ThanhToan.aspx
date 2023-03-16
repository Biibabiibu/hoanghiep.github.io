<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.ThanhToan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%
    if (Session["DangNhapThanhCong"] != "1")
    {
        Response.Write("Bạn chưa đăng nhập hoặc bạn chưa tạo tài khoản!");
        Page.Response.AppendHeader("Refresh", "0; URL=Default.aspx");     
    }
    
%>
<div class="center_title_bar">Thanh Toán Đơn Hàng</div>
<div class="prod_box_big">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="top"><h4>Thông tin đơn hàng</h4></td>
      </tr>
      <tr>
        <td align="left" valign="top">
            <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="ProductID" 
            EmptyDataText="Bạn chưa mua mặt hàng nào cả" ShowFooter="True" 
            Width="100%" onrowdatabound="gvCart_RowDataBound" 
                BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" 
                ForeColor="Black" GridLines="Horizontal" BorderStyle="None" >
                <PagerStyle BackColor="White" ForeColor="Black" 
                    HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
                <HeaderStyle HorizontalAlign="Left" BackColor="#333333" ForeColor="#FFFFFF" 
                    Font-Bold="True" />
				        <FooterStyle HorizontalAlign="Right" BackColor="#CCCC99" 
                    ForeColor="Black" />
                <Columns>
                    <asp:BoundField DataField="ProductID" Visible="False" />
                    <asp:BoundField DataField="ProductName" HeaderText="Tên điện thoại" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Price" HeaderText="Giá" DataFormatString="{0:n0}" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Quantity" HeaderText="Số lượng" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" 
                        DataFormatString="{0:n0}" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </td>
      </tr>
    </table>
    <hr />
      <div><a target="_blank" href="https://www.nganluong.vn/button_payment.php?receiver=(vananhkc.ithyf92@gmail.com)&product_name=(Mã đơn đặt hàng)&price=(Tổng giá trị)&return_url=(URL thanh toán thành công)&comments=(Ghi chú về đơn hàng)" >
           <img  border="0" /><asp:ImageButton ID="NganLuong" runat="server" 
               ImageUrl="https://www.nganluong.vn/data/images/buttons/3.gif" 
               onclick="NganLuong_Click" />
           </a> &nbsp;</div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="top"><h4>Địa chỉ - Tài khoản thanh toán của shop.</h4></td>
      </tr>
      <tr>
        <td align="left" valign="top"><strong>Địa chỉ: </strong>Số 06, Trần Văn Ơn, Phú Hòa, Thủ Dầu Một, Bình Dương Phường Phú Hòa<br />
        <strong>Tài khoản ngân hàng</strong> của shop: 65010002789941</td>
      </tr>
    </table>
    <hr />
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="top"><h4>Địa chỉ giao hàng</h4></td>
      </tr>
      <tr>
        <td align="left" valign="top">
            <asp:TextBox ID="txtDiaChi" runat="server" Rows="5" TextMode="MultiLine" 
                Width="300px" Font-Names="Arial" Font-Size="Small"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvthanhtoan" runat="server" 
                ControlToValidate="txtDiaChi" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="thanhtoan"></asp:RequiredFieldValidator>
        </td>
      </tr>
    </table>
    <hr />
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="top">
            <asp:Button ID="btnContShopping" runat="server" Text="Tiếp tục mua hàng" 
                CausesValidation="False" onclick="btnContShopping_Click" BorderColor="Black" BorderStyle="Solid" 
                BorderWidth="1px" />
        </td>
        <td align="center" valign="top">
            <asp:Button ID="btnViewCart" runat="server" Text="Xem giỏ hàng" 
                CausesValidation="False" onclick="btnViewCart_Click" BorderColor="Black" BorderStyle="Solid" 
                BorderWidth="1px" />
        </td>
        <td align="center" valign="top">
            <asp:Button ID="btnDatHang" runat="server" Text="Đặt hàng" 
             ValidationGroup="thanhtoan"     BorderColor="Black" BorderStyle="Solid" 
                BorderWidth="1px" onclick="btnDatHang_Click" />
        </td>
        <td align="center" valign="top">
            <asp:Button ID="btnCheckOut" runat="server" Text="Thanh toán" 
                onclick="btnCheckOut_Click" ValidationGroup="thanhtoan" BorderColor="Black" BorderStyle="Solid" 
                BorderWidth="1px" />
        </td>
      </tr>
    </table>
</div>
</asp:Content>
