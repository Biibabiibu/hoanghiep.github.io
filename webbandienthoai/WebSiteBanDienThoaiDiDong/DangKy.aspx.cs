using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using WebSiteBanDienThoaiDiDong.ThaoTac;

namespace WebSiteBanDienThoaiDiDong
{
    public partial class DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmd_DangKy_Click(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string taikhoan = txtTenDangNhap.Text;
            string matkhau = txtMatKhau.Text;
            string tenkh = txtHoVaTen.Text;
            string diachi = txtDiaChi.Text;
            string matk = "";
            string sotien = "0";
            int id = 0;

            Session["TenDangNhap"] = taikhoan;
            dl.CNN.Open();
            string sql = string.Format(@"select top(1) * from tblKhachHang order by MaKH DESC");
            SqlCommand cmd = new SqlCommand(sql, dl.CNN);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                id = int.Parse(dr[0].ToString());
            }
            int num = id + 1;
            string s = Convert.ToString(num).ToString();
            matk = "KH" + s;

            dl.CNN.Close();
            string SQL_String1 = string.Format(@"SELECT * FROM tblKhachHang WHERE TaiKhoan = '{0}'", taikhoan);
            if (dl.KiemTra(SQL_String1) == 0)
            {
                lblThongBaoDangKy.Text = "Tài khoản đã có người sử dụng!";
            }
            else
            {
                string SQL_String2 = string.Format(@"insert into tblKhachHang(taikhoan, matkhau, tenkh, diachi, matk, sotien) values('{0}', '{1}', N'{2}', N'{3}', '{4}', '{5}')", taikhoan, matkhau, tenkh, diachi, matk, sotien);
                dl.CapNhapDuLieu(SQL_String2);
                dl.CNN.Close();
                Session["DangNhapThanhCong"] = "1";
                Response.Redirect("DangKy_ThanhCong.aspx");
            }
        }
    }
}