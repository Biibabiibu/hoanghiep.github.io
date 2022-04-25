<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="ChiTietDonHang.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.ChiTietDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%if (Session["DangNhapThanhCong"] != "1") Response.Redirect("Default.aspx"); %>

<div class="center_title_bar">Thông tin cá nhân</div>
    <div class="prod_box_big">
    <div class="top_prod_box_big"></div>
    <div class="center_prod_box_big">
    <div class="contact_form">
        <asp:Repeater ID="rThongTinCaNhan" runat="server" DataSourceID="sdsThongTinCaNhan">
        <ItemTemplate>
        <label class="contact">Tên đăng nhập:</label><label class="show_infor"><strong><%# Eval("TenDangNhap") %></strong></label><label class="contact">Họ và tên:</label><label class="show_infor"><strong><%# Eval("HoTen") %></strong></label><label class="contact">Email:</label><label class="show_infor"><strong><%# Eval("Email") %></strong></label><label class="contact">Số điện thoại:</label><label class="show_infor"><strong><%# Eval("SDT") %></strong></label><label class="contact">Địa chỉ:</label><label class="show_infor"><strong><%# Eval("DiaChi") %></strong></label>
        </ItemTemplate>
        </asp:Repeater>
      <asp:SqlDataSource ID="sdsThongTinCaNhan" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
            SelectCommand="SELECT * FROM [tblNguoiSuDung] WHERE ([TenDangNhap] = @TenDangNhap)">
            <SelectParameters>
                <asp:SessionParameter Name="TenDangNhap" SessionField="TenDangNhap" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>        
    </div>
    <div class="bottom_prod_box_big"></div>        
    </div>
    
    <div class="center_title_bar">Chi Tiết Đơn Hàng Mã Số: <%= Request["MaDH"] %></div>
    <div class="prod_box_big">
    <div class="top_prod_box_big"></div>
    <div class="center_prod_box_big">
        <asp:GridView ID="gvChiTietDH" runat="server" AllowPaging="True" Width="100%" 
            AutoGenerateColumns=False Font-Size=12px BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="IDDonHang,IDDT" DataSourceID="sdsChiTietDH" ForeColor="Black" 
            GridLines="Vertical">
            <FooterStyle BackColor="#CCCC99" />
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:BoundField DataField="IDDonHang" HeaderText="Mã Đơn Hàng" ReadOnly="True" 
                    SortExpression="IDDonHang" />
                <asp:BoundField DataField="IDDT" HeaderText="Mã Điện Thoại" ReadOnly="True" 
                    SortExpression="IDDT" />
                <asp:BoundField DataField="TenDT" HeaderText="Tên Điện Thoại" 
                    SortExpression="TenDT" />
                <asp:BoundField DataField="Gia" DataFormatString="{0:n0} VNĐ" HeaderText="Giá" 
                    SortExpression="Gia" />
                <asp:BoundField DataField="SLMua" HeaderText="Số Lượng Mua" 
                    SortExpression="SLMua" />
            </Columns>
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="sdsChiTietDH" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
            SelectCommand="SELECT tblDienThoai.TenDT, tblDongDH.IDDonHang, tblDongDH.IDDT, tblDongDH.SLMua, tblDongDH.Gia FROM tblDongDH INNER JOIN tblDienThoai ON tblDongDH.IDDT = tblDienThoai.IDDT WHERE (tblDongDH.IDDonHang = @MaDH)">
            <SelectParameters>
                <asp:QueryStringParameter Name="MaDH" QueryStringField="MaDH" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="bottom_prod_box_big">
    
    
    </div>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
    <tr>
    <td align="center" valign="top">
            <asp:Button ID="btnHuy" runat="server" Text="Hủy đơn đặt hàng" 
             ValidationGroup="thanhtoan"     BorderColor="Black" BorderStyle="Solid" 
                BorderWidth="1px" onclick="btnHuy_Click" />
    </td>
   
    <td align="center" valign="top">
    <asp:Button ID="btnCheckOut" runat="server" Text="Thanh toán đơn đặt hàng" 
                onclick="btnCheckOut_Click" ValidationGroup="thanhtoan" BorderColor="Black" BorderStyle="Solid" 
                BorderWidth="1px" />
    </td>
    </tr>
    </table>
    </div> 
</asp:Content>
