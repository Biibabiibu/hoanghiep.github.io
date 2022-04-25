using System;
using System.Collections;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using WebSiteBanDienThoaiDiDong.ThaoTac;

namespace WebSiteBanDienThoaiDiDong
{
    public partial class ChiTietDienThoai : System.Web.UI.Page
    {
        ThaoTacCSDL dl = new ThaoTacCSDL();     
        protected void Page_Load(object sender, EventArgs e)
        {
            string iddt = Request.QueryString["IDDT"];
            sdsComment.SelectCommand = "select tblComment.*, tblKhachHang.TaiKhoan from tblComment inner join tblKhachHang on tblComment.TaiKhoan = tblKhachHang.TaiKhoan where IDDT='" + iddt + "'";
            string SQL_String = string.Format(@"UPDATE tblDienThoai SET LuotXem=((SELECT LuotXem FROM tblDienThoai WHERE IDDT='{0}')+1) WHERE IDDT='{1}'", iddt, iddt);
            dl.CapNhapDuLieu(SQL_String);
            dl.CNN.Close();
            tbTieuDe.Attributes.Add("onclick", "if(this.value == 'Tiêu đề') this.value=''");
            tbTieuDe.Attributes.Add("onblur", "if(this.value=='') this.value='Tiêu đề'");
            tbCommenContent.Attributes.Add("onclick", "if(this.value=='Viết ý kiến của bạn') this.value=''");
            tbCommenContent.Attributes.Add("onblur", "if(this.value=='') this.value='Viết ý kiến của bạn'");
            string sql = string.Format(@"select * from tblDienThoai Where iddt='{0}'", Request.QueryString["IDDT"]);
            int sl = 0;
            SqlCommand cmd = new SqlCommand(sql, dl.CNN);
            dl.CNN.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                sl = Convert.ToInt32(dr["SoLuong"]);
            }
            dl.CNN.Close();
        }
        protected string checkout(int checkvalue)
        {
            if (checkvalue > 0)
                return "Có";
            else
                return "Không";
        }
        protected string status(int checkvalue)
        {
            if (checkvalue > 0)
                return "Còn hàng";
            else
                return "Hết hàng";
        }
        protected void cmdGuiYK_Click(object sender, EventArgs e)
        {

            string content = tbCommenContent.Text;
            string tieude = tbTieuDe.Text;
            string taikhoan = Convert.ToString(Session["TenTK"]);
            string iddt = Request["IDDT"].ToString();
            string ngaydang = DateTime.Now.ToString();

            string sql = string.Format(@"insert into tblComment(Tieude, Comments, TaiKhoan, IDDT, NgayDang) values(N'{0}', N'{1}', '{2}', '{3}', '{4}')", tieude, content, taikhoan, iddt, ngaydang);
            if (Session["DangNhapThanhCong"] == null)
            {
                MessegeBox.Show("Bạn hãy đăng nhập hoặc đăng ký thành viên để viết bình luận!");
            }
            else if (tbTieuDe.Text == "Tiêu đề")
            {
                MessegeBox.Show("Bạn chưa nhập tiêu đề comment!");
            }
            else if (tbCommenContent.Text == null && tbCommenContent.Text.Trim() == "Viết ý kiến của bạn")
            {
                MessegeBox.Show("Bạn chưa nhập bình luận...");
            }
            else
            {
                dl.CapNhapDuLieu(sql);
                fvComment.DataBind();
                MessegeBox.Show("Bạn đã gửi comment thành công!");
                dl.CNN.Close();
            }
        }

       
    }
}