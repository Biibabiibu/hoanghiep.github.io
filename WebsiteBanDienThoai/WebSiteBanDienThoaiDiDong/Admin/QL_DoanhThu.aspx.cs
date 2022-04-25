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

namespace WebSiteBanDienThoaiDiDong.Admin
{
    public partial class QL_DoanhThu1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem ls = new ListItem();

                for (int j = 1; j <= 12; j++)
                {
                    ls.Text = j.ToString();
                    string s = "Tháng  " + j.ToString();
                    ddlThang.Items.Add(new ListItem(s, ls.Text));

                }
                for (int i = 1; i <= 4; i++)
                {
                    ls.Text = i.ToString();
                    string s = "Quý  " + i.ToString();
                    ddlQuy.Items.Add(new ListItem(s, ls.Text));
                }
            }
        }
        protected double tinhtien()
        {
            double TongTien = 0;
            foreach (GridViewRow gr in gvDoanhThu.Rows)
            {
                HiddenField TT = (HiddenField)gr.Cells[0].FindControl("hfTT");
                TongTien = TongTien + Convert.ToDouble(TT.Value);
            }
            return TongTien;
        }
        protected void cmddtThang_Click(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlThang.SelectedValue = Convert.ToString(DateTime.Now.Month);
            }
            string Thang = ddlThang.SelectedValue;
            sdsDoanhThu.SelectCommand = string.Format(@"SELECT * FROM [tblPhieuXuat] WHERE (MONTH([NgayXuat]) = {0}) ORDER BY [SoPX] DESC", Thang);
            lblDT.Text = "Doanh thu tháng " + Thang;
        }

        protected void cmddtQuy_Click(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlQuy.SelectedValue = Convert.ToString(DateTime.Now.Month);
            }
            int quy = int.Parse(ddlQuy.SelectedValue);
            if (quy == 1)
            {

                sdsDoanhThu.SelectCommand = string.Format(@"SELECT * FROM [tblPhieuXuat] WHERE (MONTH([NgayXuat]) BETWEEN 1 AND 3) ORDER BY [SoPX] DESC");
            }
            if (quy == 2)
            {

                sdsDoanhThu.SelectCommand = string.Format(@"SELECT * FROM [tblPhieuXuat] WHERE (MONTH([NgayXuat]) BETWEEN 4 AND 6) ORDER BY [SoPX] DESC");
            }
            if (quy == 3)
            {

                sdsDoanhThu.SelectCommand = string.Format(@"SELECT * FROM [tblPhieuXuat] WHERE (MONTH([NgayXuat]) BETWEEN 7 AND 9) ORDER BY [SoPX] DESC");
            }
            if (quy == 4)
            {

                sdsDoanhThu.SelectCommand = string.Format(@"SELECT * FROM [tblPhieuXuat] WHERE (MONTH([NgayXuat]) BETWEEN 10 AND 12) ORDER BY [SoPX] DESC");
            }
            lblDT.Text = "Doanh thu qúy " + quy;
    
        }

        protected void gvDoanhThu_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = "Tổng tiền: " + tinhtien().ToString("n0") + " VNÐ";
            }
        }
    }
}