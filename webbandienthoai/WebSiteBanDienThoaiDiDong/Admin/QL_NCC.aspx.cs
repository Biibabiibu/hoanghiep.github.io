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
    public partial class QL_NCC : System.Web.UI.Page
    {
        ThaoTacCSDL dl = new ThaoTacCSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Key"] != null)
            {
                sdsNCC.SelectCommand = "SELECT * FROM [tblNCC] WHERE (TenNCC Like N'%" + Request["Key"] + "%')";
            }
        }

        protected void gvNCC_SelectedIndexChanged(object sender, EventArgs e)
        {
            lMaSo.Text = gvNCC.Rows[gvNCC.SelectedIndex].Cells[0].Text;
            txtTenNCC.Text = Server.HtmlDecode(gvNCC.Rows[gvNCC.SelectedIndex].Cells[1].Text);
            txtGioiThieu.Text = Server.HtmlDecode(gvNCC.Rows[gvNCC.SelectedIndex].Cells[2].Text);
    
        }

        protected void cmdTimKiem_Click(object sender, EventArgs e)
        {
            if (txtTimKiem.Text.ToString().Trim() != "")
            {
                Response.Redirect("QL_NCC.aspx?Key=" + txtTimKiem.Text.Trim());
            }
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("QL_NCC.aspx");
        }
        protected void clear()
        {
            lMaSo.Text = "Tự động";
            txtTenNCC.Text = null;
            txtGioiThieu.Text = null;
        }

        protected void cmdCapNhat_Click(object sender, EventArgs e)
        {
            try
            {
                string TenNCC, GioiThieu;
                int MaNCC = Convert.ToInt32(lMaSo.Text);
                TenNCC = txtTenNCC.Text;
                GioiThieu = txtGioiThieu.Text;

                gvNCC.SelectedIndex = -1;

                string SQL_String2 = string.Format(@"UPDATE tblNCC SET TenNCC=N'{0}', GioiThieu=N'{1}' WHERE IDNCC={2}", TenNCC, GioiThieu, MaNCC);
                dl.CapNhapDuLieu(SQL_String2);
                dl.CNN.Close();
                MessegeBox.Show("Cập nhật dữ liệu thành công!");
                gvNCC.DataBind();
                clear();

            }
            catch
            {
                MessegeBox.Show("Cần chọn một bản ghi để tiến hành cập nhật!");
            }
        }

        protected void cmdThem_Click(object sender, EventArgs e)
        {
            string TenNCC, GioiThieu;
            TenNCC = txtTenNCC.Text;
            GioiThieu = txtGioiThieu.Text;
            string SQL_String2 = string.Format(@"INSERT INTO tblNCC(TenNCC,GioiThieu) VALUES(N'{0}',N'{1}');", TenNCC, GioiThieu);
            dl.CapNhapDuLieu(SQL_String2);
            dl.CNN.Close();
            MessegeBox.Show("Thêm dữ liệu thành công!");
            gvNCC.DataBind();
            clear();
        }

        protected void cmdHuy_Click(object sender, EventArgs e)
        {
            clear();
            gvNCC.SelectedIndex = -1;
        }
    }
}