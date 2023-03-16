using System;
using System.Data;
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
    public class Product
    {
        public string ProductID { get; set; }
        public string ProductName { get; set; }
        public int Price { get; set; }
        public int Quantity { get; set; }
        public int ThanhTien
        {
            get
            {
                return Price * Quantity;
            }
        }
        public Product()
        {
        }
    }
}