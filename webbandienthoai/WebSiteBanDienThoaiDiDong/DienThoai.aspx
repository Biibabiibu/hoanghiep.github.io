<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="DienThoai.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.DienThoai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%if (Request["IDNSX"] == null) Response.Redirect("Default.aspx"); %>
<div class="center_title_bar">
<%switch (Request["IDNSX"])
  {
      case "1":
          { %>Xiaomi<%; break;
          }
      case "2":
          { %>Samsung<%; break;
          }
      case "3":
          { %>Vsmart<%; break;
          }
      case "4":
          { %>Oppo<%; break;
          }
      case "5":
          { %>Realme<%; break;
          }
      case "6":
          { %>Apple - iPhone<%; break;
          }
      case "15":
          { %>Phụ kiện<%; break;
          }
  } %>
</div>
<div class="SapXep"><strong>Tìm Kiếm Theo </strong>
    <asp:DropDownList ID="ddlGia" 
        runat="server" AutoPostBack="True">
    <asp:ListItem Value="ORDER BY Gia ASC">Giá tăng dần</asp:ListItem>
    <asp:ListItem Value="ORDER BY Gia DESC">Giá giảm dần</asp:ListItem>
        <asp:ListItem Selected="True" Value="ORDER BY IDDT DESC">Không sắp xếp</asp:ListItem>
    </asp:DropDownList>
    <strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Giá Từ </strong>
    <asp:DropDownList ID="ddlGiaTu" runat="server" AutoPostBack="True">
        <asp:ListItem Value="AND (Gia > 0)">Tất cả</asp:ListItem>
        <asp:ListItem Value="AND (Gia < 2000000)">&lt; 2 triệu</asp:ListItem>
        <asp:ListItem Value="AND (Gia BETWEEN 2000000 AND 4000000)">2 triệu - 4 triệu</asp:ListItem>
        <asp:ListItem Value="AND (Gia BETWEEN 4000000 AND 6000000)">4 triệu - 6 triệu</asp:ListItem>
        <asp:ListItem Value="AND (Gia BETWEEN 6000000 AND 8000000)">6 triệu - 8 triệu</asp:ListItem>
        <asp:ListItem Value="AND (Gia BETWEEN 8000000 AND 10000000)">8 triệu - 10 triệu</asp:ListItem>
        <asp:ListItem Value="AND (Gia > 10000000)">&gt; 10 triệu</asp:ListItem>
    </asp:DropDownList>
</div>
<asp:Repeater ID="rDienThoai" runat="server">
    <ItemTemplate>
    <div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box">            
                 <div class="product_title"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><%# Eval("TenDT") %></a></div>
                 <div class="product_img"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><img src='<%# @"Upload/Prod/"+Eval("HinhAnh").ToString().Trim() %>' width=90px height=95px alt="" title="" border="0" /></a></div>
                 <div class="prod_price"><span class="price"><%# String.Format("{0:n0}",Eval("Gia")) %> VNĐ</span></div>                        
            </div>
            <div class="bottom_prod_box"></div>             
            <div class="prod_details_tab">
            <a href='<%# "ThemVaoGio.aspx?IDDT="+Eval("IDDT").ToString() %>' title="header=[Thêm vào giỏ hàng] body=[&nbsp;] fade=[on]"><img src="images/cart_add.png" alt="" title="" border="0" class="left_bt" /></a>          
            <a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>' class="prod_details">Chi tiết</a>            
            </div>                     
        </div>
    </ItemTemplate>
    </asp:Repeater>
    <div class="Trang"><p align="center"><asp:Label ID="lTrangDienThoai" runat="server" Text="" Font-Size=Small><strong>Trang</strong> </asp:Label></p></div>

</asp:Content>
