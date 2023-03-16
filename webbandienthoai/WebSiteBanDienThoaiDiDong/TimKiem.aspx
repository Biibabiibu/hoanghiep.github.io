<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="TimKiem.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.TimKiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="center_title_bar">Kết Quả Tìm Kiếm</div>
<asp:Label style="padding: 0 0 0 40px" ID="lKQ" ForeColor=Red Font-Bold=true Font-Size=12px runat="server" Text=""></asp:Label>
<asp:Repeater ID="rTimKiem" runat="server">
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
    <div class="Trang"><p align=center><asp:Label ID="lTrangTK" runat="server" Text="" Font-Size=Small><strong>Trang</strong> </asp:Label></p></div>

</asp:Content>
