<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.ascx.cs" Inherits="WebSiteBanDienThoaiDiDong.UserControl.DangNhap" %>
<script type="text/javascript">
    function clickButton(e, buttonid)
    {
        var evt = e ? e : window.event;
        var bt = document.getElementById(buttonid);
        if (bt)
        {
            if (evt.keyCode == 13)
            {
                bt.click();
                return false;
            }
        }
    }
</script>
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
    <div class="title_box">Đăng Nhập</div> 
<div class="border_box">
<div style="font-weight:bold; font-size:12px; float:left; padding-left:12px">Tên đăng nhập:</div>
    <asp:TextBox ID="txtTenDangNhap" runat="server" Height="16px" CssClass="login_textbox" Width="160px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTenDangNhap" runat="server" 
            ControlToValidate="txtTenDangNhap" Display="None" 
            ErrorMessage="Tên đăng nhập không được để trống!" SetFocusOnError="True" 
            ValidationGroup="DangNhap"></asp:RequiredFieldValidator>
<div style="font-weight:bold; font-size:12px; float:left; padding-left:12px">Mật khẩu:</div>
    <asp:TextBox ID="txtMatKhau" runat="server" Height="16px" CssClass="login_textbox" 
            Width="160px" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvMatKhau" runat="server" 
            ControlToValidate="txtMatKhau" Display="None" 
            ErrorMessage="Mật khẩu không được để trống!" SetFocusOnError="True" 
            ValidationGroup="DangNhap"></asp:RequiredFieldValidator>
<div class="login_button">
    <asp:Button ID="cmdDangNhap" runat="server" Text="Đăng Nhập" 
        BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="False" 
        ValidationGroup="DangNhap" onclick="cmdDangNhap_Click" /></div>
<div class="login_button">
    <asp:HyperLink ID="hlDangKy" runat="server" ForeColor="#1F44D4" 
        NavigateUrl="~/DangKy.aspx" Font-Bold="True" Font-Size="12px">Bạn chưa có tài khoản?</asp:HyperLink>
    <asp:ValidationSummary ID="vsDangNhap" runat="server" 
        HeaderText="Hãy kiểm tra lại!" ShowMessageBox="True" ShowSummary="False" 
        ValidationGroup="DangNhap" />
</div>
</div>
    </asp:View>


    <asp:View ID="View2" runat="server">
    <div class="title_box">Xin chào <%= Session["TenTK"] %></div> 
<div class="border_box">
<div align="left" style=" padding:5px 0 3px 10px;">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/change_pass.gif" />&nbsp;&nbsp;<asp:HyperLink ID="hlThayMatKhau" ForeColor="#1F44D4" Font-Bold="True "
        Font-Size="12px" runat="server" NavigateUrl="~/DoiMatKhau.aspx" Font-Underline=False>Đổi mật khẩu</asp:HyperLink>
</div>
<div align="left" style=" padding:0px 0 3px 10px;">
    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/infor.gif" />&nbsp;&nbsp;<asp:HyperLink ID="hlThongTinCaNhan" ForeColor="#1F44D4" Font-Bold="True "
        Font-Size="12px" runat="server" NavigateUrl="~/DoiThongTinCaNhan.aspx" Font-Underline=false>Thông tin cá nhân</asp:HyperLink>
</div>
<div align="left" style=" padding:0px 0 3px 10px;">
    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/bill.gif" />&nbsp;&nbsp;<asp:HyperLink ID="hlXemDonHang" ForeColor="#1F44D4" Font-Bold="True" 
        Font-Size="12px" runat="server" NavigateUrl="~/XemDonHang.aspx" Font-Underline="False">Xem đơn hàng</asp:HyperLink>
</div>
<% if (Convert.ToInt32(Session["Quyen"]) == 1)
               {%>  
<div align="left" style=" padding:0px 0 3px 10px;">
    &nbsp;<asp:Image ID="Image5" runat="server" ImageUrl="~/images/user.png" />&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="hlQuanTri" runat="server" ForeColor="#1F44D4" Font-Bold="true" Font-Size="12px" Font-Underline="false"
                                NavigateUrl="~/Admin/TrangQuanTri.aspx">Quản trị</asp:HyperLink>
</div> 
    <%} %> 
<div align="left" style=" padding:0px 0 3px 10px;">
    <asp:Image ID="Image4" runat="server" ImageUrl="~/images/exit.gif" />&nbsp;&nbsp;<asp:LinkButton ID="cmdThoat" runat="server" ForeColor=#1F44D4 Font-Bold="true" 
        Font-Size="12px" Font-Underline="false" onclick="cmdThoat_Click" >Thoát</asp:LinkButton>    
</div>
                                             
</div>
    </asp:View>
</asp:MultiView>
