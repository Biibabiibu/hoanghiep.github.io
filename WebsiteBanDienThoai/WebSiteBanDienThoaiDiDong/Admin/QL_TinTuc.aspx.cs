using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
    public partial class QL_TinTuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            if (Request["Key"] != null)
            {
                sdsTinTuc.SelectCommand = "SELECT * FROM [tblTinTuc] WHERE (TieuDe Like N'%" + Request["Key"] + "%')";
            }
        }
        protected void clear()
        {
            lMaTin.Text = "Tự động";
            txtTieuDe.Text = null;
            txtTomTat.Text = null;
            fckNoiDung.Value = null;
            txtNgayDang.Text = null;
            txtTacGia.Text = null;
            txtHinhAnh.Text = null;
        }
        protected void cmdTimKiem_Click(object sender, EventArgs e)
        {
            if (txtTimKiem.Text.ToString().Trim() != "")
            {
                Response.Redirect("QL_TinTuc.aspx?Key=" + txtTimKiem.Text.Trim());
            }
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("QL_TinTuc.aspx");
        }

        protected void gvTinTuc_SelectedIndexChanged(object sender, EventArgs e)
        {
            lMaTin.Text = gvTinTuc.Rows[gvTinTuc.SelectedIndex].Cells[0].Text;
            txtTieuDe.Text = Server.HtmlDecode(gvTinTuc.Rows[gvTinTuc.SelectedIndex].Cells[1].Text);
            txtTomTat.Text = Server.HtmlDecode(gvTinTuc.Rows[gvTinTuc.SelectedIndex].Cells[2].Text);
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string ND = "", HinhAnh = "";
            string SQL_String = string.Format(@"SELECT NoiDung,HinhAnh FROM tblTinTuc WHERE MaTinTuc={0}", gvTinTuc.Rows[gvTinTuc.SelectedIndex].Cells[0].Text);
            SqlDataReader doc;
            doc = dl.LayDuLieu(SQL_String);
            while (doc.Read())
            {
                ND = doc["NoiDung"].ToString();
                HinhAnh = doc["HinhAnh"].ToString();
            }
            dl.CNN.Dispose();
            dl.CNN.Close();
            fckNoiDung.Value = Server.HtmlDecode(ND);
            txtNgayDang.Text = Server.HtmlDecode(gvTinTuc.Rows[gvTinTuc.SelectedIndex].Cells[3].Text);
            txtTacGia.Text = Server.HtmlDecode(gvTinTuc.Rows[gvTinTuc.SelectedIndex].Cells[4].Text);
            txtHinhAnh.Text = HinhAnh;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtNgayDang.Text = Calendar1.SelectedDate.Day.ToString() + "/" + Calendar1.SelectedDate.Month.ToString() + "/" + Calendar1.SelectedDate.Year.ToString() + " - " + DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString();
        }

        protected void cmdCapNhat_Click(object sender, EventArgs e)
        {
            try
            {
                ThaoTacCSDL  dl = new ThaoTacCSDL();
                string TieuDe, TomTat, NoiDung, NgayDangTin, TacGia, HinhAnh;
                int MaTT = Convert.ToInt32(lMaTin.Text);
                TieuDe = txtTieuDe.Text;
                TomTat = txtTomTat.Text;
                NoiDung = fckNoiDung.Value;
                NgayDangTin = txtNgayDang.Text;
                TacGia = txtTacGia.Text;
                if (fuHinhAnh.HasFile)
                {
                    HinhAnh = fuHinhAnh.FileName.Replace(" ", "_");
                    fuHinhAnh.SaveAs(Server.MapPath("~/Upload/News/" + HinhAnh));
                }
                else
                    HinhAnh = txtHinhAnh.Text;
                gvTinTuc.SelectedIndex = -1;


                string SQL_String2 = string.Format(@"UPDATE tblTinTuc SET TieuDe=N'{0}', TomTat=N'{1}', NoiDung=N'{2}', NgayDangTin=N'{3}', TacGia=N'{4}', HinhAnh='{5}' WHERE MaTinTuc={6}", TieuDe, TomTat, NoiDung, NgayDangTin, TacGia, HinhAnh, MaTT);
                dl.CapNhapDuLieu(SQL_String2);
                dl.CNN.Close();
                MessegeBox.Show("Cập nhật dữ liệu thành công!");
                gvTinTuc.DataBind();
                clear();

            }
            catch
            {
                MessegeBox.Show("Cần chọn một bản ghi để tiến hành cập nhật!");
            }
        }

        protected void cmdThem_Click(object sender, EventArgs e)
        {
            ThaoTacCSDL  dl = new ThaoTacCSDL();
            string TieuDe, TomTat, NoiDung, NgayDangTin, TacGia, HinhAnh;
            TieuDe = txtTieuDe.Text;
            TomTat = txtTomTat.Text;
            NoiDung = fckNoiDung.Value;
            NgayDangTin = txtNgayDang.Text;
            TacGia = txtTacGia.Text;
            if (fuHinhAnh.HasFile)
            {
                HinhAnh = fuHinhAnh.FileName.Replace(" ", "_");
                fuHinhAnh.SaveAs(Server.MapPath("~/Upload/News/" + HinhAnh));
            }
            else
                HinhAnh = txtHinhAnh.Text;
            string SQL_String1 = string.Format(@"SELECT TieuDe FROM tblTinTuc WHERE TieuDe=N'{0}'", TieuDe);
            if (dl.KiemTra(SQL_String1) == 0)
            {
                MessegeBox.Show("Tin tức đã tồn tại!");
            }
            else
            {
                string SQL_String2 = string.Format(@"INSERT INTO tblTinTuc(TieuDe,TomTat,NoiDung,NgayDangTin,TacGia,HinhAnh) VALUES(N'{0}',N'{1}',N'{2}',N'{3}',N'{4}','{5}');", TieuDe, TomTat, NoiDung, NgayDangTin, TacGia, HinhAnh);
                dl.CapNhapDuLieu(SQL_String2);
                dl.CNN.Close();
                MessegeBox.Show("Thêm dữ liệu thành công!");
                gvTinTuc.DataBind();
                clear();
            }

        }

        protected void cmdHuyBo_Click(object sender, EventArgs e)
        {
            clear();
            gvTinTuc.SelectedIndex = -1;
        }
    }
}