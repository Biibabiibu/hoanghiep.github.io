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
using System.Data.SqlClient;
using WebSiteBanDienThoaiDiDong.ThaoTac;

namespace WebSiteBanDienThoaiDiDong
{
    public partial class ChiTietDonHang : System.Web.UI.Page
    {
        ThaoTacCSDL dl = new ThaoTacCSDL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            string IDDH = gvChiTietDH.Rows[0].Cells[0].Text;
            //MessageBox.Show(IDDH);
            string dh = string.Format(@"Select * from tblDonHang where IDDonHang='{0}'", IDDH);
            string ddh = string.Format(@"Select * from tblDongDH where IDDonHang='{0}'", IDDH);

            string iddt = "";
            string slmua = "";
            SqlDataReader doc2;
            dl.CNN.Close();
            doc2 = dl.LayDuLieu(ddh);
            while (doc2.Read())
            {

                iddt = doc2["IDDT"].ToString();
                slmua = doc2["SLMua"].ToString();
            }
            doc2.Dispose();
            dl.CNN.Close();
            string update = string.Format("Update tblDienThoai set soluong = soluong + {0} where iddt='{1}'", slmua, iddt);
            dl.CapNhapDuLieu(update);
            dl.CNN.Close();

            string sqlXoaDH = string.Format(@"delete from tblDonHang where IDDonHang= '{0}'", IDDH);
            string sqlXoaDDH = string.Format(@"delete from tblDongDH where IDDonHang= '{0}'", IDDH);
            dl.CapNhapDuLieu(sqlXoaDDH);
            dl.CNN.Close();
            dl.CapNhapDuLieu(sqlXoaDH);
            dl.CNN.Close();
            MessegeBox.Show("Xóa thành công !!!");
            gvChiTietDH.DataBind();
            Response.Redirect("XemDonHang.aspx");
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            string IDDH = gvChiTietDH.Rows[0].Cells[0].Text;
            dl.CNN.Close();
            DateTime NgayLapDH = DateTime.Now;
            string makh = string.Empty;
            int sotien = 0;
            string ngaylap = NgayLapDH.ToString();
            string userid = Convert.ToString(Session["TenTK"]).ToString();
            string dh = string.Format(@"Select * from tblDonHang where IDDonHang='{0}'", IDDH);
            string ddh = string.Format(@"Select * from tblDongDH where IDDonHang='{0}'", IDDH);
            string diachi = "";
            int TongTien = 0;
            string iddt = "";
            string slmua = "";
            string giaban = "";
            SqlDataReader doc1, doc2;
            dl.CNN.Close();
            doc1 = dl.LayDuLieu(dh);
            while (doc1.Read())
            {
                diachi = doc1["DiaChiGiao"].ToString();
                TongTien = Convert.ToInt32(doc1["TongTien"]);
            }
            doc1.Dispose();
            dl.CNN.Close();

            doc2 = dl.LayDuLieu(ddh);
            while (doc2.Read())
            {

                iddt = doc2["IDDT"].ToString();
                slmua = doc2["SLMua"].ToString();
                giaban = doc2["Gia"].ToString();
            }
            doc2.Dispose();
            dl.CNN.Close();


            string s = string.Format(@"SELECT * From tblPhieuXuat");
            string s1 = string.Format(@"SELECT * FROM tblKhachHang WHERE TaiKhoan='{0}'", userid);
            string s2 = string.Format(@"SELECT TOP(1) * From tblPhieuXuat ORDER BY SoPX DESC");
            int sopx = 0;
            int so = dl.SoBanGhi(s); dl.CNN.Close();
            if (so == 0)
            {
                sopx = 1;
            }
            else
            {
                SqlDataReader doc;
                dl.CNN.Close();
                doc = dl.LayDuLieu(s2);
                while (doc.Read())
                {
                    sopx = Convert.ToInt32(doc["SoPX"].ToString()) + 1;
                }
                doc.Dispose();
            }
            dl.CNN.Close();
            SqlDataReader dr;
            dr = dl.LayDuLieu(s1);
            while (dr.Read())
            {
                makh = dr["MaKH"].ToString();
                sotien = Convert.ToInt32(dr["SoTien"]);
            }
            dl.CNN.Close();
            //string st = string.Format(@"INSERT INTO tblDonHang(IDDonHang,TaiKhoan,NgayLap,DiaChiGiao,TongTien,TrangThai) VALUES({0},'{1}','{2}',N'{3}',{4},{5})", donhangid, userid, ngaylap, dcGiaoHang, TongTien, 0);
            if (sotien <= 0 || sotien < TongTien)
            {
                MessegeBox.Show("Số tiền trong tài khoản của quý khách không đủ để thanh toán!");
            }
            else
            {
                string thanhtoan = string.Format(@"insert into tblPhieuXuat(SoPX, MaKH, NgayXuat, DiachiGiao, TongTien) values({0}, '{1}', '{2}', N'{3}', {4})", sopx, makh, ngaylap, diachi, TongTien);
                dl.CapNhapDuLieu(thanhtoan);
                dl.CNN.Close();


                string stt = string.Format(@"INSERT INTO tblDongPX(SoPX,IDDT,SoLuongMua,GiaBan) VALUES({0},'{1}','{2}','{3}')", sopx, iddt, slmua, giaban);

                dl.CapNhapDuLieu(stt);
                dl.CNN.Close();

                string update = string.Format("Update tblDienThoai set soluong = soluong - {0} where iddt='{1}'", slmua, iddt);
                dl.CapNhapDuLieu(update);
                dl.CNN.Close();

                int tientra = int.Parse(TongTien.ToString());
                string sqlTien = string.Format("Update tblKhachHang set sotien = sotien - {0} where makh='{1}'", tientra, makh);
                dl.CapNhapDuLieu(sqlTien);
                dl.CNN.Close();

                string sqlXoaDH = string.Format(@"delete from tblDonHang where IDDonHang= '{0}'", IDDH);
                string sqlXoaDDH = string.Format(@"delete from tblDongDH where IDDonHang= '{0}'", IDDH);
                dl.CapNhapDuLieu(sqlXoaDDH);
                dl.CNN.Close();
                dl.CapNhapDuLieu(sqlXoaDH);
                dl.CNN.Close();
                Response.Redirect("~/ThanhToanThanhCong.aspx");
            }
        }
    }
}