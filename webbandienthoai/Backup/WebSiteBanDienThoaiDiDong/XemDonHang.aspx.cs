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

namespace WebSiteBanDienThoaiDiDong
{
    public partial class XemDonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected string checkout(int checkvalue)
        {
            if (checkvalue == 1)
                return "Đã thanh toán";
            else
                return "Chưa thanh toán";
        }

        protected void gvXemDH_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("ChiTietDonHang.aspx?MaDH=" + gvXemDH.Rows[gvXemDH.SelectedIndex].Cells[1].Text.ToString());
        }
    }
}