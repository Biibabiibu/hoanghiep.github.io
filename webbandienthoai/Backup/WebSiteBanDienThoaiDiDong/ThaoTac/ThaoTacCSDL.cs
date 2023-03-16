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
    public class ThaoTacCSDL
    {
        public SqlConnection CNN = new SqlConnection(@"Data Source=DESKTOP-ESSSM41;Initial Catalog=DataBanHang;Integrated Security=True");
      public ThaoTacCSDL()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public SqlDataReader LayDuLieu(String ChuoiTruyVan)
        {
            //Select * truyen vao chuoi truy van
            SqlCommand cmd = new SqlCommand(ChuoiTruyVan, CNN);
            CNN.Open();
            return cmd.ExecuteReader();
        }
        public int SoBanGhi(String ChuoiTruyVan)
        {
            //Select * truyen vao chuoi truy van
            SqlCommand cmd = new SqlCommand(ChuoiTruyVan, CNN);
            SqlDataReader dtr;
            CNN.Open();
            int i = 0;
            dtr = cmd.ExecuteReader();
            while (dtr.Read())
            {
                i += 1;
            }

            return i;
            dtr.Close();
        }


        public void ThemDuLieu(String ChuoiTruyVan)
        {
            //Insert * truyen chuoi truy van
           
            SqlCommand cmd = new SqlCommand(ChuoiTruyVan, CNN);
            CNN.Open();
            cmd.ExecuteNonQuery();
        }
        public DataSet LaySoBanGhi(int Vitribatdau)
        {
            //Insert * truyen chuoi truy van
            SqlCommand cmd = new SqlCommand("Select * from ten", CNN);
            CNN.Open();
            SqlDataAdapter adt = new SqlDataAdapter(cmd);
            DataSet dts = new DataSet();
            adt.Fill(dts, (Vitribatdau - 1) * 4, 4, "Ten");
            return dts;
        }
        public DataSet LayTinTuc(int vitridau)
        {
            SqlCommand com = new SqlCommand("SELECT * FROM tblTinTuc ORDER BY MaTinTuc DESC", CNN);
            CNN.Open();
            SqlDataAdapter dad = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            dad.Fill(ds, (vitridau - 1) * 6, 6, "tblTinTuc");
            return ds;
        }
        public DataSet LayDienThoai(int vitridau, String st)
        {
            SqlCommand com = new SqlCommand(st, CNN);
            CNN.Open();
            SqlDataAdapter dad = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            dad.Fill(ds, (vitridau - 1) * 12, 12, "tblDienThoai");
            return ds;
        }
        public void CapNhapDuLieu(String ChuoitruyVan)
        {
            //Update * Truyen vao chuoi truy van
            SqlCommand cmd = new SqlCommand(ChuoitruyVan, CNN);
            CNN.Open();
            cmd.ExecuteNonQuery();
        }
        public int KiemTra(String t)
        {
            SqlCommand cm = new SqlCommand();
            cm.CommandText = t;
            cm.CommandType = CommandType.Text;
            cm.Connection = CNN;
            CNN.Open();
            SqlDataReader dr = cm.ExecuteReader();
            if (dr.HasRows == true)
            {
                cm.Dispose();
                dr.Dispose();
                CNN.Close();
                return 0;
            }
            else
            {
                cm.Dispose();
                dr.Dispose();
                CNN.Close();
                return 1;
            }

        }

        public int laychucnang(string sql, string code)
        {

            string index = "";
            string page = string.Empty;
            CNN.Open();
            SqlCommand cmd = new SqlCommand(sql, CNN);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                index = dr[2].ToString();
                page = dr[4].ToString();
            }
            int idx;
            idx = page.IndexOf(code);
            if ((index == "1") && (idx.ToString() != "-1"))
            {
                return 0;
            }
            else
            {
                return 1;
            }

            CNN.Close();
        }

        
    }
  }
