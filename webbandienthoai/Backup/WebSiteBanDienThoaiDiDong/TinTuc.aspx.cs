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
    public partial class TinTuc : System.Web.UI.Page
    {
        ThaoTacCSDL dl = new ThaoTacCSDL();
        protected void Page_Load(object sender, EventArgs e)
        {

            int IDTrang = 0;
            if (Request["IDtrang"] != null)
            {
                IDTrang = int.Parse(Request["IDtrang"]);
                DLTinTuc.DataSource = dl.LayTinTuc(IDTrang);
                DLTinTuc.DataBind();
                dl.CNN.Close();
            }
            else
            {
                IDTrang = 1;
                DLTinTuc.DataSource = dl.LayTinTuc(1);
                DLTinTuc.DataBind();
                dl.CNN.Close();
            }
            int soTrang, soBanGhi;
            soBanGhi = dl.SoBanGhi("SELECT * FROM tblTinTuc");
            if ((soBanGhi % 6) == 0)
            {
                soTrang = soBanGhi / 6;
            }
            else
            {
                soTrang = soBanGhi / 6 + 1;
            }
            for (int i = 1; i <= soTrang; i++)
            {
                if (i == IDTrang)
                {
                    lTrangTinTuc.Text += "<a href=TinTuc.aspx?IDTrang=" + i.ToString() + "><b style=" + "color:red" + ">" + i + @"</b></a>" + "&nbsp;";
                }
                else
                {
                    lTrangTinTuc.Text += "<a href=TinTuc.aspx?IDTrang=" + i.ToString() + ">" + i + @"</a>" + "&nbsp;";
                }
            }
        }
    }
}