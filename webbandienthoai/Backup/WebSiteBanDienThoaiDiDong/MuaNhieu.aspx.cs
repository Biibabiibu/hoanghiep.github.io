using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSiteBanDienThoaiDiDong
{
    public partial class MuaNhieu : System.Web.UI.Page
    {
        public int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            i = 0;
        }
        protected string tang()
        {
            i++;
            return Convert.ToString(i);
        }
    }
}