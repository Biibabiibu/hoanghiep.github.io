using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSiteBanDienThoaiDiDong.ThaoTac;

namespace WebSiteBanDienThoaiDiDong.Admin
{
    public partial class QL_PhieuXuat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Key"] != null)
            {
                sdsPhieuXuat.SelectCommand = "select tblPhieuXuat.*, tblKhachHang.TaiKhoan, tblKhachHang.TenKH From tblPhieuXuat inner join tblKhachHang on tblPhieuXuat.MaKH = tblKhachHang.MaKH Where tblKhachHang.TaiKhoan like N'%" + Request["Key"] + "'";
            }
        }

        protected void cmdTimKiem_Click(object sender, EventArgs e)
        {
            if (txtTimKiem.Text.ToString().Trim() != "")
            {
                Response.Redirect("QL_PhieuXuat.aspx?Key=" + txtTimKiem.Text.Trim());
            }
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("QL_PhieuXuat.aspx");
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            ThaoTacCSDL  dl = new ThaoTacCSDL ();

            string diachigiao = txtDiaChi.Text;
            string sql = string.Format(@"UPDATE tblPhieuXuat SET DiaChiGiao=N'{0}' WHERE SoPX='{1}'", diachigiao, lPhieuXuat.Text);
            dl.CapNhapDuLieu(sql);
            gvPhieuXuat.DataBind();
            dl.CNN.Close();
            MessegeBox.Show("Cập nhật dữ liệu thành công!");
            reset();
        }
        protected void reset()
        {
            hfPhieuXuat.Value = null;
            txtHoTen.Text = null;
            txtNgayXuat.Text = null;
            txtDiaChi.Text = null;
        }

        protected void gvPhieuXuat_SelectedIndexChanged(object sender, EventArgs e)
        {
            lPhieuXuat.Text = gvPhieuXuat.Rows[gvPhieuXuat.SelectedIndex].Cells[0].Text;
            txtHoTen.Text = gvPhieuXuat.Rows[gvPhieuXuat.SelectedIndex].Cells[2].Text;
            txtNgayXuat.Text = gvPhieuXuat.Rows[gvPhieuXuat.SelectedIndex].Cells[3].Text;
            txtDiaChi.Text = Server.HtmlDecode(gvPhieuXuat.Rows[gvPhieuXuat.SelectedIndex].Cells[4].Text);
            sdsChiTietPX.SelectCommand = "Select tblDongPX.*, tblDienThoai.TenDT, tblDienThoai.SoLuong From tblDongPX Inner Join tblDienThoai On tblDongPX.IDDT = tblDienthoai.IDDT Where tblDongPX.SoPX = '" + lPhieuXuat.Text + "'";
            txtHoTen.Enabled = false;
        }
    }
}