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

namespace WebSiteBanDienThoaiDiDong.Admin
{
    public partial class QL_LienHe : System.Web.UI.Page
    {
        ThaoTacCSDL dl = new ThaoTacCSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void gvLienHe_SelectedIndexChanged(object sender, EventArgs e)
        {
            HiddenField Ma = (HiddenField)gvLienHe.Rows[gvLienHe.SelectedIndex].Cells[0].FindControl("hfMaLH");
            lbMaLH.Text = Ma.Value;
            hfMaLH.Value = Ma.Value;
            txtHoTen.Text = Server.HtmlDecode(gvLienHe.Rows[gvLienHe.SelectedIndex].Cells[1].Text);
            txtEmail.Text = gvLienHe.Rows[gvLienHe.SelectedIndex].Cells[2].Text;
            txtSDT.Text = gvLienHe.Rows[gvLienHe.SelectedIndex].Cells[3].Text;
            txtND.Text = Server.HtmlDecode(gvLienHe.Rows[gvLienHe.SelectedIndex].Cells[4].Text);

        }

        protected void cmdThemMoi_Click(object sender, EventArgs e)
        {
            string malh, hoten, email, sdt, noidung;
            malh = hfMaLH.Value;
            hoten = txtHoTen.Text;
            email = txtEmail.Text;
            sdt = txtSDT.Text;
            noidung = txtND.Text;

            string sql1 = string.Format(@"insert into tblLienHe(hoten, email, sdt, noidung) values(N'{0}', '{1}', '{2}', N'{3}')", hoten, email, sdt, noidung);
            dl.CapNhapDuLieu(sql1);
            gvLienHe.DataBind();
            dl.CNN.Close();
            MessegeBox.Show("Thêm mới thành công!");
        }

        protected void cmdCapNhat_Click(object sender, EventArgs e)
        {
            string malh, hoten, email, sdt, noidung;
            malh = hfMaLH.Value;
            hoten = txtHoTen.Text;
            email = txtEmail.Text;
            sdt = txtSDT.Text;
            noidung = txtND.Text;

            string sql2 = string.Format(@"update tblLienHe set hoten=N'{0}', email='{1}', sdt='{2}', noidung=N'{3}' where malienhe = '{4}'", hoten, email, sdt, noidung, malh);
            dl.CapNhapDuLieu(sql2);
            gvLienHe.DataBind();
            dl.CNN.Close();
            MessegeBox.Show("Cập nhật dữ liệu thành công!");
        }

        protected void cmdLamLai_Click(object sender, EventArgs e)
        {
            txtEmail.Text = null;
            txtHoTen.Text = null;
            txtND.Text = null;
            txtSDT.Text = null;
        }
    }
}