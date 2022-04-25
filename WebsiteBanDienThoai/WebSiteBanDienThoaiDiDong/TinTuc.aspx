<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="TinTuc.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.TinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="center_title_bar">Tin Tức</div>
    <div class="prod_box_big">
    <hr />
    <asp:DataList ID="DLTinTuc" runat="server">
    <ItemTemplate>
        <table width=100% cellpadding=1 cellspacing=2>
            <tr>
                <td rowspan="3" valign=middle>
                    <asp:ImageButton ID="ibHinhAnhTinTuc" runat="server" Height=100px Width=130px ImageUrl='<%# @"~\Upload\News\"+Eval("HinhAnh").ToString().Trim() %>' PostBackUrl='<%# "ChiTietTinTuc.aspx?tinid="+Eval("MaTinTuc").ToString() %>' AlternateText="Hình ảnh" BorderStyle="Solid" BorderWidth="1" />
                </td>
                <td>
                    <asp:HyperLink ID="hlTieuDeTinTuc" runat="server" Font-Underline=false Font-Bold=true  Font-Size=12px NavigateUrl='<%# "ChiTietTinTuc.aspx?tinid="+Eval("MaTinTuc").ToString() %>' ForeColor="#0066FF"><%# Eval("TieuDe").ToString() %></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lTomTatTinTuc" runat="server" Text='<%# Eval("TomTat").ToString() %>' Font-Size="Small" ForeColor="Black"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align=right>
                    <asp:HyperLink ID="hlXemTiepTinTuc" runat="server" Font-Underline=false ForeColor=#555555 NavigateUrl='<%# "ChiTietTinTuc.aspx?tinid="+Eval("MaTinTuc").ToString() %>'>Xem tiếp &gt;&gt;&gt</asp:HyperLink>
                </td>
            </tr>
        </table>
        <hr />
    </ItemTemplate>
    </asp:DataList>
    <div class="Trang"><p align=center><asp:Label ID="lTrangTinTuc" runat="server" Text="" Font-Size=Small><strong>Trang</strong> </asp:Label></p></div>
    </div>
</asp:Content>
