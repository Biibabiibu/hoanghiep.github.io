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

namespace WebSiteBanDienThoaiDiDong.Admin
{
    public partial class QL_DonDatHang1 : System.Web.UI.Page
    {
        ThaoTacCSDL dl = new ThaoTacCSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Key"] != null)
            {
                sdsDonHang.SelectCommand = "SELECT tblDonHang.IDDonHang, tblDonHang.TaiKhoan, tblDonHang.NgayLap, tblDonHang.DiaChiGiao, tblDonHang.TongTien, tblDonHang.TrangThai, tblKhachHang.TenKH FROM tblDonHang INNER JOIN tblKhachHang ON tblDonHang.TaiKhoan = tblKhachHang.TaiKhoan WHERE tblKhachHang.TenKH LIKE N'%" + Request["Key"] + "%'";
            }

            
            string del = string.Format(@"Delete From tblDonHang where GETDATE() >= ngayhuy ");
            dl.CapNhapDuLieu(del);
            dl.CNN.Close();    
        }
        protected string checkout(int checkvalue)
        {
            if (checkvalue == 1)
                return "Đã thanh toán";
            else
                return "Chưa thanh toán";
        }
        protected void cmdTimKiem_Click(object sender, EventArgs e)
        {
            if (txtTimKiem.Text.ToString().Trim() != "")
            {
                Response.Redirect("QL_DonDatHang.aspx?Key=" + txtTimKiem.Text.Trim());
            }
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("QL_DonDatHang.aspx");
        }

        protected void gvDonHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            lMaDH.Text = gvDonHang.Rows[gvDonHang.SelectedIndex].Cells[0].Text;
            txtTenDN.Text = gvDonHang.Rows[gvDonHang.SelectedIndex].Cells[1].Text;
            txtHoTen.Text = Server.HtmlDecode(gvDonHang.Rows[gvDonHang.SelectedIndex].Cells[2].Text);
            txtNgayLap.Text = gvDonHang.Rows[gvDonHang.SelectedIndex].Cells[3].Text;
            txtDC.Text = Server.HtmlDecode(gvDonHang.Rows[gvDonHang.SelectedIndex].Cells[4].Text);
            sdsChiTietDH.SelectCommand = "SELECT tblDienThoai.TenDT, tblDienThoai.SoLuong, tblDongDH.IDDonHang, tblDongDH.IDDT, tblDongDH.SLMua, tblDongDH.Gia FROM tblDongDH INNER JOIN tblDienThoai ON tblDongDH.IDDT = tblDienThoai.IDDT WHERE (tblDongDH.IDDonHang = " + gvDonHang.Rows[gvDonHang.SelectedIndex].Cells[0].Text + ")";
            lTongTien.Text = Server.HtmlDecode(gvDonHang.Rows[gvDonHang.SelectedIndex].Cells[5].Text);
            HiddenField ngayhuy = (HiddenField)gvDonHang.Rows[gvDonHang.SelectedIndex].Cells[7].FindControl("hfNgayHuy");
            txtNgayHuy.Text = ngayhuy.Value;
        }

        protected void cmdTimKiemDTT_Click(object sender, EventArgs e)
        {
            sdsDonHang.SelectCommand = "SELECT tblDonHang.IDDonHang, tblDonHang.TenDangNhap, tblDonHang.NgayLap, tblDonHang.DiaChiGiao, tblDonHang.TongTien, tblDonHang.TrangThai, tblNguoiSuDung.HoTen FROM tblDonHang INNER JOIN tblNguoiSuDung ON tblDonHang.TenDangNhap = tblNguoiSuDung.TenDangNhap WHERE tblDonHang.TrangThai = 1";
        }

        protected void cmdTimKiemCTT_Click(object sender, EventArgs e)
        {
            sdsDonHang.SelectCommand = "SELECT tblDonHang.IDDonHang, tblDonHang.TenDangNhap, tblDonHang.NgayLap, tblDonHang.DiaChiGiao, tblDonHang.TongTien, tblDonHang.TrangThai, tblNguoiSuDung.HoTen FROM tblDonHang INNER JOIN tblNguoiSuDung ON tblDonHang.TenDangNhap = tblNguoiSuDung.TenDangNhap WHERE tblDonHang.TrangThai = 0";
        }
        protected void clear()
        {
            lMaDH.Text = "Tự động";
            txtTenDN.Text = null;
            txtHoTen.Text = null;
            txtNgayLap.Text = null;
            txtDC.Text = null;
            sdsChiTietDH.SelectCommand = null;
            lTongTien.Text = "Tiền thanh toán đơn hàng";
            ddlTrangThai.SelectedValue = "0";
        }

        protected void cmdCapNhat_Click(object sender, EventArgs e)
        {
            try
            {
                string TrangThai;
                //int MaDH = Convert.ToInt32(lMaDH.Text);
                TrangThai = ddlTrangThai.SelectedValue;
                string sqlid = string.Format(@"select * from tblKhachHang where taikhoan = '{0}'", txtTenDN.Text);
                string sqlsopx = string.Format(@"select Top(1) * from tblPHieuxuat order by sopx desc ");
                string makh = string.Empty;
                string sotien = string.Empty;
                int spx = 0;
                string ngayxuat = txtNgayLap.Text;
                string diachi = txtDC.Text;
                string tt = lTongTien.Text;
                string[] tien = tt.Split(',', ' ');

                string tongtien = tien[0] + tien[1] + tien[2];

                //string t = gvDonHang.Rows[0].Cells[0].Text;


                SqlCommand cmd = new SqlCommand(sqlid, dl.CNN);
                dl.CNN.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    makh = dr["makh"].ToString();
                }
                dl.CNN.Close();

                SqlCommand scmd = new SqlCommand(sqlsopx, dl.CNN);
                dl.CNN.Open();
                SqlDataReader sdr = scmd.ExecuteReader();
                while (sdr.Read())
                {
                    spx = Convert.ToInt32(sdr["SoPX"]);
                }
                int px = spx + 1;
                dl.CNN.Close();

                string sql_insert_px = string.Format(@"insert into tblPhieuXuat(sopx, makh, ngayxuat, diachigiao,tongtien)
        values('{0}', '{1}', '{2}', N'{3}', '{4}')", px, makh, ngayxuat, diachi, tongtien);





                if (TrangThai == "1")
                {
                    gvDonHang.SelectedIndex = -1;
                    dl.CapNhapDuLieu(sql_insert_px);
                    dl.CNN.Close();


                    for (int i = 0; i < gvChiTietDH.Rows.Count; i++)
                    {
                        string tendt = gvChiTietDH.Rows[i].Cells[1].Text;
                        string slmua = gvChiTietDH.Rows[i].Cells[2].Text;
                        //string trongkho = gvChiTietDH.Rows[i].Cells[3].Text;
                        HiddenField id = (HiddenField)gvChiTietDH.Rows[i].Cells[0].FindControl("hfID");
                        string gia = gvChiTietDH.Rows[i].Cells[4].Text;
                        string[] price = gia.Split(',', ' ');

                        string giaban = price[0] + price[1] + price[2];

                        string sql_insert_dpx = string.Format(@"insert into tblDongPX(sopx, iddt, soluongmua, giaban) values({0}, '{1}', '{2}' , '{3}' )", px, id.Value, slmua, giaban);
                        dl.CapNhapDuLieu(sql_insert_dpx);
                        dl.CNN.Close();


                    }
                    string del = string.Format(@"delete from tbldonhang where iddonhang='{0}'", lMaDH.Text);
                    dl.CapNhapDuLieu(del);
                    gvDonHang.DataBind();
                    dl.CNN.Close();
                   MessegeBox.Show("Thực hiện thành công!");
                }
                else
                {
                    MessegeBox.Show("- Không thực hiện cập nhật. \n- Bạn hãy chọn một bản ghi và trạng thái thanh toán!");
                }
            }
            catch
            {
                MessegeBox.Show("Không thực hiện!!!");
            }
        }
    }
}