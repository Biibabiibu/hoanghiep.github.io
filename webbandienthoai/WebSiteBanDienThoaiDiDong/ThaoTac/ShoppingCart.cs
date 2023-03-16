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
using System.Collections.Generic;


namespace WebSiteBanDienThoaiDiDong.ThaoTac
{
    public class ShoppingCart
    {
        public List<Product> Products { get; set; }
        public static readonly ShoppingCart Instance;
        static ShoppingCart()
        {
            if (HttpContext.Current.Session["giohang"] == null)
            {
                Instance = new ShoppingCart();
                Instance.Products = new List<Product>();
                HttpContext.Current.Session["giohang"] = Instance;
            }
            else
            {
                Instance = (ShoppingCart)HttpContext.Current.Session["giohang"];
            }
        }
        public int TongThanhTien
        {
            get
            {
                int tong = 0;
                foreach (Product product in Products)
                {
                    tong += product.ThanhTien;
                }
                return tong;
            }
        }
        public void AddProduct(Product newProduct)
        {
            foreach (Product product in Products)
            {
                if (newProduct.ProductID == product.ProductID)
                {
                    product.Quantity += newProduct.Quantity;
                    return;
                }
            }
            Products.Add(newProduct);
        }
        public void RemoveProduct(string productID)
        {
            foreach (Product product in Products)
            {
                if (product.ProductID == productID)
                {
                    Products.Remove(product);
                    return;
                }
            }
        }
        public void UpdateProduct(string productID, int quantity)
        {
            foreach (Product product in Products)
            {
                if (product.ProductID == productID)
                {
                    product.Quantity = quantity;
                }
            }
        }
        public string TenSP
        {
            get
            {
                string Ten = "";
                foreach (Product sp in Products)
                {
                    Ten = sp.ProductName;
                }
                return Ten;
            }
        }
        public void Clear()
        {
            Products.Clear();
        }
        public ShoppingCart()
        {

        }
    }
}