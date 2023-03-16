<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Default" %>
<%@ Register src="UserControl/SlideShow.ascx" tagname="SlideShow" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="KhungDetails" style="height:150px">
    <uc1:SlideShow ID="SlideShow1" runat="server" />
    </div>
   <div >
<div class="center_title_bar">HÀNG MỚI</div>
    
    <asp:Repeater ID="rSPMoi" runat="server" DataSourceID="sdsSPMoi">
    <ItemTemplate>
    <div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box">            
                 <div class="product_title"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><img src="images/new.png" alt="" title=""  /><%# Eval("TenDT") %></a></div>
                 <div class="product_img"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><img src='<%# @"Upload/Prod/"+Eval("HinhAnh").ToString().Trim() %>' width="90px" height="95px"alt="" title="" /></a></div>
                 <div class="prod_price"><span class="price"><%# String.Format("{0:n0}",Eval("Gia")) %> 
                     VNĐ</span></div>                        
            </div>
            <div class="bottom_prod_box"></div>             
            <div class="prod_details_tab">
            <a href='<%# "ThemVaoGio.aspx?IDDT="+Eval("IDDT").ToString() %>' title="header=[Thêm vào giỏ hàng] body=[&nbsp;] fade=[on]"><img src="images/cart_add.png" alt="" title="" class="left_bt" /></a>          
            <a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>' class="prod_details">
                Chi tiết</a>            
            </div>                     
        </div>
    </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="sdsSPMoi" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:MyDataConnectionString.ProviderName %>" 
                            SelectCommand="SELECT TOP (6) IDDT, IDNSX, TenDT, Gia, SoLuong, HinhAnh FROM tblDienThoai ORDER BY IDDT DESC"></asp:SqlDataSource>
 <div class="center_title_bar">HÀNG SIÊU CẤP</div>
    <asp:Repeater ID="rSPDacBiet" runat="server" DataSourceID="sdsSPDB">
    <ItemTemplate>
    <div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box">            
                 <div class="product_title"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><%# Eval("TenDT") %></a></div>
                 <div class="product_img"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><img src='<%# @"Upload/Prod/"+Eval("HinhAnh").ToString().Trim() %>' width="90px" height="95px" alt="" title=""  /></a></div>
                 <div class="prod_price"><span class="price"><%# String.Format("{0:n0}",Eval("Gia")) %> 
                     VNĐ</span></div>                        
            </div>
            <div class="bottom_prod_box"></div>             
            <div class="prod_details_tab">
            <a href='<%# "ThemVaoGio.aspx?IDDT="+Eval("IDDT").ToString() %>' title="header=[Thêm vào giỏ hàng] body=[&nbsp;] fade=[on]"><img src="images/cart_add.png" alt="" title="" class="left_bt" /></a>          
            <a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>' class="prod_details">
                Chi tiết</a>            
            </div>                     
        </div>
    </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="sdsSPDB" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT TOP (3) IDDT, IDNSX, TenDT, Gia, SoLuong, HinhAnh FROM tblDienThoai WHERE Gia >10000000 ORDER BY NEWID()">
    </asp:SqlDataSource>
    
    <div class="center_title_bar">HÀNG CAO CẤP</div>
    <asp:Repeater ID="rHangCaoCap" runat="server" DataSourceID="sdsHangCaoCap">
    <ItemTemplate>
    <div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box">            
                 <div class="product_title"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><%# Eval("TenDT") %></a></div>
                 <div class="product_img"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><img src='<%# @"Upload/Prod/"+Eval("HinhAnh").ToString().Trim() %>' width="90px"height="95px" alt="" title="" /></a></div>
                 <div class="prod_price"><span class="price"><%# String.Format("{0:n0}",Eval("Gia")) %> 
                     VNĐ</span></div>                        
            </div>
            <div class="bottom_prod_box"></div>             
            <div class="prod_details_tab">
            <a href='<%# "ThemVaoGio.aspx?IDDT="+Eval("IDDT").ToString() %>' title="header=[Thêm vào giỏ hàng] body=[&nbsp;] fade=[on]"><img src="images/cart_add.png" alt="" title="" class="left_bt" /></a>          
            <a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>' class="prod_details">
                Chi tiết</a>            
            </div>                     
        </div>
    </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="sdsHangCaoCap" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT TOP (3) IDDT, IDNSX, TenDT, Gia, SoLuong, HinhAnh FROM tblDienThoai WHERE (Gia BETWEEN 5000000 AND 10000000) ORDER BY NEWID()">
    </asp:SqlDataSource>
    <div class="center_title_bar">HÀNG TRUNG CẤP</div>
    <asp:Repeater ID="rHangTrungCap" runat="server" DataSourceID="sdsHangTrungCap">
    <ItemTemplate>
    <div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box">            
                 <div class="product_title"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><%# Eval("TenDT") %></a></div>
                 <div class="product_img"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><img src='<%# @"Upload/Prod/"+Eval("HinhAnh").ToString().Trim() %>' width="90px" height="95px" alt="" title="" /></a></div>
                 <div class="prod_price"><span class="price"><%# String.Format("{0:n0}",Eval("Gia")) %> 
                     VNĐ</span></div>                        
            </div>
            <div class="bottom_prod_box"></div>             
            <div class="prod_details_tab">
            <a href='<%# "ThemVaoGio.aspx?IDDT="+Eval("IDDT").ToString() %>' title="header=[Thêm vào giỏ hàng] body=[&nbsp;] fade=[on]"><img src="images/cart_add.png" alt="" title=""  class="left_bt" /></a>          
            <a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>' class="prod_details">
                Chi tiết</a>            
            </div>                     
        </div>
    </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="sdsHangTrungCap" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT TOP (3) IDDT, IDNSX, TenDT, Gia, SoLuong, HinhAnh FROM tblDienThoai WHERE (Gia BETWEEN 2000000 AND 5000000) ORDER BY NEWID()">
    </asp:SqlDataSource>
    <div class="center_title_bar">HÀNG PHỔ THÔNG</div>
    <asp:Repeater ID="rHangPhoThong" runat="server" DataSourceID="sdsHangPhoThong">
    <ItemTemplate>
    <div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box">            
                 <div class="product_title"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><%# Eval("TenDT") %></a></div>
                 <div class="product_img"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><img src='<%# @"Upload/Prod/"+Eval("HinhAnh").ToString().Trim() %>' width="90px" height="95px" alt="" title="" /></a></div>
                 <div class="prod_price"><span class="price"><%# String.Format("{0:n0}",Eval("Gia")) %> 
                     VNĐ</span></div>                        
            </div>
            <div class="bottom_prod_box"></div>             
            <div class="prod_details_tab">
            <a href='<%# "ThemVaoGio.aspx?IDDT="+Eval("IDDT").ToString() %>' title="header=[Thêm vào giỏ hàng] body=[&nbsp;] fade=[on]"><img src="images/cart_add.png" alt="" title="" class="left_bt" /></a>          
            <a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>' class="prod_details">
                Chi tiết</a>            
            </div>                     
        </div>
    </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="sdsHangPhoThong" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT TOP (3) IDDT, IDNSX, TenDT, Gia, SoLuong, HinhAnh FROM tblDienThoai WHERE (Gia < 2000000) ORDER BY NEWID()">
    </asp:SqlDataSource>
    </div> 
</asp:Content>
