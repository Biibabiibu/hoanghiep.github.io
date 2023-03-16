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
    public partial class TimGia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string key = Request["Op"];

            string st = "";
            int IDTrangTK = 0;
            switch (key)
            {
                case "1": st = string.Format(@"SELECT * FROM tblDienThoai WHERE Gia <2000000 ORDER BY Gia"); break;
                case "2": st = string.Format(@"SELECT * FROM tblDienThoai WHERE (Gia BETWEEN 2000000 AND 4000000) ORDER BY Gia"); break;
                case "3": st = string.Format(@"SELECT * FROM tblDienThoai WHERE (Gia BETWEEN 4000000 AND 6000000) ORDER BY Gia"); break;
                case "4": st = string.Format(@"SELECT * FROM tblDienThoai WHERE (Gia BETWEEN 6000000 AND 8000000) ORDER BY Gia"); break;
                case "5": st = string.Format(@"SELECT * FROM tblDienThoai WHERE (Gia BETWEEN 8000000 AND 10000000) ORDER BY Gia"); break;
                case "6": st = string.Format(@"SELECT * FROM tblDienThoai WHERE Gia >10000000 ORDER BY Gia"); break;
            }

            //Download source code FREE tai Sharecode.vn
            int n = dl.SoBanGhi(st);
            dl.CNN.Close();
            if (n != 0)
            {
                if (Request["IDTrangTK"] != null)
                {
                    IDTrangTK = int.Parse(Request["IDTrangTK"]);
                    rTimKiem.DataSource = dl.LayDienThoai(IDTrangTK, st);
                    rTimKiem.DataBind();
                    dl.CNN.Close();
                }
                else
                {
                    IDTrangTK = 1;
                    rTimKiem.DataSource = dl.LayDienThoai(1, st);
                    rTimKiem.DataBind();
                    dl.CNN.Close();
                }
                int soTrang, soBanGhi;
                soBanGhi = dl.SoBanGhi(st);
                if ((soBanGhi % 12) == 0)
                {
                    soTrang = soBanGhi / 12;
                }
                else
                {
                    soTrang = soBanGhi / 12 + 1;
                }
                for (int i = 1; i <= soTrang; i++)
                {
                    if (i == IDTrangTK)
                    {
                        lTrangTK.Text += "<a href=TimGia.aspx?IDTrangTK=" + i.ToString() + "&Key=" + key + "><b style=" + "color:red" + ">" + i + @"</b></a>" + "&nbsp;";
                    }
                    else
                    {
                        lTrangTK.Text += "<a href=TimGia.aspx?IDTrangTK=" + i.ToString() + "&Key=" + key + ">" + i + @"</a>" + "&nbsp;";
                    }
                }
            }
            else
                lKQ.Text = "Không tìm thấy kết quả!";
        }
    }
}