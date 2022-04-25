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
    public partial class LienHe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void cmd_LienHe_Click(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string HoVaTen, Email, SDT, NoiDung;
            HoVaTen = txtHoVaTen.Text;
            Email = txtEmail.Text;
            SDT = txtSoDienThoai.Text;
            NoiDung = txtNoiDung.Text;
            string SQL_String = string.Format(@"INSERT INTO tblLienHe(HoTen, Email, SDT, NoiDung) VALUES(N'{0}','{1}','{2}',N'{3}')", HoVaTen, Email, SDT, NoiDung);
            dl.CapNhapDuLieu(SQL_String);
            dl.CNN.Close();
            Response.Redirect("LienHe_ThanhCong.aspx");
        }
    }
}