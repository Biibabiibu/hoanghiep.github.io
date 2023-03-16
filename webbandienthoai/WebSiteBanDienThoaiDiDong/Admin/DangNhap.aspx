<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.DangNhap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Đăng nhập QUẢN TRỊ</title>
    <link href="css/StyleDangNhap.css" rel="stylesheet" type="text/css" />

<style type="text/css">
   
    
    .style1
    {
        width: 214px;
    }

   
</style>
</head>
<body>
    <form id="form1" runat="server">
   <div class="div">
   <h1 class="Tieude">Bạn cần phải đăng nhập trước khi sử dụng hệ thống!!!</h1> 
    <table cellpadding="3" cellspacing="0" border="0" class="tbl">
        <tr height="50px">
            <td colspan="2" align="center" style="text-align: center; background-color: #3366CC;"><span style="font-weight:bold">ĐĂNG NHẬP VÀO HỆ THỐNG</span></td>
        </tr>
        <tr>
            <td>Tên đăng nhập:</td>
            <td class="style1"><asp:TextBox ID="txtTenDangNhap" runat="server" Width="200px"></asp:TextBox></td>
        </tr>

        <tr>
            <td style="text-align: right">Mật khẩu:</td>
            <td class="style1"><asp:TextBox ID="txtMatKhau" TextMode="Password" runat="server" Width="200px"> </asp:TextBox></td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="cmdDangNhap" Text="Đăng nhập" runat="server" 
                    onclick="cmdDangNhap_Click" />
            </td>
        </tr>
    </table>

    </div>
    </form>
</body>
</html>
