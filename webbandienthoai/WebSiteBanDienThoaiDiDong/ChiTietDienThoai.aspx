<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="ChiTietDienThoai.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.ChiTietDienThoai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script>
    PositionX = 100;
    PositionY = 100;


    defaultWidth = 500;
    defaultHeight = 500;
    var AutoClose = true;

    if (parseInt(navigator.appVersion.charAt(0)) >= 4) {
        var isNN = (navigator.appName == "Netscape") ? 1 : 0;
        var isIE = (navigator.appName.indexOf("Microsoft") != -1) ? 1 : 0;
    }
    var optNN = 'scrollbars=no,width=' + defaultWidth + ',height=' + defaultHeight + ',left=' + PositionX + ',top=' + PositionY;
    var optIE = 'scrollbars=no,width=150,height=100,left=' + PositionX + ',top=' + PositionY;
    function popImage(imageURL, imageTitle) {
        if (isNN) { imgWin = window.open('about:blank', '', optNN); }
        if (isIE) { imgWin = window.open('about:blank', '', optIE); }
        with (imgWin.document) {
            writeln('<html><head><title>Loading...</title><style>body{margin:0px;}</style>'); writeln('<sc' + 'ript>');
            writeln('var isNN,isIE;'); writeln('if (parseInt(navigator.appVersion.charAt(0))>=4){');
            writeln('isNN=(navigator.appName=="Netscape")?1:0;'); writeln('isIE=(navigator.appName.indexOf("Microsoft")!=-1)?1:0;}');
            writeln('function reSizeToImage(){'); writeln('if (isIE){'); writeln('window.resizeTo(300,300);');
            writeln('width=300-(document.body.clientWidth-document.images[0].width);');
            writeln('height=300-(document.body.clientHeight-document.images[0].height);');
            writeln('window.resizeTo(width,height);}'); writeln('if (isNN){');
            writeln('window.innerWidth=document.images["George"].width;'); writeln('window.innerHeight=document.images["George"].height;}}');
            writeln('function doTitle(){document.title="' + imageTitle + '";}'); writeln('</sc' + 'ript>');
            if (!AutoClose) writeln('</head><body bgcolor=ffffff scroll="no" onload="reSizeToImage();doTitle();self.focus()">')
            else writeln('</head><body bgcolor=ffffff scroll="no" onload="reSizeToImage();doTitle();self.focus()" onblur="self.close()">');
            writeln('<img name="George" src=' + imageURL + ' style="display:block"></body></html>');
            close();
        } 
    }

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:Repeater ID="rChiTietDT" runat="server" DataSourceID="sdsChiTietDT">
    <ItemTemplate>
    <div class="center_title_bar"><%# Eval("TenDT") %></div>
    
    <div class="prod_box_big">
        	<div class="top_prod_box_big"></div>
            <div class="center_prod_box_big">            
                 
                 <div class="product_img_big">
                 <a href="javascript:popImage('<%# @"Upload/Prod/"+Eval("HinhAnh").ToString().Trim() %>','<%# Eval("TenDT") %>')" title="header=[Phóng to hình] body=[&nbsp;] fade=[on]"><img src='<%# @"Upload/Prod/"+Eval("HinhAnh").ToString().Trim() %>' width="90px" height="95px" alt="" title="" border="0" /></a>
                 <div class="thumbs">
                 <a href="javascript:popImage('<%# @"Upload/Prod/"+Eval("HinhAnh2").ToString().Trim() %>','<%# Eval("TenDT") %>')" title="header=[Ảnh 1] body=[&nbsp;] fade=[on]"><img src='<%# @"Upload/Prod/"+Eval("HinhAnh2").ToString().Trim() %>' width="42" height="92px" alt="" title="" border="0" /></a>
                 <a href="javascript:popImage('<%# @"Upload/Prod/"+Eval("HinhAnh3").ToString().Trim() %>','<%# Eval("TenDT") %>')" title="header=[Ảnh 2] body=[&nbsp;] fade=[on]"><img src='<%# @"Upload/Prod/"+Eval("HinhAnh3").ToString().Trim() %>' width="42" height="92px"  alt="" title="" border="0" /></a>
                 <a href="javascript:popImage('<%# @"Upload/Prod/"+Eval("HinhAnh4").ToString().Trim() %>','<%# Eval("TenDT") %>')" title="header=[Ảnh 3] body=[&nbsp;] fade=[on]"><img src='<%# @"Upload/Prod/"+Eval("HinhAnh4").ToString().Trim() %>' width="42" height="92px" alt="" title="" border="0" /></a>

                 
                 </div>
                 <br />
                 <script type="text/javascript">
                     $('.popup').popupWindow({
                         centerBrowser: 1
                     });
                 </script>

                 </div>
                     <div class="details_big_box">
                         <div class="product_title_big"><%# Eval("TenDT") %></div>
                         <div class="specifications">
                            Nhà cung cấp: <span class="blue"><%# Eval("TenNCC") %></span><br />
                            Kích thước: <span class="blue"><%# Eval("KichThuoc") %></span><br />

                            Trọng lượng: <span class="blue"><%# Eval("TrongLuong") %></span><br />
                            
                            Camera: <span class="blue"><%# Eval("Camera") %></span><br />
                            
                            Hỗ trợ thẻ nhớ: <span class="blue"><%# checkout(Convert.ToInt32(Eval("TheNho"))) %></span><br />
                            3G: <span class="blue"><%# checkout(Convert.ToInt32(Eval("CongNghe3G"))) %></span><br />
                            Wifi: <span class="blue"><%# checkout(Convert.ToInt32(Eval("Wifi"))) %></span><br />
                            Java: <span class="blue"><%# checkout(Convert.ToInt32(Eval("Java"))) %></span><br />
                            Pin: <span class="blue"><%# Eval("Pin") %></span><br />
                            Thời gian chờ: <span class="blue"><%# Eval("ThoiGianCho") %></span><br />
                            Thời gian đàm thoại: <span class="blue"><%# Eval("ThoiGianDamThoai") %></span><br />
                            Phụ kiện: <span class="blue"><%# Eval("PhuKien") %></span><br />
                            Bảo hành: <span class="blue"><%# Eval("BaoHanh") %></span><br />
                            Lượt xem: <span class="blue"><font color="red"><%# Eval("LuotXem").ToString() %></font></span><br />
                            Tình trạng: <span class="blue"><font color="red"><%# status(Convert.ToInt32(Eval("SoLuong"))) %></font></span><br />
                         </div>
                         <div class="prod_price_big"><span class="price"><%# String.Format("{0:n0}",Eval("Gia")) %> VNĐ</span></div>
                         
                         
                         <asp:LinkButton ID="lbAddtoCart" PostBackUrl='<%# "ThemVaoGio.aspx?IDDT="+Eval("IDDT").ToString() %>' CssClass="addtocart" runat="server">Thêm vào giỏ hàng</asp:LinkButton>
                     </div>                        
            </div>
            <div class="bottom_prod_box_big"></div>                                
        </div>
    </ItemTemplate>
    </asp:Repeater>
        
    <asp:SqlDataSource ID="sdsChiTietDT" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        
        SelectCommand="SELECT tblDienThoai.*, tblNCC.TenNCC  FROM tblDienThoai inner join tblNCC on tblDienThoai.NCC = tblNCC.IDNCC WHERE ([IDDT] = @IDDT)">
        <SelectParameters>
            <asp:QueryStringParameter Name="IDDT" QueryStringField="IDDT" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <div class="center_title_bar">Bình luận / Nhận xét</div>
    <div class="prod_box">
                <asp:GridView ID="fvComment" runat="server" DataSourceID="sdsComment" 
                    AllowPaging="True" AutoGenerateColumns="False" GridLines="None"
                PageSize="5" PagerSettings-NextPageText="Next" PagerSettings-Mode="NumericFirstLast">
                    <EmptyDataTemplate>
                        Hiện tại không có bình luận nào!
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                   <div class="avatar"> 
            <img src="images/no-image.gif" style="margin: 2px 0 0 2px;" />                            
        </div>
        
        <div class="cm_r_top_left"></div>
        
        <div class="comment">

        <span style="font-weight:bold">       
        <%# Eval("TaiKhoan") %> 
        </span>viết:
        
        <br />
        Tiêu đề: <%# Eval("TieuDe") %> <font color="#a5a5a5">(<%# Eval("NgayDang") %>) </font>
        <br />
        <%# Eval("Comments") %></div>
        <div class="clear"></div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

        </asp:GridView>
     

    
        <asp:SqlDataSource ID="sdsComment" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>"></asp:SqlDataSource>
        
<div class="frm_comment">
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="width: 100px; font-size: 12px; font-weight:bold; color: Red">CHIA SẺ Ý KIẾN </td>
                    <td>
                    <asp:TextBox ID="tbTieuDe" runat="server" Text="Tiêu đề"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbTieuDe" ValidationGroup="comment" runat="server" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left:20px;"><img src="images/bg_control_cm.gif" /></td>
                    <td class="tr_com">
                        <asp:TextBox ID="tbCommenContent" Text="Viết ý kiến của bạn" TextMode="MultiLine" Rows="3" Width="400" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbCommenContent" ValidationGroup="comment" runat="server" ErrorMessage="(*)"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="padding-top: 8px;">
                        <asp:Button ID="cmdGuiYK" Text="Gửi Ý Kiến" runat="server" 
                            onclick="cmdGuiYK_Click" ValidationGroup="comment" />
                    </td>
                </tr>
            </table>
        </div>
    </div>

   
    <div class="center_title_bar">Sản Phẩm Tương Tự</div>
    <asp:Repeater ID="rSPTuongTu" runat="server" DataSourceID="sdsSPTuongTu">
    <ItemTemplate>
    <div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box">            
                 <div class="product_title"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><%# Eval("TenDT") %></a></div>
                 <div class="product_img"><a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>'><img src='<%# @"Upload/Prod/"+Eval("HinhAnh").ToString().Trim() %>' width="90px" height="95px" alt="" title=""  /></a></div>
                 <div class="prod_price"><span class="price"><%# String.Format("{0:n0}",Eval("Gia")) %> VNĐ</span></div>                        
            </div>
            <div class="bottom_prod_box"></div>             
            <div class="prod_details_tab">
            <a href='<%# "ThemVaoGio.aspx?IDDT="+Eval("IDDT").ToString() %>' title="header=[Thêm vào giỏ hàng] body=[&nbsp;] fade=[on]"><img src="images/cart_add.png" alt="" title=""  class="left_bt" /></a>          
            <a href='<%# "ChiTietDienThoai.aspx?IDDT="+Eval("IDDT").ToString().Trim() %>' class="prod_details">Chi tiết</a>            
            </div>                     
        </div>
    </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="sdsSPTuongTu" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:MyDataConnectionString.ProviderName %>" 
        SelectCommand="SELECT TOP (3) IDDT, IDNSX, TenDT, Gia, HinhAnh FROM tblDienThoai WHERE (IDDT &lt;&gt; @IDDT) AND (IDNSX = (SELECT IDNSX FROM tblDienThoai AS tblDienThoai_1 WHERE (IDDT = @IDDT))) ORDER BY NEWID()">
        <SelectParameters>
            <asp:QueryStringParameter Name="IDDT" QueryStringField="IDDT" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
