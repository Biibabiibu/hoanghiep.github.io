using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace WebSiteBanDienThoaiDiDong.ThaoTac
{
    public class LuotTruyCap
    {
        public LuotTruyCap()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public double Doc()
        {
            double Luot = 0;
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string SQL = string.Format(@"SELECT SoNguoi FROM tblLuotTruyCap");
            SqlDataReader doc;
            doc = dl.LayDuLieu(SQL);
            while (doc.Read())
            {
                Luot = Convert.ToDouble(doc["SoNguoi"].ToString());
            }
            doc.Dispose();
            dl.CNN.Close();
            dl.CNN.Dispose();
            return Luot;
        }
        public void Ghi(double So)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string SQL = string.Format(@"UPDATE tblLuotTruyCap SET SoNguoi={0}, Ngay='{1}'", So, DateTime.Now);
            dl.CapNhapDuLieu(SQL);
            dl.CNN.Close();
            dl.CNN.Dispose();
        }
    }
}