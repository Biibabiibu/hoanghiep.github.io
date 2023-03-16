using System;
using System.Collections;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using WebSiteBanDienThoaiDiDong.ThaoTac;

namespace WebSiteBanDienThoaiDiDong
{
    public partial class ChiTietDienThoai : System.Web.UI.Page
    {
        ThaoTacCSDL dl = new ThaoTacCSDL();     
        protected string checkout(int checkvalue)
        {
            if (checkvalue > 0)
                return "Có";
            else
                return "Không";
        }
        protected string status(int checkvalue)
        {
            if (checkvalue > 0)
                return "Còn hàng";
            else
                return "Hết hàng";
        }
      

       
    }
}