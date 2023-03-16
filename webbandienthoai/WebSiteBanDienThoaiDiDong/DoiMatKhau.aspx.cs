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
using WebSiteBanDienThoaiDiDong.ThaoTac;

namespace WebSiteBanDienThoaiDiDong
{
    public partial class DoiMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void cmdDoiMatKhau_Click(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string mkcu, mkmoi, id;
            mkcu = txtMatKhauCu.Text;
            mkmoi = txtMatKhauMoi.Text;
            id = Session["TenTK"].ToString();
            string s = string.Format(@"UPDATE tblKhachHang SET MatKhau='{0}' WHERE TaiKhoan='{1}'", mkmoi, id);
            string t = string.Format(@"Select * FROM tblKhachHang WHERE MatKhau='{0}' and TaiKhoan='{1}'", mkcu, id);
            if (dl.KiemTra(t) == 0)
            {
                dl.CapNhapDuLieu(s);
                dl.CNN.Dispose();
                dl.CNN.Close();
                 MessegeBox.Show("Đổi mật khẩu thành công!");

            }
            else
            {
                 MessegeBox.Show("Mật khẩu cũ không chính xác!");
            }
        }
    }
}