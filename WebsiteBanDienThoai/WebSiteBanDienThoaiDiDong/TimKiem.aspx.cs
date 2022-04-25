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
    public partial class TimKiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string key = Request["Key"];
            string str = Request["str"];

            string st = string.Empty;
            int IDTrangTK = 0;

            //MessageBox.Show(chucnang.Length.ToString());

            if (key != null)
            {
                st = string.Format(@"SELECT * FROM tblDienThoai WHERE TenDT LIKE N'%{0}%' ORDER BY IDDT DESC", Request["Key"]);
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
                            lTrangTK.Text += "<a href=TimKiem.aspx?IDTrangTK=" + i.ToString() + "&Key=" + key + "><b style=" + "color:red" + ">" + i + @"</b></a>" + "&nbsp;";
                        }
                        else
                        {
                            lTrangTK.Text += "<a href=TimKiem.aspx?IDTrangTK=" + i.ToString() + "&Key=" + key + ">" + i + @"</a>" + "&nbsp;";
                        }
                    }
                }
                else
                    lKQ.Text = "Không tìm thấy kết quả!";
            }

            if (key == null && str != null)
            {
                string[] chucnang = str.Split(',');
                //st = string.Format(@"SELECT * FROM tblDienThoai WHERE (Wifi='{0}' or Congnghe3g='{1}'  or Java ='{2}') ", chucnang[0], chucnang[1], chucnang[2]);
                switch (chucnang.Length)
                {
                    case 1:
                        if (chucnang[0] == "wifi")
                        {
                            st = string.Format(@"SELECT * FROM tblDienThoai WHERE (Wifi='{0}') ", "1");
                        }
                        else if (chucnang[0] == "3g")
                        {
                            st = string.Format(@"SELECT * FROM tblDienThoai WHERE (congnghe3g='{0}') ", "1");
                        }
                        else
                        {
                            st = st = string.Format(@"SELECT * FROM tblDienThoai WHERE (Java='{0}') ", "1");
                        }; break;

                    case 2:
                        if ((chucnang[0] == "wifi") && (chucnang[1] == "3g"))
                        {
                            st = string.Format(@"SELECT * FROM tblDienThoai WHERE (Wifi='{0}' and Congnghe3g='{1}') ", "1", "1");
                        }
                        else if (chucnang[0] == "wifi" && chucnang[1] == "java")
                        {
                            st = string.Format(@"SELECT * FROM tblDienThoai WHERE (Wifi='{0}' and Java = '{1}') ", "1", "1");
                        }
                        else if (chucnang[0] == "3g" && chucnang[1] == "java")
                        {
                            st = string.Format(@"SELECT * FROM tblDienThoai WHERE (congnghe3g='{0}' and java='{1}') ", "1", "1");
                        }; break;
                    case 3:
                        if (chucnang[0] == "wifi" && chucnang[1] == "3g" && chucnang[2] == "java")
                        {
                            st = string.Format(@"SELECT * FROM tblDienThoai WHERE (Wifi='{0}' and Congnghe3g='{1}'  and Java ='{2}') ", "1", "1", "1");
                        }; break;
                }

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
                            lTrangTK.Text += "<a href=TimKiem.aspx?IDTrangTK=" + i.ToString() + "&Key=" + key + "><b style=" + "color:red" + ">" + i + @"</b></a>" + "&nbsp;";
                        }
                        else
                        {
                            lTrangTK.Text += "<a href=TimKiem.aspx?IDTrangTK=" + i.ToString() + "&Key=" + key + ">" + i + @"</a>" + "&nbsp;";
                        }
                    }
                }
                else
                    lKQ.Text = "Không tìm thấy kết quả!";
            }
        
        }
    }
}