<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="MuaNhieu.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.MuaNhieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="center_title_bar">30 Điện Thoại Đặt Mua Nhiều Nhất</div>
<asp:Repeater ID="rTimKiem" runat="server" DataSourceID="sdsMuaNhieu">
    <ItemTemplate>
    <div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box">            
                 <div class="product_title"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><%# Eval("TenDT") %></a></div>
                 <div class="product_img"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><img src='<%# @"Upload/Prod/"+Eval("HinhAnh").ToString().Trim() %>' width=90px height=95px alt="" title="" border="0" /></a></div>
                 <div class="prod_price"><span style="font-weight:bold">Vị trí:</span>&nbsp;<span style="font-weight:bold; color:Red"><%# tang() %></span></div>                        
            </div>
            <div class="bottom_prod_box"></div>                     
        </div>
    </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="sdsMuaNhieu" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT TOP (30) [IDDT], [TenDT], [Gia], [HinhAnh], [LuotXem] FROM [tblDienThoai] WHERE [IDDT] IN (SELECT TOP (30) [IDDT] FROM [tblDongDH] GROUP BY [IDDT] ORDER BY COUNT([IDDT]) DESC)">
    </asp:SqlDataSource>
</asp:Content>
