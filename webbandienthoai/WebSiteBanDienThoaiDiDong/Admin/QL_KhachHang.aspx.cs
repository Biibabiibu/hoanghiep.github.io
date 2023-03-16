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
    public partial class QL_KhachHang : System.Web.UI.Page
    {
        ThaoTacCSDL dl = new ThaoTacCSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Key"] != null)
            {

                sdsKhachHang.SelectCommand = "select * from tblKhachHang where (tenkh like N'%" + Request["Key"] + "%')";
            }
        }

        protected void cmdTimKiem_Click(object sender, EventArgs e)
        {
            if (txtTimKiem.Text.ToString().Trim() != "")
            {
                Response.Redirect("QL_KhachHang.aspx?Key=" + txtTimKiem.Text.Trim());
            }
        }

        protected void grvKhachHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtTenDN.Text = grvKhachHang.Rows[grvKhachHang.SelectedIndex].Cells[0].Text;
            txtMatKhau.Text = grvKhachHang.Rows[grvKhachHang.SelectedIndex].Cells[1].Text;
            txtTenKH.Text = Server.HtmlDecode(grvKhachHang.Rows[grvKhachHang.SelectedIndex].Cells[2].Text).ToString();
            txtDiachi.Text = Server.HtmlDecode(grvKhachHang.Rows[grvKhachHang.SelectedIndex].Cells[3].Text).ToString();
            lbMaTK.Text = grvKhachHang.Rows[grvKhachHang.SelectedIndex].Cells[4].Text;
            txtSotien.Text = grvKhachHang.Rows[grvKhachHang.SelectedIndex].Cells[5].Text;
            HiddenField makh = (HiddenField)grvKhachHang.Rows[grvKhachHang.SelectedIndex].Cells[6].FindControl("hfMaKH");
            hfMaKH.Value = makh.Value;
        }
        protected void reset()
        {
            txtDiachi.Text = null;
            //txtMaTK.Text = null;
            txtMatKhau.Text = null;
            txtNhapLaiMK.Text = null;
            txtSotien.Text = null;
            txtTenDN.Text = null;
            txtTenKH.Text = null;
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("QL_KhachHang.aspx");
        }

        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            string tendn = txtTenDN.Text;
            string matkhau = txtMatKhau.Text;
            string hoten = txtTenKH.Text;
            string diachi = txtDiachi.Text;
            string sotien = txtSotien.Text;
            string matk;
            int id = 0;

            string sqlma = string.Format(@"select top(1) * from tblKhachHang order by MaKH DESC");
            SqlCommand cmd = new SqlCommand(sqlma, dl.CNN);
            dl.CNN.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                id = int.Parse(dr[0].ToString());
            }
            int num = id + 1;
            string s = Convert.ToString(num).ToString();
            matk = "KH" + s;

            dl.CNN.Close();

            string sql = string.Format(@"insert into tblKhachHang(taikhoan, matkhau, tenkh, diachi, matk, sotien) values('{0}', '{1}', N'{2}', N'{3}', '{4}', '{5}')", tendn, matkhau, hoten, diachi, matk, sotien);
            dl.CapNhapDuLieu(sql);
            MessegeBox.Show("Thêm dữ liệu thành công!");
            grvKhachHang.DataBind();
            dl.CNN.Close();
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            if (grvKhachHang.SelectedIndex >= 0)
            {

                string tendn = txtTenDN.Text;
                string matkhau = txtMatKhau.Text;
                string hoten = txtTenKH.Text;
                string diachi = txtDiachi.Text;
                //string matk = txtMaTK.Text;
                string sotien = txtSotien.Text;
                string makh = hfMaKH.Value;

                string sql = string.Format(@"update tblKhachHang set taikhoan='{0}', matkhau='{1}', tenkh=N'{2}', diachi=N'{3}', sotien={4} where makh='{5}'", tendn, matkhau, hoten, diachi, sotien, makh);
                dl.CapNhapDuLieu(sql);
                grvKhachHang.DataBind();
                dl.CNN.Close();
                MessegeBox.Show("Cập nhật dữ liệu thành công!");
                reset();
            }
            else
            {
                MessegeBox.Show("Bạn cần chọn 1 bản ghi để cập nhật!");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            reset();
        }
    }
}