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
    public partial class QL_ChucNang : System.Web.UI.Page
    {
        ThaoTacCSDL dl = new ThaoTacCSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Key"] != null)
            {
                sdsChucNang.SelectCommand = "SELECT * FROM [tblChucNang] WHERE (TenChucNang Like N'%" + Request["Key"] + "%')";
            }
        }

        protected void gvChucNang_SelectedIndexChanged(object sender, EventArgs e)
        {
            lMaSo.Text = gvChucNang.Rows[gvChucNang.SelectedIndex].Cells[0].Text;
            txtTenChucNang.Text = Server.HtmlDecode(gvChucNang.Rows[gvChucNang.SelectedIndex].Cells[1].Text);
            txtMota.Text = Server.HtmlDecode(gvChucNang.Rows[gvChucNang.SelectedIndex].Cells[2].Text);
    
        }
        protected void clear()
        {
            lMaSo.Text = "Tự động";
            txtTenChucNang.Text = null;
            txtMota.Text = null;
        }
        protected void cmdCapNhat_Click(object sender, EventArgs e)
        {
            try
            {

                string TenChucNang, Mota;
                int MaChucNang = Convert.ToInt32(lMaSo.Text);
                TenChucNang = txtTenChucNang.Text;
                Mota = txtMota.Text;

                gvChucNang.SelectedIndex = -1;

                string SQL_String2 = string.Format(@"UPDATE tblChucNang SET TenChucNang=N'{0}', Mota=N'{1}' WHERE IDChucNang={2}", TenChucNang, Mota, MaChucNang);
                dl.CapNhapDuLieu(SQL_String2);
                dl.CNN.Close();
                MessegeBox.Show("Cập nhật dữ liệu thành công!");
                gvChucNang.DataBind();
                clear();

            }
            catch
            {
                MessegeBox.Show("Cần chọn một bản ghi để tiến hành cập nhật!");
            }
        }

        protected void cmdHuy_Click(object sender, EventArgs e)
        {
            clear();
            gvChucNang.SelectedIndex = -1;
        }
    }
}