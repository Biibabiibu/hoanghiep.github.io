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
    public partial class HuongDan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Random rd = new Random();
            int a = rd.Next(1, 3);
            Response.Write(a);
        }
    }
}