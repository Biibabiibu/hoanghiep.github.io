<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TinMoi.ascx.cs" Inherits="WebSiteBanDienThoaiDiDong.UserControl.TinMoi" %>
<div class="title_box">Tin Mới</div> 
     <div class="border_box_tin">

          <asp:Repeater ID="rTinKhac" runat="server" DataSourceID="sdsTinKhac">
    <ItemTemplate>
        <asp:Image ID="iTinMoi" runat="server" ImageUrl="~/images/newspaper_go.png"/>
    <asp:HyperLink ID="hlTieuDeTinTuc" runat="server" Font-Underline=false Font-Bold=true  Font-Size=12px NavigateUrl='<%# "~/ChiTietTinTuc.aspx?tinid="+Eval("MaTinTuc").ToString() %>' ForeColor="#0066FF"><%# Eval("TieuDe").ToString() %></asp:HyperLink><br />
    </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="sdsTinKhac" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT TOP (5) * FROM [tblTinTuc] ORDER BY MaTinTuc DESC">
        
    </asp:SqlDataSource>
     </div>