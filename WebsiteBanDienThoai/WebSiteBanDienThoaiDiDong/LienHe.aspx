<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChuMaster.Master" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.LienHe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="center_title_bar">Liên Hệ - Góp Ý</div>

<div class="prod_box_big">
<div class="top_prod_box_big"></div>
<div class="center_prod_box_big">

<div class="contact_form">
<div class="form_row">
<label class="contact"><strong>Họ và tên:</strong></label>
    <asp:TextBox ID="txtHoVaTen" runat="server" CssClass="textbox_kael" 
        Height="18px" MaxLength="50" Width="245px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" 
        ControlToValidate="txtHoVaTen" CssClass="star_kael" Display="Dynamic" 
        ErrorMessage="(*)" SetFocusOnError="True" ValidationGroup="LienHe"></asp:RequiredFieldValidator>
</div>
<div class="form_row">
<label class="contact"><strong>Email:</strong></label>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox_kael" Height="18px" 
        MaxLength="50" Width="245px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="(*)" 
        ValidationGroup="LienHe" SetFocusOnError="True" ControlToValidate="txtEmail" 
        CssClass="star_kael" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="(*)" 
        ControlToValidate="txtEmail" CssClass="star_kael" Display="Dynamic" 
        SetFocusOnError="True" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
        ValidationGroup="LienHe"></asp:RegularExpressionValidator>
</div>
<div class="form_row">
<label class="contact"><strong>Số điện thoại:</strong></label>
    <asp:TextBox ID="txtSoDienThoai" runat="server" CssClass="textbox_kael" 
        Height="18px" Width="245px"></asp:TextBox>
</div>
<div class="form_row">
<label class="contact"><strong>Nội dung:</strong></label>
    <asp:TextBox ID="txtNoiDung" runat="server" CssClass="textbox_kael" 
        TextMode="MultiLine" Width="245px" Font-Names="Arial" Font-Size="Small" 
        Height="100px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvNoiDung" runat="server" 
        ControlToValidate="txtNoiDung" CssClass="star_kael" Display="Dynamic" 
        ErrorMessage="(*)" ValidationGroup="LienHe" SetFocusOnError="True"></asp:RequiredFieldValidator>
</div>
<div class="form_row">
    <asp:Button ID="cmd_LienHe" runat="server" Text="Gửi" 
        ValidationGroup="LienHe" BorderColor="Black" 
            BorderStyle="Solid" onclick="cmd_LienHe_Click" BorderWidth="1px" />
</div>
</div>
</div>
<div class="bottom_prod_box_big"></div>
</div>
</asp:Content>
