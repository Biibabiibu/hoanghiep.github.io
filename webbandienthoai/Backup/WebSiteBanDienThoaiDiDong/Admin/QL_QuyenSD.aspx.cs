using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSiteBanDienThoaiDiDong.ThaoTac;

namespace WebSiteBanDienThoaiDiDong.Admin
{
    public partial class QL_QuyenSD : System.Web.UI.Page
    {
        ThaoTacCSDL dl = new ThaoTacCSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Key"] != null)
            {
                //sdsKhachHang.SelectCommand = "select * from tblKhachHang where (tenkh like N'%" + Request["Key"] + "%')";
                sdsQuyen.SelectCommand = "select * from tblQuyen where (tendangnhap like N'%" + Request["Key"] + "%')";

            }
        }

        protected void cmdTimKiem_Click(object sender, EventArgs e)
        {
            Response.Redirect("QL_QuyenSD.aspx?Key=" + txtTimKiem.Text.Trim());
        }

        protected void cmdThem_Click(object sender, EventArgs e)
        {
            string tendn = txtTenDN.Text;
            string idcn = ddlChucNang.SelectedValue;
            string mota = txtMota.Text;
            string s = string.Empty;
            for (int i = 0; i < cbPage.Items.Count; i++)
            {
                if (cbPage.Items[i].Selected && cbPage.Items[i].Value != "-1")
                {
                    s += cbPage.Items[i].Value + ",";
                }

            }

            if (s == "")
            {
                MessegeBox.Show("Bạn hãy chọn một trang để đặt quyền thực thi!");
                return;
            }

            string pages = s.Remove(s.Length - 1, 1);
            //string df = "0";
            string SQL_String1 = string.Format(@"SELECT * FROM tblQuyen WHERE TenDangNhap = '{0}'", tendn);
            if (dl.KiemTra(SQL_String1) == 0)
            {
                MessegeBox.Show("Tên đăng nhập đã tồn tại!");
            }
            else
            {
                string sql = string.Format(@"insert into tblQuyen(tendangnhap, idchucnang, mota, page, Macdinh) values(N'{0}', '{1}', N'{2}', N'{3}', '{4}')", tendn, idcn, mota, pages, 0);
                GetData.Systems.Data();
                dl.CapNhapDuLieu(sql);
                gvChucNang.DataBind();
                dl.CNN.Close();
                MessegeBox.Show("Thêm mới dữ liệu thành công!");
            }
        
        }

        protected void cmdCapNhat_Click(object sender, EventArgs e)
        {
            string tendn = txtTenDN.Text;
            string idcn = ddlChucNang.SelectedValue;
            string mota = txtMota.Text;


            string s = string.Empty;
            
            for (int i = 0; i < cbPage.Items.Count; i++)
            {
                if (cbPage.Items[i].Selected && cbPage.Items[i].Value != "-1")
                {
                    s += cbPage.Items[i].Value + ",";
                }

            }

            if (s == "")
            {
                MessegeBox.Show("Bạn hãy chọn một trang để đặt quyền thực thi!");
                return;
            }

            string pages = s.Remove(s.Length - 1, 1);


            string sql = string.Format(@"update tblQuyen set tendangnhap='{0}', idchucnang='{1}', mota=N'{2}', page='{3}' where tendangnhap='{4}'", tendn, idcn, mota, pages, tendn);
            dl.CapNhapDuLieu(sql);
            gvChucNang.DataBind();
            dl.CNN.Close();
            MessegeBox.Show("Cập nhật dữ liệu thành công!");
            Server.Transfer("QL_QuyenSD.aspx");
        
        }

        protected void gvChucNang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                foreach (ListItem li in cbPage.Items)
                {
                    li.Selected = false;
                }

            }
            txtTenDN.Text = gvChucNang.Rows[gvChucNang.SelectedIndex].Cells[0].Text;
            ddlChucNang.SelectedValue = gvChucNang.Rows[gvChucNang.SelectedIndex].Cells[1].Text;
            txtMota.Text = Server.HtmlDecode(gvChucNang.Rows[gvChucNang.SelectedIndex].Cells[2].Text);
            txtTenDN.Enabled = false;
            HiddenField hfid = (HiddenField)gvChucNang.Rows[gvChucNang.SelectedIndex].Cells[4].FindControl("hfID");
            GetData.Systems.Data();
            hfIDCN.Value = hfid.Value;
            //cbPage.SelectedValue = gvChucNang.Rows[gvChucNang.SelectedIndex].Cells[3].Text;

            string p = gvChucNang.Rows[gvChucNang.SelectedIndex].Cells[3].Text;

            string[] items = p.Split(',');
            for (int i = 0; i <= items.GetUpperBound(0); i++)
            {
                ListItem currentCheckBox = cbPage.Items.FindByValue(items[i].ToString());

                if (currentCheckBox != null)
                {
                    currentCheckBox.Selected = true;
                }
            }
        }

        protected void ddlChucNang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlChucNang.SelectedValue == "1")
            {
                txtMota.Text = "Mở tab các trang quản lý";
            }
            else
            {
                txtMota.Text = "Khóa tab các trang quản lý";
            }
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("QL_QuyenSD.aspx");
        }

        protected void lbCheckAll_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in cbPage.Items)
            {
                li.Selected = true;
            }
        }

        protected void lbUnCheckAll_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in cbPage.Items)
            {
                li.Selected = false;
            }
        }

        protected void cmdHuy_Click(object sender, EventArgs e)
        {

        }
    }
}