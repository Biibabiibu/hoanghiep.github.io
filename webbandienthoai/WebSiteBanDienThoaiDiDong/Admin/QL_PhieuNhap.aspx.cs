using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using GetData;
using System.Data.SqlClient;
using System.Text;
using System.Drawing;
using WebSiteBanDienThoaiDiDong.ThaoTac;
namespace WebSiteBanDienThoaiDiDong.Admin
{
    public partial class QL_PhieuNhap : System.Web.UI.Page
    {
        ThaoTacCSDL dl = new ThaoTacCSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeeDetails();
            }     
        }
        protected void BindEmployeeDetails()
        {
            SqlCommand cmd = new SqlCommand("Select * from tblTemp", dl.CNN);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            Systems.Data();
            da.Fill(ds);
            dl.CNN.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                gvDetails.DataSource = ds;
                gvDetails.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                gvDetails.DataSource = ds;
                gvDetails.DataBind();
                int columncount = gvDetails.Rows[0].Cells.Count;
                gvDetails.Rows[0].Cells.Clear();
                gvDetails.Rows[0].Cells.Add(new TableCell());
                gvDetails.Rows[0].Cells[0].ColumnSpan = columncount;
                gvDetails.Rows[0].Cells[0].Text = "No Records Found";
            }

        }

        protected void BindDetails(string sql, GridView grv)
        {
            SqlCommand cmd = new SqlCommand(sql, dl.CNN);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dl.CNN.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                grv.DataSource = ds;
                grv.DataBind();
                //sdsDetailsUpdate.SelectCommand = "Select * From tblDongPN Where SoPN=' " + lbSoPN.Text + "'";
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                grv.DataSource = ds;
                grv.DataBind();
                int columncount = grv.Rows[0].Cells.Count;
                grv.Rows[0].Cells.Clear();
                grv.Rows[0].Cells.Add(new TableCell());
                grv.Rows[0].Cells[0].ColumnSpan = columncount;
                grv.Rows[0].Cells[0].Text = "No Records Found";
            }

        }

        protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //int index = Convert.ToInt32(e.RowIndex);
            int id = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Values["ID"].ToString());
            //int id = Convert.ToInt32(gvDetailsUpdate.Rows[gvDetailsUpdate.SelectedIndex].Cells[0].FindControl("hfID"));
            dl.CNN.Open();
            SqlCommand cmd = new SqlCommand("delete from tblTemp where ID=" + id, dl.CNN);
            int result = cmd.ExecuteNonQuery();
            dl.CNN.Close();
            if (result == 1)
            {
                BindEmployeeDetails();
                Response.Write("Đã xóa bản ghi");
                lblresult.ForeColor = Color.Red;
                lblresult.Text = " details deleted successfully";
            }
        }

        protected void gvDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDetails.EditIndex = -1;
            BindEmployeeDetails();
        }

        protected void gvDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
              if (e.CommandName.Equals("AddNew"))
        {

            //TextBox tbsopn = (TextBox)gvDetails.FooterRow.FindControl("tbSoPN");
            TextBox tbiddt = (TextBox)gvDetails.FooterRow.FindControl("tbIDDT");
            TextBox tbtendt = (TextBox)gvDetails.FooterRow.FindControl("tbTenDT");
            TextBox tbsoluong = (TextBox)gvDetails.FooterRow.FindControl("tbSoLuong");
            TextBox tbgianhap = (TextBox)gvDetails.FooterRow.FindControl("tbGiaNhap");
            //string sopn = ddlSoPhieuNhap.SelectedValue;
            string iddt = tbiddt.Text;
            string tendt = tbtendt.Text;
            string soluong = tbsoluong.Text;
            int sl = int.Parse(soluong);
            string gianhap = tbgianhap.Text;
            string sqlChk = string.Format(@"select * from tblDienThoai where iddt = '{0}'", iddt);

            if (dl.KiemTra(sqlChk) == 0)
            {
                string sqlStr = string.Format(@"update tblDienthoai set soluong = soluong + {0}, tendt='{1}', gia='{2}' where iddt='{3}'", sl, tendt, gianhap, iddt);
                dl.CapNhapDuLieu(sqlStr);
                BindEmployeeDetails();                
                dl.CNN.Close();
                MessegeBox.Show("Mã điện thoại hoặc tên điện thoại đã tồn tại!");
                tbiddt.Focus();
            }


                string sql = string.Format(@"insert into tblTemp(IDDT, TenDT, SoLuong, GiaNhap) VALUES('{0}', N'{1}', '{2}', '{3}')", iddt, tendt, soluong, gianhap);
                //string sql = string.Format(@"insert into tblDongPN(SoPN) VALUES({0})", sopn);
                dl.CNN.Open();
                SqlCommand cmd = new SqlCommand(sql, dl.CNN);
                int result = cmd.ExecuteNonQuery();
                dl.CNN.Close();
                if (result == 1)
                {
                    BindEmployeeDetails();
                   lblresult.ForeColor = Color.Green;
                    lblresult.Text = "Thêm mới thành công!";
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "Chưa có bản ghi nào được thêm mới!";
                }
                Page.Response.AppendHeader("Refresh", "1; URL=QL_PhieuNhap.aspx");
              
        }
        }
        protected void gvDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

       
        protected void gvDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void cmdTimKiem_Click(object sender, EventArgs e)
        {
            gvDetails.Visible = false;
            gvDetailsUpdate.Visible = true;
            cmdThemMoi.Enabled = false;

            //sdsDetailsUpdate.SelectCommand = "Select * From tblDongPN Where SoPN = '" + lbSoPN.Text + "'";
            string sqlSearch = "Select * From tblDongPN Where TenDT like N'%" + txtTimKiem.Text.Trim() + "%'";

            BindDetails(sqlSearch, gvDetailsUpdate);
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("QL_PhieuNhap.aspx");
        }

        protected void cmdThemMoi_Click(object sender, EventArgs e)
        {
            int sopn = 0;
            string sqlSelect = string.Format(@"Select count(*) as sopn From tblPhieuNhap");
            dl.CNN.Open();
            SqlCommand cmdRead = new SqlCommand(sqlSelect, dl.CNN);
            SqlDataReader dr = cmdRead.ExecuteReader();

            while (dr.Read())
            {
                sopn = Convert.ToInt32(dr["SoPN"].ToString()) + 1;
            }

            dl.CNN.Close();


            // Thêm mới cho dòng phiếu nhập
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = dl.CNN;
            for (int i = 0; i < gvDetails.Rows.Count; i++)
            {
                //var label = GridView1.SelectedRow.FindControl("mylabel") as Label;
                var lbIDDT = gvDetails.Rows[i].Cells[1].FindControl("lbIDDT") as Label;
                var lbSoLuong = gvDetails.Rows[i].Cells[3].FindControl("lbSoLuong") as Label;
                var lbtenDT = gvDetails.Rows[i].Cells[2].FindControl("lbTenDT") as Label;
                var lbGia = gvDetails.Rows[i].Cells[4].FindControl("lbGia") as Label;

                string iddt = lbIDDT.Text;
                string soluong = lbSoLuong.Text;
                int sl = Convert.ToInt32(soluong);
                string gianhap = lbGia.Text;
                string sqlDPN = string.Format(@"insert into tblDongPN(sopn, iddt, tendt,  soluong, gianhap) values({0}, '{1}', N'{2}', '{3}', '{4}')", sopn, iddt, lbtenDT.Text, soluong, gianhap);
                //string chk = string.Format(@"select iddt from tblDienThoai where iddt='{0}'", iddt);


                StringBuilder sqlInsert = new StringBuilder(string.Empty);
                sqlInsert.Append(sqlDPN);
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sqlInsert.ToString();
                cmd.Connection = dl.CNN;

                dl.CNN.Open();
                cmd.ExecuteNonQuery();
                dl.CNN.Close();



            }

            // End #Thêm mới dòng phiếu nhập

            // Thêm mới phiếu nhập
            string ngaynhap = txtNgayNhap.Text;
            string mancc = ddlNCC.SelectedValue;
            string sql = string.Format(@"insert into tblPhieuNHap(sopn, ngaynhap, mancc) values({0}, N'{1}', '{2}')", sopn, ngaynhap, mancc);
            dl.CapNhapDuLieu(sql);
            gvPhieuNhap.DataBind();
            dl.CNN.Close();
            // End #Thêm mới phiếu nhập
            MessegeBox.Show("Thêm mới thành công!");

            // Xóa dữ liệu ở bảng tạm
            string sqlDel = "delete from tblTemp";

            SqlCommand sc = new SqlCommand(sqlDel, dl.CNN);
            dl.CNN.Open();
            sc.ExecuteNonQuery();
            BindEmployeeDetails();
            dl.CNN.Close();
            // End #Xóa dữ liệu ở bảng tạm



        }

        protected void cmdCapNhat_Click(object sender, EventArgs e)
        {
            string ngaynhap = txtNgayNhap.Text;
            string mancc = ddlNCC.SelectedValue;
            string sql1 = string.Format(@"update tblPhieuNhap set ngaynhap='{0}', mancc='{1}' where sopn='{2}'", ngaynhap, mancc, hfSoPN.Value);
            dl.CapNhapDuLieu(sql1);
            gvPhieuNhap.DataBind();
            dl.CNN.Close();
            MessegeBox.Show("Cập nhật dữ liệu thành công!");
        }

        protected void cmdLamLai_Click(object sender, EventArgs e)
        {
            TextBox tbiddt = (TextBox)gvDetails.FooterRow.FindControl("tbIDDT");
            TextBox tbtendt = (TextBox)gvDetails.FooterRow.FindControl("tbTenDT");
            TextBox tbsoluong = (TextBox)gvDetails.FooterRow.FindControl("tbSoLuong");
            TextBox tbgianhap = (TextBox)gvDetails.FooterRow.FindControl("tbGiaNhap");

            txtNgayNhap.Text = null;
            tbgianhap.Text = null;
            tbiddt.Text = null;
            tbsoluong.Text = null;
            tbtendt.Text = null;
        }

        protected void gvDetailsUpdate_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDetailsUpdate.EditIndex = -1;
            string sql1 = "Select * From tblDongPN Where SoPN='" + lbSoPN.Text + "'";
            BindDetails(sql1, gvDetailsUpdate);
        }

        protected void gvDetailsUpdate_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDetailsUpdate.EditIndex = e.NewEditIndex;
            string sql1 = "Select * From tblDongPN Where SoPN='" + lbSoPN.Text + "'";
            BindDetails(sql1, gvDetailsUpdate);
        }

        protected void gvDetailsUpdate_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvDetailsUpdate.DataKeys[e.RowIndex].Value.ToString());
            //string username = gvDetails.DataKeys[e.RowIndex].Values["UserName"].ToString();
            TextBox txtiddt = (TextBox)gvDetailsUpdate.Rows[e.RowIndex].FindControl("txtIDDT");
            TextBox txttendt = (TextBox)gvDetailsUpdate.Rows[e.RowIndex].FindControl("txtTenDT");
            TextBox txtsoluong = (TextBox)gvDetailsUpdate.Rows[e.RowIndex].FindControl("txtSoLuong");
            TextBox txtgianhap = (TextBox)gvDetailsUpdate.Rows[e.RowIndex].FindControl("txtGiaNhap");
            //MessageBox.Show(id.ToString());
            string iddt = txtiddt.Text;
            string tendt = txttendt.Text;
            string soluong = txtsoluong.Text;
            string gianhap = txtgianhap.Text;

            dl.CNN.Open();
            string sqlupdate = string.Format(@"update tblDongPN set iddt='{0}', tendt=N'{1}', soluong='{2}', gianhap='{3}' where iddpn={4}  ", iddt, tendt, soluong, gianhap, id);
            SqlCommand cmd = new SqlCommand(sqlupdate, dl.CNN);
            cmd.ExecuteNonQuery();
            gvDetailsUpdate.EditIndex = -1;
            string sql1 = "Select * From tblDongPN Where SoPN='" + lbSoPN.Text + "'";
            BindDetails(sql1, gvDetailsUpdate);
            dl.CNN.Close();
            MessegeBox.Show("Bản ghi đã được cập nhật");
        
        
        
        }

        protected void gvPhieuNhap_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gvPhieuNhap.Rows[gvPhieuNhap.SelectedIndex].Cells[0].Text;
        }

        protected void gvPhieuNhap_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvDetailsUpdate.DataKeys[e.RowIndex].Value.ToString());
            //string username = gvDetails.DataKeys[e.RowIndex].Values["UserName"].ToString();
            TextBox txtiddt = (TextBox)gvDetailsUpdate.Rows[e.RowIndex].FindControl("txtIDDT");
            TextBox txttendt = (TextBox)gvDetailsUpdate.Rows[e.RowIndex].FindControl("txtTenDT");
            TextBox txtsoluong = (TextBox)gvDetailsUpdate.Rows[e.RowIndex].FindControl("txtSoLuong");
            TextBox txtgianhap = (TextBox)gvDetailsUpdate.Rows[e.RowIndex].FindControl("txtGiaNhap");
            //MessageBox.Show(id.ToString());
            string iddt = txtiddt.Text;
            string tendt = txttendt.Text;
            string soluong = txtsoluong.Text;
            string gianhap = txtgianhap.Text;

            dl.CNN.Open();
            string sqlupdate = string.Format(@"update tblDongPN set iddt='{0}', tendt=N'{1}', soluong='{2}', gianhap='{3}' where iddpn={4}  ", iddt, tendt, soluong, gianhap, id);
            SqlCommand cmd = new SqlCommand(sqlupdate, dl.CNN);
            cmd.ExecuteNonQuery();
            gvDetailsUpdate.EditIndex = -1;
            string sql1 = "Select * From tblDongPN Where SoPN='" + lbSoPN.Text + "'";
            BindDetails(sql1, gvDetailsUpdate);
            dl.CNN.Close();
            MessegeBox.Show("Bản ghi đã được cập nhật");
       
        }

        protected void gvPhieuNhap_SelectedIndexChanged(object sender, EventArgs e)
        {
           lbSoPN.Text = gvPhieuNhap.Rows[gvPhieuNhap.SelectedIndex].Cells[0].Text;
            hfSoPN.Value = gvPhieuNhap.Rows[gvPhieuNhap.SelectedIndex].Cells[0].Text;
            txtNgayNhap.Text = gvPhieuNhap.Rows[gvPhieuNhap.SelectedIndex].Cells[1].Text;
            ddlNCC.SelectedValue = gvPhieuNhap.Rows[gvPhieuNhap.SelectedIndex].Cells[2].Text;

            gvDetails.Visible = false;
            gvDetailsUpdate.Visible = true;
            cmdThemMoi.Enabled = false;

            //sdsDetailsUpdate.SelectCommand = "Select * From tblDongPN Where SoPN = '" + lbSoPN.Text + "'";
            string sql = "Select * From tblDongPN Where SoPN = '" + lbSoPN.Text + "'";

            BindDetails(sql, gvDetailsUpdate);
        }

        protected void gvDetailsUpdate_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        if (e.CommandName.Equals("AddNew"))
        {

            //TextBox tbsopn = (TextBox)gvDetails.FooterRow.FindControl("tbSoPN");
            TextBox tbiddt = (TextBox)gvDetailsUpdate.FooterRow.FindControl("tbIDDT");
            TextBox tbtendt = (TextBox)gvDetailsUpdate.FooterRow.FindControl("tbTenDT");
            TextBox tbsoluong = (TextBox)gvDetailsUpdate.FooterRow.FindControl("tbSoLuong");
            TextBox tbgianhap = (TextBox)gvDetailsUpdate.FooterRow.FindControl("tbGiaNhap");
            //string sopn = ddlSoPhieuNhap.SelectedValue;
            string iddt = tbiddt.Text;
            string tendt = tbtendt.Text;
            string soluong = tbsoluong.Text;
            string gianhap = tbgianhap.Text;
            string sqlChk = string.Format(@"select * from tblDongPN where iddt = '{0}'", iddt);
            if (dl.KiemTra(sqlChk) == 0)
            {
                
                string sql = string.Format(@"update tblDongPN set soluong = soluong + {0}", soluong);
                dl.CapNhapDuLieu(sql);
                string sql1 = "Select * From tblDongPN Where SoPN='" + lbSoPN.Text + "'";
                BindDetails(sql1, gvDetailsUpdate);
                dl.CNN.Close();
                MessegeBox.Show("Mã sản phẩm này đã tồn tại! Số lượng đã được thêm!");
                
            }
            else
            {
                string sql = string.Format(@"insert into tblDongPN(SoPN, IDDT, TenDT, SoLuong, GiaNhap) VALUES('{0}', N'{1}', '{2}', '{3}', '{4}')", lbSoPN.Text, iddt, tendt, soluong, gianhap);
                //string sql = string.Format(@"insert into tblDongPN(SoPN) VALUES({0})", sopn);
                dl.CNN.Open();
                SqlCommand cmd = new SqlCommand(sql, dl.CNN);
                int result = cmd.ExecuteNonQuery();
                dl.CNN.Close();
                if (result == 1)
                {
                    string sql1 = "Select * From tblDongPN Where SoPN='" + lbSoPN.Text + "'";
                    BindDetails(sql1, gvDetailsUpdate);
                    lblresult.ForeColor = Color.Green;
                    lblresult.Text = "Thêm mới thành công!";
                }
                else
                {
                    lblresult.ForeColor = Color.Red;
                    lblresult.Text = "Chưa có bản ghi nào được thêm mới!";
                }
            }
        }
        }

        protected void gvDetailsUpdate_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        int id = Convert.ToInt32(gvDetailsUpdate.DataKeys[e.RowIndex].Values["IDDPN"].ToString());
        //int id = Convert.ToInt32(gvDetailsUpdate.Rows[gvDetailsUpdate.SelectedIndex].Cells[0].FindControl("hfID"));
        dl.CNN.Open();
        SqlCommand cmd = new SqlCommand("delete from tblDongPN where IDDPN=" + id, dl.CNN);
        int result = cmd.ExecuteNonQuery();        
        dl.CNN.Close();
        if (result == 1)
        {
            string sql1 = "Select * From tblDongPN Where SoPN='" + lbSoPN.Text + "'";
            BindDetails(sql1, gvDetailsUpdate);
            MessegeBox.Show("Đã xóa bản ghi");
            lblresult.ForeColor = Color.Red;
            lblresult.Text = " details deleted successfully";
        }
        //Page.Response.AppendHeader("Refresh", "0; URL=QL_PhieuNhap.aspx");
        }

      
        
      
       

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
         string time = Calendar1.SelectedDate.ToString("MM/dd/yyyy") + "  " + DateTime.Now.ToShortTimeString();
        txtNgayNhap.Text = time.ToString();
        }

        protected void gvDetails_DataBinding(object sender, EventArgs e)
        {

        }

    }
}