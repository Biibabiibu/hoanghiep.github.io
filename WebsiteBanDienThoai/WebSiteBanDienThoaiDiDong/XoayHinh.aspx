<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XoayHinh.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.XoayHinh" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/j360.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery('#product').j360();
        });
        </script>
</head>
<body>
    <form id="form1" runat="server">
      <div>
        
            <asp:Repeater ID="rptImages" runat="server" DataSourceID="sdsRotaImages">
                <ItemTemplate>
                    <div id="product" style="width: 640px; height: 480px; overflow: hidden; cursor: move; margin-left: -450px">
                        <img src='<%# @"Upload/Prod/"+Eval("HinhAnh2").ToString().Trim() %>' alt="" />
                        <img src='<%# @"Upload/Prod/"+Eval("HinhAnh3").ToString().Trim() %>' alt="" />
                        <img src='<%# @"Upload/Prod/"+Eval("HinhAnh4").ToString().Trim() %>' />
                    </div>            
                </ItemTemplate>
            </asp:Repeater>
        
            <asp:SqlDataSource ID="sdsRotaImages" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
                SelectCommand="SELECT * FROM [tblDienThoai] WHERE ([IDDT] = @IDDT)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="IDDT" QueryStringField="IDDT" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        
    </div>
    </form>
</body>
</html>
