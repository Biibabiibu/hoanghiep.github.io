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
    public partial class GioHang : System.Web.UI.Page
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

        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = "Tổng tiền: " + ShoppingCart.Instance.TongThanhTien.ToString("n0") + " VNĐ";
            }
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                string ProductID = Convert.ToString(e.CommandArgument);
                ShoppingCart.Instance.RemoveProduct(ProductID);
                BindData();
            }
        }

        protected void btnUpdateCart_Click(object sender, EventArgs e)
        {
            int sl = 0;
            foreach (GridViewRow row in gvCart.Rows)
            {

                if (row.RowType == DataControlRowType.DataRow)
                {
                    try
                    {
                        HiddenField hdProductID = (HiddenField)row.Cells[2].FindControl("hdProductID");
                        string ProductID = Convert.ToString(hdProductID.Value);
                        int quantity = int.Parse(((TextBox)row.Cells[2].FindControl("txtQuantity")).Text);
                        foreach (Product product in ShoppingCart.Instance.Products)
                        {
                            string sqlSL = string.Format(@"select * from tblDienthoai where iddt='{0}'", product.ProductID);
                            SqlCommand cmd = new SqlCommand(sqlSL, dl.CNN);
                            dl.CNN.Open();
                            SqlDataReader dr = cmd.ExecuteReader();
                            while (dr.Read())
                            {
                                sl = Convert.ToInt32(dr["SoLuong"]);
                            }
                            dr.Close();
                            dr.Dispose();
                            dl.CNN.Close();
                        }
                        if (sl == 0)
                        {
                            MessegeBox.Show("Đã hết mặt hàng này");
                            return;
                        }
                        else
                            if (quantity > sl)
                            {
                                MessegeBox.Show("- Bạn nhập quá số lượng còn trong kho. \n- Trong kho còn [" + sl + "] chiếc loại này.");
                                quantity = sl;
                            }
                            else
                                if ((quantity <= 0) || (quantity > 99))
                                {
                                    MessegeBox.Show("Số lượng ít nhất phải là 1 và tối đa là 99 chiếc");
                                    quantity = 1;
                                }
                                else
                                {
                                    ShoppingCart.Instance.UpdateProduct(ProductID, quantity);
                                }

                    }
                    catch (FormatException ex)
                    {
                    }
                }
            }
            BindData();
        }

        protected void btnBackToShop_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnClearCart_Click(object sender, EventArgs e)
        {
            ShoppingCart.Instance.Clear();
            BindData();
            Response.Redirect("GioHang.aspx");
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (ShoppingCart.Instance.Products.Count == 0)
            {
                MessegeBox.Show("Bạn chưa chọn mua sản phẩm nào!");
            }
            else
            {
                Response.Redirect("~/ThanhToan.aspx");
            }
        }
        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {

            foreach (Product product in ShoppingCart.Instance.Products)
            {
                string sql = string.Format(@"select * from tblDienThoai where iddt='{0}' ", product.ProductID);
                int sl = 0;
                SqlCommand cmd = new SqlCommand(sql, dl.CNN);
                dl.CNN.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    sl = Convert.ToInt32(dr["soluong"]);
                }
                dr.Close();
                dl.CNN.Close();
                //MessageBox.Show(sl.ToString());
                //TextBox t = gvCart.Rows.
            }
        }
    }
}