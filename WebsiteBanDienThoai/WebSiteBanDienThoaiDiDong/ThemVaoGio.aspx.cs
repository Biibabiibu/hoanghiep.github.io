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
    public partial class ThemVaoGio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            int sl = 0, gia = 0;
            int soluongdat = 0;
            string IDDT = string.Empty;

            string TenDT = "";
            string st = string.Format(@"SELECT * FROM tblDienThoai WHERE IDDT='{0}'", Request["IDDT"]);
            SqlDataReader d;
            d = dl.LayDuLieu(st);
            while (d.Read())
            {
                IDDT = Convert.ToString(d["IDDT"]);
                TenDT = d["TenDT"].ToString();
                sl = Convert.ToInt32(d["SoLuong"]);
                gia = Convert.ToInt32(d["Gia"]);
                soluongdat = 1;

            }
            if (sl == 0)
            {
                MessegeBox.Show("Mặt hàng này đã hết hàng. Bạn vui lòng chọn sản phẩm khác");
                Page.Response.AppendHeader("Refresh", "0; URL=Default.aspx");
            }
            else
            {
                Product newProduct = new Product();
                newProduct.ProductID = IDDT;
                newProduct.ProductName = TenDT;
                newProduct.Quantity = soluongdat;
                newProduct.Price = gia;
                ShoppingCart.Instance.AddProduct(newProduct);
                dl.CNN.Close();
                Response.Redirect("GioHang.aspx");
            }

        }
    }
}