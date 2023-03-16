using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSiteBanDienThoaiDiDong.ThaoTac;

namespace WebSiteBanDienThoaiDiDong.UserControl
{
    public partial class DangNhap : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["DangNhapThanhCong"] != "1")
                MultiView1.ActiveViewIndex = 0;
            else
                MultiView1.ActiveViewIndex = 1;
            txtTenDangNhap.Attributes.Add("onkeypress", "return clickButton(event,'" + cmdDangNhap.ClientID + "')");
            txtMatKhau.Attributes.Add("onkeypress", "return clickButton(event,'" + cmdDangNhap.ClientID + "')");
        
        }

        protected void cmdDangNhap_Click(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string SQL_String1 = string.Format(@"SELECT * FROM tblKhachHang WHERE TaiKhoan='{0}' AND MatKhau='{1}'", txtTenDangNhap.Text, txtMatKhau.Text);
            if (dl.KiemTra(SQL_String1) == 0)
            {
                Session["TenTK"] = txtTenDangNhap.Text;
                Session["DangNhapThanhCong"] = "1";
                //string SQL_String2 = string.Format(@"SELECT * FROM tblNguoiSuDung WHERE TenDangNhap='{0}'", txtTenDangNhap.Text);
                //SqlDataReader doc;
                //doc = dl.LayDuLieu(SQL_String2);
                //while (doc.Read())
                //{
                //    Session["Quyen"] = doc["Quyen"].ToString();
                //}
                dl.CNN.Dispose();
                dl.CNN.Close();
                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write ("Tên đăng nhập hoặc mật khẩu sai!");
            }
        }

        protected void cmdThoat_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            ShoppingCart.Instance.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}