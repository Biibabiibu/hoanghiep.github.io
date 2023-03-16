<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DTHot.ascx.cs" Inherits="WebSiteBanDienThoaiDiDong.UserControl.DTHot" %>
<div class="title_box">Điện Thoại HOT</div>  
     <div class="border_box">
         <asp:Repeater ID="rDTHot" runat="server" DataSourceID="sdsDTHot">
                    <ItemTemplate>
                <div class="product_title"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><%# Eval("TenDT") %></a></div>
                 <div class="product_img"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><img src='<%# @"Upload/Prod/"+Eval("HinhAnh").ToString().Trim() %>' width="90px" height="95px" alt="" title="" /></a></div>
                 <div class="prod_price"><span class="price"><%# String.Format("{0:n0}",Eval("Gia")) %> 
                     VNĐ</span></div> 
                     </ItemTemplate>
         </asp:Repeater>
         
         <asp:SqlDataSource ID="sdsDTHot" runat="server" 
             ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
             
             
             SelectCommand="SELECT * FROM [tblDienThoai]  where luotxem in (select max(luotxem) from tbldienthoai)">



         </asp:SqlDataSource>
         
     </div>  