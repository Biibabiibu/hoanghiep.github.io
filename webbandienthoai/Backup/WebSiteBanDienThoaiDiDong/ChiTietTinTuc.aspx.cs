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

namespace WebSiteBanDienThoaiDiDong
{
    public partial class ChiTietTinTuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string tinid;
            tinid = Request["tinid"];
            string s = string.Format(@"SELECT * FROM tblTinTuc WHERE MaTinTuc='{0}'", tinid);
            dlChiTietTinTuc.DataSource = dl.LayDuLieu(s);
            dlChiTietTinTuc.DataBind();
            dl.CNN.Close();
            //Download source code FREE tai Sharecode.vn
        }
    }
}