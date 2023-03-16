using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
    public partial class ThanhToan : System.Web.UI.Page
    {
        ThaoTacCSDL dl = new ThaoTacCSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }
        private void BindData()
        {
            gvCart.DataSource = ShoppingCart.Instance.Products;
            gvCart.DataBind();
        }
        protected void btnContShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnViewCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GioHang.aspx");
        }

        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            if (txtDiaChi.Text.Trim() == "")
            { return; }
            else
            {
                DateTime NgayLapDH = DateTime.Now;
                string makh = string.Empty;
                int sotien = 0;
                string ngaylap = NgayLapDH.ToString();
                string userid = Session["TenTK"].ToString();
                int TongTien = ShoppingCart.Instance.TongThanhTien;
                string dcGiaoHang = txtDiaChi.Text.Trim();
                string s = string.Format(@"SELECT * From tblDonHang");
                string s1 = string.Format(@"SELECT * FROM tblKhachHang WHERE TaiKhoan='{0}'", userid);
                string s2 = string.Format(@"SELECT TOP(1) * From tblDonHang ORDER BY IDDonHang DESC");
                int donhangid = 0;
                int so = dl.SoBanGhi(s); dl.CNN.Close();
                if (so == 0)
                {
                    donhangid = 1;
                }
                else
                {
                    SqlDataReader doc;
                    doc = dl.LayDuLieu(s2);
                    while (doc.Read())
                    {
                        donhangid = Convert.ToInt32(doc["IDDonHang"].ToString()) + 1;
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

                DateTime ngayhuy = DateTime.Now.AddDays(10);

                string st = string.Format(@"INSERT INTO tblDonHang(IDDonHang,TaiKhoan,NgayLap,DiaChiGiao,TongTien,TrangThai, NgayHuy) VALUES({0},'{1}','{2}',N'{3}',{4},{5}, N'{6}')", donhangid, userid, ngaylap, dcGiaoHang, TongTien, 0, ngayhuy);
                dl.CapNhapDuLieu(st);
                dl.CNN.Close();

                foreach (Product product in ShoppingCart.Instance.Products)
                {
                    string stt = string.Format(@"INSERT INTO tblDongDH(IDDonHang,IDDT,SLMua,Gia) VALUES({0},'{1}',{2},{3})", donhangid, product.ProductID, product.Quantity, product.Price);
                    dl.CapNhapDuLieu(stt);
                    dl.CNN.Close();

                    string update = string.Format("Update tblDienThoai set soluong = soluong - {0} where iddt='{1}'", product.Quantity, product.ProductID);
                    dl.CapNhapDuLieu(update);
                    dl.CNN.Close();
                }
                ShoppingCart.Instance.Clear();
                Response.Redirect("~/CamOn.aspx");

            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (txtDiaChi.Text.Trim() == "")
            { return; }
            else
            {

                dl.CNN.Close();
                DateTime NgayLapDH = DateTime.Now;
                string makh = string.Empty;
                int sotien = 0;
                string ngaylap = NgayLapDH.ToString();
                string userid = Convert.ToString(Session["TenTK"]).ToString();
                int TongTien = ShoppingCart.Instance.TongThanhTien;
                string dcGiaoHang = txtDiaChi.Text.Trim();
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
                    Response.Write("Số tiền trong tài khoản của quý khách không đủ để thanh toán!");
                }
                else
                {
                    string thanhtoan = string.Format(@"insert into tblPhieuXuat(SoPX, MaKH, NgayXuat, DiachiGiao, TongTien) values({0}, '{1}', '{2}', N'{3}', {4})", sopx, makh, ngaylap, dcGiaoHang, TongTien);
                    dl.CapNhapDuLieu(thanhtoan);
                    dl.CNN.Close();

                    foreach (Product product in ShoppingCart.Instance.Products)
                    {
                        string stt = string.Format(@"INSERT INTO tblDongPX(SoPX,IDDT,SoLuongMua,GiaBan) VALUES({0},'{1}',{2},{3})", sopx, product.ProductID, product.Quantity, product.Price);

                        dl.CapNhapDuLieu(stt);
                        dl.CNN.Close();

                        string update = string.Format("Update tblDienThoai set soluong = soluong - {0} where iddt='{1}'", product.Quantity, product.ProductID);
                        dl.CapNhapDuLieu(update);
                        dl.CNN.Close();

                        int tientra = int.Parse(TongTien.ToString());
                        string sqlTien = string.Format("Update tblKhachHang set sotien = sotien - {0} where makh='{1}'", tientra, makh);
                        dl.CapNhapDuLieu(sqlTien);
                        dl.CNN.Close();
                    }
                    ShoppingCart.Instance.Clear();
                    Response.Redirect("~/ThanhToanThanhCong.aspx");
                }

            }
        }

        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = "Tổng tiền: " + ShoppingCart.Instance.TongThanhTien.ToString("n0") + " VNĐ";
            }
        }

        protected void NganLuong_Click(object sender, ImageClickEventArgs e)
        {
            string receiver = "nguyenducminh.103@gmail.com";
            String comments = "Hãy lập trình ghi chú của bạn vào đây";
            String return_url = "https://nganluong.vn/";

            String price = ShoppingCart.Instance.TongThanhTien.ToString();
            String product = ShoppingCart.Instance.TenSP.ToString();
            Response.Redirect("https://www.nganluong.vn/advance_payment.php" + "?receiver=" + receiver + "&comments=" + comments + "&return_url=" + return_url + "&product=" + product + "&price=" + price);
            //this.url_checkout += "?receiver=" + receiver + "&comments=" + comments + "&return_url=" + return_url + "&product=" + product + "&price=" + price;
            //NganLuong.PostBackUrl = this.url_checkout;
            
        }
    }
}