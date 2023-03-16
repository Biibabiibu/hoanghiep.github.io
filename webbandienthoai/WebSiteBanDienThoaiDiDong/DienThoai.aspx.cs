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
    public partial class DienThoai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string id = Request["IDNSX"];
            string s = "";
            if (!IsPostBack)
            {
                s = string.Format(@"SELECT * FROM tblDienThoai WHERE IDNSX='{0}' ORDER BY IDDT DESC", Request["IDNSX"]);
            }
            else
            {
                s = string.Format(@"SELECT * FROM tblDienThoai WHERE IDNSX='{0}'" + ddlGiaTu.SelectedValue.ToString() + ddlGia.SelectedValue.ToString(), Request["IDNSX"]);
            }
            //Download source code FREE tai Sharecode.vn
            int IDTrangDT = 0;
            if (Request["IDTrangDT"] != null)
            {
                IDTrangDT = int.Parse(Request["IDTrangDT"]);
                rDienThoai.DataSource = dl.LayDienThoai(IDTrangDT, s);
                rDienThoai.DataBind();
                dl.CNN.Close();
            }
            else
            {
                IDTrangDT = 1;
                rDienThoai.DataSource = dl.LayDienThoai(1, s);
                rDienThoai.DataBind();
                dl.CNN.Close();
            }
            int soTrang, soBanGhi;
            soBanGhi = dl.SoBanGhi(s);
            if ((soBanGhi % 12) == 0)
            {
                soTrang = soBanGhi / 12;
            }
            else
            {
                //Download source code FREE tai Sharecode.vn
                soTrang = soBanGhi / 12 + 1;
            }
            if (!IsPostBack)
            {
                for (int i = 1; i <= soTrang; i++)
                {
                    if (i == IDTrangDT)
                    {
                        lTrangDienThoai.Text += "<a href=DienThoai.aspx?IDTrangDT=" + i.ToString() + "&IDNSX=" + id.ToString() + "><b style=" + "color:red" + ">" + i + @"</b></a>" + "&nbsp;";
                    }
                    else
                    {
                        lTrangDienThoai.Text += "<a href=DienThoai.aspx?IDTrangDT=" + i.ToString() + "&IDNSX=" + id.ToString() + ">" + i + @"</a>" + "&nbsp;";
                    }
                }
            }
        }
    }
}