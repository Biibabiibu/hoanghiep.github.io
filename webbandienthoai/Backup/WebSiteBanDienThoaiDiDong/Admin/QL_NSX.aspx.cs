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
    public partial class QL_NSX : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            if (Request["Key"] != null)
            {
                sdsNSX.SelectCommand = "SELECT * FROM [tblNSX] WHERE (TenNSX Like N'%" + Request["Key"] + "%')";
            }
        }

        protected void cmdTimKiem_Click(object sender, EventArgs e)
        {
            if (txtTimKiem.Text.ToString().Trim() != "")
            {
                Response.Redirect("QL_NSX.aspx?Key=" + txtTimKiem.Text.Trim());
            }
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("QL_NSX.aspx");
        }

        protected void gvNSX_SelectedIndexChanged(object sender, EventArgs e)
        {
            lMaSo.Text = gvNSX.Rows[gvNSX.SelectedIndex].Cells[0].Text;
            txtTenNSX.Text = Server.HtmlDecode(gvNSX.Rows[gvNSX.SelectedIndex].Cells[1].Text);
            txtGioiThieu.Text = Server.HtmlDecode(gvNSX.Rows[gvNSX.SelectedIndex].Cells[2].Text);
 
        }
        protected void clear()
        {
            lMaSo.Text = "Tự động";
            txtTenNSX.Text = null;
            txtGioiThieu.Text = null;
        }
        protected void cmdCapNhat_Click(object sender, EventArgs e)
        {
            try
            {
                ThaoTacCSDL dl = new ThaoTacCSDL();
                string TenNSX, GioiThieu;
                int MaNSX = Convert.ToInt32(lMaSo.Text);
                TenNSX = txtTenNSX.Text;
                GioiThieu = txtGioiThieu.Text;

                gvNSX.SelectedIndex = -1;

                string SQL_String2 = string.Format(@"UPDATE tblNSX SET TenNSX=N'{0}', GioiThieu=N'{1}' WHERE IDNSX={2}", TenNSX, GioiThieu, MaNSX);
                dl.CapNhapDuLieu(SQL_String2);
                dl.CNN.Close();
                MessegeBox.Show("Cập nhật dữ liệu thành công!");
                gvNSX.DataBind();
                clear();

            }
            catch
            {
                MessegeBox.Show("Cần chọn một bản ghi để tiến hành cập nhật!");
            }
        }

        protected void cmdThem_Click(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string TenNSX, GioiThieu;

            TenNSX = txtTenNSX.Text;
            GioiThieu = txtGioiThieu.Text;


            string SQL_String2 = string.Format(@"INSERT INTO tblNSX(TenNSX,GioiThieu) VALUES(N'{0}',N'{1}');", TenNSX, GioiThieu);
            dl.CapNhapDuLieu(SQL_String2);
            dl.CNN.Close();
            MessegeBox.Show("Thêm dữ liệu thành công!");
            gvNSX.DataBind();
            clear();
        }

        protected void cmdHuy_Click(object sender, EventArgs e)
        {
            clear();
            gvNSX.SelectedIndex = -1;
        }
    }
}