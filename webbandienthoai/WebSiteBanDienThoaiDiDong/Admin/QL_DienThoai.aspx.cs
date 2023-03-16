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
using GetData;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Drawing;
using WebSiteBanDienThoaiDiDong.ThaoTac;

namespace WebSiteBanDienThoaiDiDong.Admin
{
    public partial class QL_DienThoai : System.Web.UI.Page
    {
        ThaoTacCSDL dl = new ThaoTacCSDL();
        ThaoTacCSDL ddl = new ThaoTacCSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Key"] != null)
            {
                sdsDienThoai.SelectCommand = "SELECT * FROM [tblDienThoai] WHERE (TenDT Like N'%" + Request["Key"] + "%')";
            }
        }

        protected void gvDienThoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlMaDT.Visible = false;
            lbMaDT.Text = gvDienThoai.Rows[gvDienThoai.SelectedIndex].Cells[0].Text.Trim();

            ddlNSX.SelectedValue = gvDienThoai.Rows[gvDienThoai.SelectedIndex].Cells[1].Text;
            txtTenDT.Text = Server.HtmlDecode(gvDienThoai.Rows[gvDienThoai.SelectedIndex].Cells[2].Text);
            hfID.Value = gvDienThoai.Rows[gvDienThoai.SelectedIndex].Cells[0].Text.Trim();
            string Gia = "", KichThuoc = "", TrongLuong = "", Cam = "", TheNho = "", CN3G = "", Wifi = "", Java = "", Pin = "", TGCho = "", TGThoai = "", BaoHanh = "", PhuKien = "", HA = "", HA2 = "", HA3 = "", HA4 = "", LuotXem = "";
            string SQL_String = string.Format(@"SELECT * FROM tblDienThoai WHERE IDDT='{0}'", gvDienThoai.Rows[gvDienThoai.SelectedIndex].Cells[0].Text);
            SqlDataReader doc;
            doc = dl.LayDuLieu(SQL_String);
            while (doc.Read())
            {
                Gia = doc["Gia"].ToString();
                KichThuoc = doc["KichThuoc"].ToString();
                TrongLuong = doc["TrongLuong"].ToString();
                Cam = doc["Camera"].ToString();
                TheNho = doc["TheNho"].ToString();
                CN3G = doc["CongNghe3G"].ToString();
                Wifi = doc["Wifi"].ToString();
                Java = doc["Java"].ToString();
                Pin = doc["Pin"].ToString();
                TGCho = doc["ThoiGianCho"].ToString();
                TGThoai = doc["ThoiGianDamThoai"].ToString();
                BaoHanh = doc["BaoHanh"].ToString();
                PhuKien = doc["PhuKien"].ToString();
                HA = doc["HinhAnh"].ToString();
                HA2 = doc["HinhAnh2"].ToString();
                HA3 = doc["HinhAnh3"].ToString();
                HA4 = doc["HinhAnh4"].ToString();
                LuotXem = doc["LuotXem"].ToString();
            }
            dl.CNN.Dispose();
            dl.CNN.Close();

            string[] price = Gia.Split('.');
            //string g = string.Format("{0:c}", price[0]);
            GetData.Systems.Data();
            string g = String.Format("{0:c}", Gia);
            txtGia.Text = g.ToString();
            txtSL.Text = gvDienThoai.Rows[gvDienThoai.SelectedIndex].Cells[4].Text;
            txtKichThuoc.Text = KichThuoc;
            txtTrongLuong.Text = TrongLuong;
            txtCam.Text = Cam;
            ddlTheNho.SelectedValue = TheNho;
            ddl3G.SelectedValue = CN3G;
            ddlWifi.SelectedValue = Wifi;
            ddlJava.SelectedValue = Java;
            txtPin.Text = Pin;
            txtTGCho.Text = TGCho;
            txtTGThoai.Text = TGThoai;
            txtBaoHanh.Text = BaoHanh;
            txtPhuKien.Text = PhuKien;
            txtLuotXem.Text = LuotXem;
            txtHA.Text = HA;
            txtHA2.Text = HA2;
            txtHA3.Text = HA3;
            txtHA4.Text = HA4;
        }

        protected void cmdTimKiem_Click(object sender, EventArgs e)
        {
            if (txtTimKiem.Text.ToString().Trim() != "")
            {
                Response.Redirect("QL_DienThoai.aspx?Key=" + txtTimKiem.Text.Trim());
            }
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("QL_DienThoai.aspx");
        }
        protected void clear()
        {
            //lMaDT.Text = "Tự động";
            ddlNSX.SelectedValue = "1";
            txtTenDT.Text = null;
            txtGia.Text = null;
            txtSL.Text = null;
            txtKichThuoc.Text = null;
            txtTrongLuong.Text = null;
            txtCam.Text = null;
            ddlTheNho.SelectedValue = "0";
            ddl3G.SelectedValue = "0";
            ddlWifi.SelectedValue = "0";
            ddlJava.SelectedValue = "0";
            txtPin.Text = null;
            txtTGCho.Text = null;
            txtTGThoai.Text = null;
            txtBaoHanh.Text = null; txtPhuKien.Text = null;
            txtHA.Text = null; txtHA2.Text = null; txtHA3.Text = null; txtHA4.Text = null;
        }

        protected void cmdHuy_Click(object sender, EventArgs e)
        {
            clear();
            gvDienThoai.SelectedIndex = -1;
        }

        protected void cmdThem_Click(object sender, EventArgs e)
        {
            
            string iddt = ddlMaDT.SelectedValue;
            string TenDT, Gia, KichThuoc, TrongLuong, Camera, Pin, ThoiGianCho, ThoiGianDamThoai, BaoHanh, PhuKien, HinhAnh, HinhAnh2, HinhAnh3, HinhAnh4;
            int IDNSX = Convert.ToInt32(ddlNSX.SelectedValue);
            string SoLuong = txtSL.Text;
            int TheNho = Convert.ToInt32(ddlTheNho.SelectedValue);
            int CongNghe3G = Convert.ToInt32(ddl3G.SelectedValue);
            int Wifi = Convert.ToInt32(ddlWifi.SelectedValue);
            int Java = Convert.ToInt32(ddlJava.SelectedValue);
            string LuotXem = txtLuotXem.Text;
            int ncc = Convert.ToInt32(ddlNCC.SelectedValue);
            Gia = txtGia.Text;
            TenDT = txtTenDT.Text;
            KichThuoc = txtKichThuoc.Text; TrongLuong = txtTrongLuong.Text; Camera = txtCam.Text;
            Pin = txtPin.Text; ThoiGianCho = txtTGCho.Text; ThoiGianDamThoai = txtTGThoai.Text;
            BaoHanh = txtBaoHanh.Text; PhuKien = txtPhuKien.Text;
            if (fuHA.HasFile)
            {
                HinhAnh = fuHA.FileName.Replace(" ", "_");
                fuHA.SaveAs(Server.MapPath("~/Upload/Prod/" + HinhAnh));
            }
            else
                HinhAnh = txtHA.Text;
            if (fuHA2.HasFile)
            {
                HinhAnh2 = fuHA2.FileName.Replace(" ", "_");
                fuHA2.SaveAs(Server.MapPath("~/Upload/Prod/" + HinhAnh2));
            }
            else
                HinhAnh2 = txtHA2.Text;
            if (fuHA3.HasFile)
            {
                HinhAnh3 = fuHA3.FileName.Replace(" ", "_");
                fuHA3.SaveAs(Server.MapPath("~/Upload/Prod/" + HinhAnh3));
            }
            else
                HinhAnh3 = txtHA3.Text;
            if (fuHA4.HasFile)
            {
                HinhAnh4 = fuHA4.FileName.Replace(" ", "_");
                fuHA4.SaveAs(Server.MapPath("~/Upload/Prod/" + HinhAnh4));
            }
            else
                HinhAnh4 = txtHA4.Text;
            string SQL_String1 = string.Format(@"SELECT TenDT FROM tblDienThoai WHERE TenDT=N'{0}'", TenDT);
            if (dl.KiemTra(SQL_String1) == 0)
            {
                MessegeBox.Show("Điện thoại đã tồn tại!");
            }
            else
            {
                string SQL_String2 = string.Format(@"INSERT INTO tblDienThoai(IDNSX,TenDT,Gia,SoLuong,KichThuoc,TrongLuong,Camera,TheNho,CongNghe3G,Wifi,Java,Pin,ThoiGianCho,ThoiGianDamThoai,BaoHanh,PhuKien,HinhAnh,HinhAnh2,HinhAnh3,HinhAnh4,LuotXem, NCC, iddt) VALUES({0},N'{1}','{2}','{3}','{4}','{5}',N'{6}',{7},{8},{9},{10},N'{11}',N'{12}',N'{13}',N'{14}',N'{15}','{16}','{17}','{18}','{19}','{20}', '{21}', '{22}')", IDNSX, TenDT, Gia, SoLuong, KichThuoc, TrongLuong, Camera, TheNho, CongNghe3G, Wifi, Java, Pin, ThoiGianCho,ThoiGianDamThoai, BaoHanh, PhuKien, HinhAnh, HinhAnh2, HinhAnh3, HinhAnh4, LuotXem, ncc, iddt);
                GetData.Systems.Data();
                dl.CapNhapDuLieu(SQL_String2);
                dl.CNN.Close();
                MessegeBox.Show("Thêm dữ liệu thành công!");
                gvDienThoai.DataBind();
                clear();
            }
        }

        protected void cmdCapNhat_Click(object sender, EventArgs e)
        {
         string TenDT, Gia, KichThuoc, TrongLuong, Camera, Pin, ThoiGianCho, ThoiGianDamThoai, BaoHanh, PhuKien, HinhAnh, HinhAnh2, HinhAnh3, HinhAnh4;
        string iddt = hfID.Value;
        int IDNSX = Convert.ToInt32(ddlNSX.SelectedValue);
        String SoLuong = txtSL.Text;
        int TheNho = Convert.ToInt32(ddlTheNho.SelectedValue);
        int CongNghe3G = Convert.ToInt32(ddl3G.SelectedValue);
        int Wifi = Convert.ToInt32(ddlWifi.SelectedValue);
        int Java = Convert.ToInt32(ddlJava.SelectedValue);
        string LuotXem = txtLuotXem.Text;
        int ncc = Convert.ToInt32(ddlNCC.SelectedValue);
        Gia = txtGia.Text;
        TenDT = txtTenDT.Text;
        KichThuoc = txtKichThuoc.Text; TrongLuong = txtTrongLuong.Text; Camera = txtCam.Text;
        Pin = txtPin.Text; ThoiGianCho = txtTGCho.Text; ThoiGianDamThoai = txtTGThoai.Text;
        BaoHanh = txtBaoHanh.Text; PhuKien = txtPhuKien.Text;
        if (fuHA.HasFile)
        {
            HinhAnh = fuHA.FileName.Replace(" ", "_");
            fuHA.SaveAs(Server.MapPath("~/Upload/Prod/" + HinhAnh));
        }
        else
            HinhAnh = txtHA.Text;
        if (fuHA2.HasFile)
        {
            HinhAnh2 = fuHA2.FileName.Replace(" ", "_");
            fuHA2.SaveAs(Server.MapPath("~/Upload/Prod/" + HinhAnh2));
        }
        else
            HinhAnh2 = txtHA2.Text;
        if (fuHA3.HasFile)
        {
            HinhAnh3 = fuHA3.FileName.Replace(" ", "_");
            fuHA3.SaveAs(Server.MapPath("~/Upload/Prod/" + HinhAnh3));
        }
        else
            HinhAnh3 = txtHA3.Text;
        if (fuHA4.HasFile)
        {
            HinhAnh4 = fuHA4.FileName.Replace(" ", "_");
            fuHA4.SaveAs(Server.MapPath("~/Upload/Prod/" + HinhAnh4));
        }
        else
            HinhAnh4 = txtHA4.Text;

        string SQL_String2 = string.Format(@"UPDATE tblDienThoai SET IDNSX={0}, TenDT=N'{1}', Gia='{2}', SoLuong='{3}', KichThuoc='{4}', TrongLuong='{5}', Camera=N'{6}', TheNho={7}, CongNghe3G={8}, Wifi={9}, Java={10}, Pin=N'{11}', ThoiGianCho=N'{12}', ThoiGianDamThoai=N'{13}', BaoHanh=N'{14}', PhuKien=N'{15}', HinhAnh='{16}', HinhAnh2='{17}', HinhAnh3='{18}', HinhAnh4='{19}', LuotXem='{20}', NCC='{21}' WHERE IDDT='{22}'", IDNSX, TenDT, Gia, SoLuong, KichThuoc, TrongLuong, Camera, TheNho, CongNghe3G, Wifi, Java, Pin, ThoiGianCho, ThoiGianDamThoai, BaoHanh,PhuKien, HinhAnh, HinhAnh2, HinhAnh3, HinhAnh4, LuotXem, ncc, iddt);
        dl.CapNhapDuLieu(SQL_String2);
        dl.CNN.Close();
        MessegeBox.Show("Cập nhật dữ liệu thành công!");
        gvDienThoai.DataBind();
        clear();
    }
    protected void ddlMaDT_SelectedIndexChanged(object sender, EventArgs e)
    {
        //string sql = "select * from tblDongPN where iddt = '" + ddlMaDT.SelectedValue + "'";        
        string sql = string.Format(@"select tblDongPN.*, tblPhieuNhap.SoPN, tblPhieuNhap.MaNCC 
        From tblDongPN 
        INNER JOIN tblPhieuNhap ON tblDongPN.SoPN = tblPhieuNhap.SoPN Where iddt = '{0}'", ddlMaDT.SelectedValue);
        string spn = string.Empty;
        string tendt = string.Empty;
        string gia = string.Empty;
        string soluong = string.Empty;
        string ncc = string.Empty;
        SqlCommand cmd = new SqlCommand(sql, ddl.CNN);
        ddl.CNN.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            
            spn = dr["SoPN"].ToString();
            tendt = dr["TenDT"].ToString();
            soluong = dr["SoLuong"].ToString();
            gia = dr["GiaNhap"].ToString();
            ncc = dr["mancc"].ToString();
        }
        lbSoPN.ForeColor = Color.Red;
        string[] price = gia.Split('.');
        lbSoPN.Text = spn.ToString();
        txtTenDT.Text = tendt.ToString();
        txtGia.Text = price[0].ToString();
        txtSL.Text = soluong.ToString();
        ddlNCC.SelectedValue = ncc.ToString();               
        }
    }
}