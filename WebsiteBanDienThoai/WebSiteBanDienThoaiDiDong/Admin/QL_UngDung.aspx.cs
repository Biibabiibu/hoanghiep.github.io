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

namespace WebSiteBanDienThoaiDiDong.Admin
{
    public partial class QL_UngDung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            if (Request["Key"] != null)
            {
                sdsUngDung.SelectCommand = "SELECT * FROM [tblUngDung] WHERE (TenUngDung Like N'%" + Request["Key"] + "%')";
            }
        }
        protected void clear()
        {
            lMaUngDung.Text = "Tự động";
            txtTenUngDung.Text = null;
            txtTomTat.Text = null;
            fckNoiDung.Value = null;
            txtDongMay.Text = null;
            txtPhienBan.Text = null;
            txtNgayCapNhat.Text = null;
            txtCTyPhatHanh.Text = null;
            txtHinhAnh.Text = null;
            txtDuongDan.Text = null;
            lbFiletruoc.Visible = false;
            lbFile.Visible = false;
        }

        protected void cmdTimKiem_Click(object sender, EventArgs e)
        {
            if (txtTimKiem.Text.ToString().Trim() != "")
            {
                Response.Redirect("QL_UngDung.aspx?Key=" + txtTimKiem.Text.Trim());
            }
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("QL_UngDung.aspx");
        }

        protected void gvUngDung_SelectedIndexChanged(object sender, EventArgs e)
        {
            lMaUngDung.Text = gvUngDung.Rows[gvUngDung.SelectedIndex].Cells[0].Text;
            txtTenUngDung.Text = Server.HtmlDecode(gvUngDung.Rows[gvUngDung.SelectedIndex].Cells[1].Text);
            txtTomTat.Text = Server.HtmlDecode(gvUngDung.Rows[gvUngDung.SelectedIndex].Cells[2].Text);
            txtDongMay.Text = Server.HtmlDecode(gvUngDung.Rows[gvUngDung.SelectedIndex].Cells[4].Text);
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string ND = "", HinhAnh = "",FileUp="";
            string SQL_String = string.Format(@"SELECT NoiDung,HinhAnh,File FROM tblUngDung WHERE MaUngDung={0}", gvUngDung.Rows[gvUngDung.SelectedIndex].Cells[0].Text);
            SqlDataReader doc;
            doc = dl.LayDuLieu(SQL_String);
            while (doc.Read())
            {
                ND = doc["NoiDung"].ToString();
                HinhAnh = doc["HinhAnh"].ToString();
                FileUp=doc["File"].ToString();
            }
            dl.CNN.Dispose();
            dl.CNN.Close();
            fckNoiDung.Value = Server.HtmlDecode(ND);
            txtPhienBan.Text = Server.HtmlDecode(gvUngDung.Rows[gvUngDung.SelectedIndex].Cells[5].Text);
            txtNgayCapNhat.Text = Server.HtmlDecode(gvUngDung.Rows[gvUngDung.SelectedIndex].Cells[6].Text);
            txtCTyPhatHanh.Text = Server.HtmlDecode(gvUngDung.Rows[gvUngDung.SelectedIndex].Cells[7].Text);
            txtHinhAnh.Text = HinhAnh;
            lbFiletruoc.Text = "Tên File/đường dẫn cũ: ";
            lbFile.Text = FileUp;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtNgayCapNhat.Text = Calendar1.SelectedDate.Day.ToString() + "/" + Calendar1.SelectedDate.Month.ToString() + "/" + Calendar1.SelectedDate.Year.ToString() + " - " + DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString();
        }

        protected void cmdCapNhat_Click(object sender, EventArgs e)
        {
            try
            {
                ThaoTacCSDL dl = new ThaoTacCSDL();
                string TenUngDung, TomTat, NoiDung,DongMay,PhienBan, NgayCapNhat, CTyPhatHanh, HinhAnh;
                int MaUD = Convert.ToInt32(lMaUngDung.Text);
                TenUngDung = txtTenUngDung.Text;
                TomTat = txtTomTat.Text;
                NoiDung = fckNoiDung.Value;
                DongMay = txtDongMay.Text;
                PhienBan = txtPhienBan.Text;
                NgayCapNhat = txtNgayCapNhat.Text;
                CTyPhatHanh = txtCTyPhatHanh.Text;
                if (fuHinhAnh.HasFile)
                {
                    HinhAnh = fuHinhAnh.FileName.Replace(" ", "_");
                    fuHinhAnh.SaveAs(Server.MapPath("~/Upload/News/" + HinhAnh));
                }
                else
                {
                    HinhAnh = txtHinhAnh.Text;
                }
                if (rdLuaChon.Text == "01")
                {
                    if (txtDuongDan.Text != "") lbFile.Text = txtDuongDan.Text;
                }
                else
                {
                    if (FileUpload1.PostedFile.FileName != "") lbFile.Text = FileUpload1.PostedFile.FileName;
                }
                gvUngDung.SelectedIndex = -1;


                string SQL_String2 = string.Format(@"UPDATE tblUngDung SET TenUngDUng=N'{0}', TomTat=N'{1}', NoiDung=N'{2}', DongMay=N'{3}', PhienBan=N'{4}', NgayCapNhat=N'{5}', CTyPhatHanh=N'{6}', HinhAnh='{7}',File=N'" + lbFile.Text + "'  WHERE MaUngDung={8}", TenUngDung, TomTat, NoiDung,DongMay,PhienBan, NgayCapNhat, CTyPhatHanh, HinhAnh, MaUD);
                dl.CapNhapDuLieu(SQL_String2);
                dl.CNN.Close();
                MessegeBox.Show("Cập nhật dữ liệu thành công!");
                gvUngDung.DataBind();
                clear();

            }
            catch
            {
                MessegeBox.Show("Cần chọn một bản ghi để tiến hành cập nhật!");
            }
        }

        protected void cmdThem_Click(object sender, EventArgs e)
        {
            ThaoTacCSDL dl = new ThaoTacCSDL();
            string TenUngDung, TomTat, NoiDung, DongMay, PhienBan, NgayCapNhat, CTyPhatHanh, HinhAnh,DuongDan,LinkFile;
            TenUngDung = txtTenUngDung.Text;
            TomTat = txtTomTat.Text;
            NoiDung = fckNoiDung.Value;
            DongMay = txtDongMay.Text;
            PhienBan = txtPhienBan.Text;
            NgayCapNhat = txtNgayCapNhat.Text;
            CTyPhatHanh = txtCTyPhatHanh.Text;
            DuongDan = txtDuongDan.Text;
            if (fuHinhAnh.HasFile)
            {
                HinhAnh = fuHinhAnh.FileName.Replace(" ", "_");
                fuHinhAnh.SaveAs(Server.MapPath("~/Upload/News/" + HinhAnh));
            }
            else
            {
                HinhAnh = txtHinhAnh.Text;
            }

            
            if (rdLuaChon.Text == "01")
            {
                if (txtDuongDan.Text == "")
                {
                   MessegeBox.Show("Đường dẫn không để trống!");
                }
                else
                {
                    //Thuc thi cau lenh sql de kiem tra trung
                    string SQL_String1 = string.Format(@"SELECT TenUngDung FROM tblUngDung WHERE TenUngDung=N'{0}'", TenUngDung);
                    if (dl.KiemTra(SQL_String1) == 0)
                    {
                        MessegeBox.Show("Ứng dụng đã tồn tại!");
                    }
                    else
                    {
                        //Thực hiện câu lệnh SQL thêm
                        string SQL_String2 = string.Format(@"INSERT INTO tblUngDung(TenUngDung,TomTat,NoiDung,DongMay,PhienBan,NgayCapNhat,CTyPhatHanh,HinhAnh,File) VALUES(N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}',N{6},{7},{8})", TenUngDung , TomTat, NoiDung,DongMay ,PhienBan , NgayCapNhat, CTyPhatHanh , HinhAnh,DuongDan );
                        dl.CapNhapDuLieu(SQL_String2);
                        dl.CNN.Close();
                        MessegeBox.Show("Thêm dữ liệu thành công!");
                        gvUngDung.DataBind();
                        clear();
                    }
                    //Response lai trang ban tin
                    Response.Redirect("QL_UngDung.aspx");
                }
            }
            else
            {
                if (FileUpload1.PostedFile.FileName == "")
                {
                     MessegeBox.Show("File phần mềm không để trống!");
               
                }
                else
                {
                    //lay duong dan file 
                    string fn = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string SaveLocation = Server.MapPath("Upload") + "\\" + fn;
                    //Luu tep
                    FileUpload1.SaveAs(SaveLocation);
                    LinkFile = FileUpload1.PostedFile.FileName;
                    //Thuc thi cau lenh sql de Kiem tra trung
                    string SQL_String1 = string.Format(@"SELECT TenUngDung FROM tblUngDung WHERE TenUngDung=N'{0}'", TenUngDung);
                    if (dl.KiemTra(SQL_String1) == 0)
                    {
                        MessegeBox.Show("Ứng dụng đã tồn tại!");
                    }
                    else
                    {
                        //Thực hiện câu lệnh SQL thêm
                        string SQL_String2 = string.Format(@"INSERT INTO tblUngDung(TenUngDung,TomTat,NoiDung,DongMay,PhienBan,NgayCapNhat,CTyPhatHanh,HinhAnh,File) VALUES(N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}',N{6},{7},{8})", TenUngDung, TomTat, NoiDung, DongMay, PhienBan, NgayCapNhat, CTyPhatHanh, HinhAnh, LinkFile);
                        dl.CapNhapDuLieu(SQL_String2);
                        dl.CNN.Close();
                        MessegeBox.Show("Thêm dữ liệu thành công!");
                        gvUngDung.DataBind();
                        clear();
                    }

                    //Response lai trang ban tin
                    Response.Redirect("QL_UngDung.aspx");
                }
            }


        }

        protected void cmdHuyBo_Click(object sender, EventArgs e)
        {
            clear();
            gvUngDung.SelectedIndex = -1;
        }
    }
}