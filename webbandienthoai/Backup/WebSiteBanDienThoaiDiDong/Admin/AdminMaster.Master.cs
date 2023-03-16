using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data.SqlClient;
using System;
using WebSiteBanDienThoaiDiDong.ThaoTac;

namespace WebSiteBanDienThoaiDiDong.Admin
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string tendn = (string)(Session["tendangnhap"]);
            string page = string.Empty;
            string chucnang = string.Empty;
            string hienthi = string.Empty;
            string sql = string.Format(@"select * from tblQuyen where tendangnhap='{0}'", tendn);
            dl.CNN.Open();
            SqlCommand cmd = new SqlCommand(sql, dl.CNN);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                chucnang = dr[2].ToString();
                page = dr[4].ToString();
                hienthi = dr["Macdinh"].ToString();
            }
            //string index = "";

            if (hienthi.Trim() == "1")
            {
                p9.Visible = true;
            }
            else
            {
                p9.Visible = false;
            }

            string[] arrPage = page.Split(',');
            if (chucnang == "2")
            {
                for (int i = 0; i < arrPage.Length; i++)
                {
                    switch (Convert.ToInt32(arrPage[i]))
                    {
                        case 0: p1.Visible = false; break;
                        case 1: p2.Visible = false; break;
                        case 2: p3.Visible = false; break;
                        case 3: p4.Visible = false; break;
                        case 4: p5.Visible = false; break;
                        case 5: p6.Visible = false; break;
                        case 6: p7.Visible = false; break;
                        case 7: p8.Visible = false; break;
                        case 8: p9.Visible = false; break;
                        case 9: p10.Visible = false; break;
                    }
                }
            }

        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("DangNhap.aspx");
        }
    }
}