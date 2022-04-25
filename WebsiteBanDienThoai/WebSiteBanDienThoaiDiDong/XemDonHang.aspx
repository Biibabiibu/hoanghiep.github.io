<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="XemDonHang.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.XemDonHang" %>
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
        <label class="contact">Tên đăng nhập:</label><label class="show_infor"><strong><%# Eval("TaiKhoan") %></strong></label><label class="contact">Họ và tên:</label><label class="show_infor"><strong><%# Eval("TenKH") %></strong></label><label class="contact">Địa chỉ:</label><label class="show_infor"><strong><%# Eval("DiaChi") %></strong></label><label class="contact">Số tiền:</label><label class="show_infor"><strong><%# Eval("SoTien", "{0:n0} VND") %></strong></label>

        </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="sdsThongTinCaNhan" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
            SelectCommand="SELECT * FROM [tblKhachHang] WHERE ([TaiKhoan] = @TenTK)">
            <SelectParameters>
                <asp:SessionParameter Name="TenTK" SessionField="TenTK" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>        
    </div>
    <div class="bottom_prod_box_big"></div>        
    </div>
    
    <div class="center_title_bar">Đơn Hàng</div>
    <div class="prod_box_big">
    <div class="top_prod_box_big"></div>
    <div class="center_prod_box_big">
    
        <asp:GridView ID="gvXemDH" runat="server" Font-Size="12px "
            AutoGenerateColumns="False" Width="100%"
            DataKeyNames="IDDonHang" DataSourceID="sdsXemDH" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            ForeColor="Black" GridLines="Vertical" 
            onselectedindexchanged="gvXemDH_SelectedIndexChanged" EmptyDataText="Bạn chưa có đơn hàng nào!" AllowPaging="True">
            <FooterStyle BackColor="#CCCC99" />
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:TemplateField HeaderText="STT">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="IDDonHang" HeaderText="Mã Đơn Hàng" ReadOnly="True" 
                    SortExpression="IDDonHang" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="NgayLap" HeaderText="Ngày Lập" 
                    SortExpression="NgayLap" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" 
                    SortExpression="TongTien" DataFormatString="{0:n0} VNĐ" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Trạng Thái">
                <ItemTemplate><%# checkout(Convert.ToInt32(Eval("TrangThai"))) %></ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:CommandField SelectText="Chi Tiết" ShowSelectButton="True">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
            </Columns>
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="sdsXemDH" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
            SelectCommand="SELECT [TongTien], [TrangThai], [IDDonHang], [TaiKhoan], [NgayLap] FROM [tblDonHang] WHERE ([TaiKhoan] = @TaiKhoan)">
            <SelectParameters>
                <asp:SessionParameter Name="TaiKhoan" SessionField="TenTK" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    
    </div>
    <div class="bottom_prod_box_big"></div>
    
    </div>
</asp:Content>
