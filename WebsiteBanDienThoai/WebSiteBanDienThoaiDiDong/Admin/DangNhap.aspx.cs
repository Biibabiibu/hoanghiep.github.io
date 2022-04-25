using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WebSiteBanDienThoaiDiDong.ThaoTac;

namespace WebSiteBanDienThoaiDiDong.Admin
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdDangNhap_Click(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string SQL_String1 = string.Format(@"SELECT * FROM tblNguoiSuDung WHERE TenDangNhap='{0}' AND MatKhau='{1}'", txtTenDangNhap.Text, txtMatKhau.Text);
            if (dl.KiemTra(SQL_String1) == 0)
            {
                Session["TenDangNhap"] = txtTenDangNhap.Text;
                Session["AdminLoginSuccess"] = "1";
                string SQL_String2 = string.Format(@"SELECT * FROM tblNguoiSuDung WHERE TenDangNhap='{0}'", txtTenDangNhap.Text);
                SqlDataReader doc;
                doc = dl.LayDuLieu(SQL_String2);
                while (doc.Read())
                {
                    Session["Quyen"] = doc["Quyen"].ToString();
                }
                dl.CNN.Dispose();
                dl.CNN.Close();
                Response.Redirect("TrangQuanTri.aspx");
            }
            else
            {
                MessegeBox.Show("Tên đăng nhập hoặc mật khẩu sai!");
            }
        }
    }
}