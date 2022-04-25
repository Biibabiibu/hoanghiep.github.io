<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="ChiTietTinTuc.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.ChiTietTinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%if (Request["tinid"] == null) Response.Redirect("Default.aspx"); %>
<div class="prod_box_big">
<asp:DataList ID="dlChiTietTinTuc" runat="server">
    <ItemTemplate>
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td align=right>
                    <asp:Label ID="lNgayDang" Font-Size="Small" runat="server" Text='<%# Eval("NgayDangTin").ToString().Trim() %>'></asp:Label>
                </td>
            </tr>
            <tr><td><hr /></td></tr>
            <tr>
                <td>
                    <asp:Label ID="lTieuDe" runat="server" Font-Size="Large" Font-Bold="true" ForeColor="Black" Text='<%# Eval("TieuDe").ToString() %>'></asp:Label>
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td>
                    <asp:Label ID="lTomTat" Font-Bold="true" Font-Size="12px" ForeColor="Black" runat="server" Text='<%# Eval("TomTat").ToString() %>'></asp:Label>
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lNoiDung" ForeColor="Black" Font-Size="Small" runat="server" Text='<%# Eval("NoiDung").ToString() %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align=right>
                    <asp:Label ID="lTacGia" ForeColor="Black" Font-Bold="true" runat="server" Text='<%# Eval("TacGia").ToString().Trim().ToUpper() %>'></asp:Label>
                </td>
            </tr>
        </table>
    </ItemTemplate>
    </asp:DataList>
    <hr />
    <br />
    <p align=center><asp:HyperLink ID="hlback" Font-Size="Small" runat="server" NavigateUrl="~/TinTuc.aspx">Quay Lại Trang Tin Tức</asp:HyperLink></p>
    <div style="font-family:Arial; font-size:12px; font-weight:bold; text-decoration:underline;">Các tin tức khác</div>
    <asp:Repeater ID="rTinKhac" runat="server" DataSourceID="sdsTinKhac">
    <ItemTemplate>
    <span style="color:Red; font-weight:bold">>>> </span><asp:HyperLink ID="hlTieuDeTinTuc" runat="server" Font-Underline=false Font-Bold=true  Font-Size=12px NavigateUrl='<%# "ChiTietTinTuc.aspx?tinid="+Eval("MaTinTuc").ToString() %>' ForeColor="#0066FF"><%# Eval("TieuDe").ToString() %></asp:HyperLink><br />
    </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="sdsTinKhac" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        SelectCommand="SELECT TOP (6) * FROM [tblTinTuc] WHERE ([MaTinTuc] &lt;&gt; @MaTinTuc) ORDER BY MaTinTuc DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="MaTinTuc" QueryStringField="tinid" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>    
</asp:Content>
