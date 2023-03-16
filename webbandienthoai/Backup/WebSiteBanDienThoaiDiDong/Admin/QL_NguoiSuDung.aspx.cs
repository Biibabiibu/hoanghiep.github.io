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
    public partial class QL_NguoiSuDung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            if (Request["Key"] != null)
            {
                sdsNguoiSuDung.SelectCommand = "SELECT * FROM [tblNguoiSuDung] WHERE (TenDangNhap Like '%" + Request["Key"] + "%')";
            }
        }

        protected void gvNguoiSuDung_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtTenDN.Text = gvNguoiSuDung.Rows[gvNguoiSuDung.SelectedIndex].Cells[0].Text;
            HiddenField MK = (HiddenField)gvNguoiSuDung.Rows[gvNguoiSuDung.SelectedIndex].Cells[5].FindControl("hfMK");
            txtMK.Attributes.Add("value", MK.Value);
            txtMK2.Attributes.Add("value", MK.Value);
            txtEmail.Text = gvNguoiSuDung.Rows[gvNguoiSuDung.SelectedIndex].Cells[1].Text;
            txtHoTen.Text = Server.HtmlDecode(gvNguoiSuDung.Rows[gvNguoiSuDung.SelectedIndex].Cells[2].Text);
            txtSDT.Text = gvNguoiSuDung.Rows[gvNguoiSuDung.SelectedIndex].Cells[3].Text;
            //txtDiaChi.Text = Server.HtmlDecode(gvNguoiSuDung.Rows[gvNguoiSuDung.SelectedIndex].Cells[4].Text);
            HiddenField Quyen = (HiddenField)gvNguoiSuDung.Rows[gvNguoiSuDung.SelectedIndex].Cells[4].FindControl("hfQuyen");
            ddlQuyen.SelectedValue = Quyen.Value.ToString();
        }
        protected string checkout(int checkvalue)
        {
            if (checkvalue == 2)
                return "Nhân viên";
            else
                return "Admin";
        }
        protected void clear()
        {
            txtTenDN.Text = null;
            txtMK.Attributes.Add("value", null);
            txtMK2.Attributes.Add("value", null);
            txtEmail.Text = null;
            txtHoTen.Text = null;
            txtSDT.Text = null;
            //txtDiaChi.Text = null;
        }

        protected void cmdHuyBo_Click(object sender, EventArgs e)
        {
            clear();
            gvNguoiSuDung.SelectedIndex = -1;
        }

        protected void cmdThem_Click(object sender, EventArgs e)
        {
            ThaoTacCSDL  dl = new ThaoTacCSDL ();
            string TenDangNhap, MatKhau, Email, HoVaTen, SDT;
            TenDangNhap = txtTenDN.Text;
            MatKhau = txtMK.Text;
            Email = txtEmail.Text;
            HoVaTen = txtHoTen.Text;
            SDT = txtSDT.Text;
            //DiaChi = txtDiaChi.Text;

            int Quyen = Convert.ToInt32(ddlQuyen.SelectedValue.ToString());
            string SQL_String1 = string.Format(@"SELECT * FROM tblNguoiSuDung WHERE TenDangNhap = '{0}'", TenDangNhap);
            if (dl.KiemTra(SQL_String1) == 0)
            {
                MessegeBox.Show("Tên đăng nhập đã tồn tại!");
            }
            else
            {
                string SQL_String2 = string.Format(@"INSERT INTO tblNguoiSuDung(TenDangNhap, MatKhau, Email, HoTen, SDT, Quyen) VALUES('{0}','{1}','{2}',N'{3}','{4}','{5}');", TenDangNhap, MatKhau, Email, HoVaTen, SDT, Quyen);
                dl.CapNhapDuLieu(SQL_String2);
                dl.CNN.Close();
                MessegeBox.Show("Thêm dữ liệu thành công!");
                gvNguoiSuDung.DataBind();
                clear();
            }
        }

        protected void cmdCapNhat_Click(object sender, EventArgs e)
        {
            try
            {
                ThaoTacCSDL  dl = new ThaoTacCSDL();
                string TenDangNhap, MatKhau, Email, HoVaTen, SDT, TenDN1;
                TenDangNhap = txtTenDN.Text;
                MatKhau = txtMK.Text;
                Email = txtEmail.Text;
                HoVaTen = txtHoTen.Text;
                SDT = txtSDT.Text;
                //DiaChi = txtDiaChi.Text;
                TenDN1 = gvNguoiSuDung.Rows[gvNguoiSuDung.SelectedIndex].Cells[0].Text;
                gvNguoiSuDung.SelectedIndex = -1;
                int Quyen = Convert.ToInt32(ddlQuyen.SelectedValue.ToString());
                string SQL_String1 = string.Format(@"SELECT * FROM tblNguoiSuDung WHERE TenDangNhap = '{0}'", TenDangNhap);
                if ((TenDangNhap != TenDN1) && (dl.KiemTra(SQL_String1) == 0))
                {
                    MessegeBox.Show("Tên đăng nhập đã tồn tại!");
                }
                else
                {
                    string SQL_String2 = string.Format(@"UPDATE tblNguoiSuDung SET TenDangNhap='{0}', MatKhau='{1}', Email='{2}', HoTen=N'{3}', SDT='{4}', Quyen={5} WHERE TenDangNhap='{6}'", TenDangNhap, MatKhau, Email, HoVaTen, SDT, Quyen, TenDN1);
                    dl.CapNhapDuLieu(SQL_String2);
                    dl.CNN.Close();
                    MessegeBox.Show("Cập nhật dữ liệu thành công!");
                    gvNguoiSuDung.DataBind();
                    clear();
                }
            }
            catch
            {
                MessegeBox.Show("Cần chọn một bản ghi để tiến hành cập nhật!");
            }
        }

        protected void cmdTimKiem_Click(object sender, EventArgs e)
        {
            if (txtTimKiem.Text.ToString().Trim() != "")
            {
                Response.Redirect("QL_NguoiSuDung.aspx?Key=" + txtTimKiem.Text.Trim());
            }
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("QL_NguoiSuDung.aspx");
        }
    }
}