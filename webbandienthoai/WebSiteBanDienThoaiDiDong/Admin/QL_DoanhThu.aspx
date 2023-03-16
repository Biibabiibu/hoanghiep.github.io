<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_DoanhThu.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_DoanhThu1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="left-column">
</div>
<div id="center-column">
<div class="top-bar">
<h1>Thống kê doanh thu </h1>
</div>
<div class="select-bar">
    <asp:DropDownList ID="ddlThang" runat="server" AutoPostBack="false">
        
    </asp:DropDownList>
   <label>
                <asp:Button ID="cmddtThang" runat="server" Text="Doanh thu tháng" onclick="cmddtThang_Click" />
   </label>
   <asp:DropDownList ID="ddlQuy" runat="server" AutoPostBack="false">
   </asp:DropDownList>
   
    <label>
                <asp:Button ID="cmddtQuy" runat="server" Text="Doanh thu quý" onclick="cmddtQuy_Click" />
   </label>

</div>
<span style="padding-bottom: 10px; text-transform: uppercase; text-align: center">
<h3><asp:Label ID="lblDT" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label></h3>
</span>
<div class="table" style="margin-top: 10px">
    <asp:GridView ID="gvDoanhThu" runat="server" 
         AutoGenerateColumns="False" EmptyDataText="Không có phiếu xuất nào!" 
        Width="100%" CssClass="listing" DataKeyNames="SoPX" 
        DataSourceID="sdsDoanhThu" onrowdatabound="gvDoanhThu_RowDataBound" 
        ShowFooter="True">
        
        <Columns>
            <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %><asp:HiddenField ID="hfTT" runat="server" Value='<%# Eval("TongTien") %>' />
            </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
            <asp:BoundField DataField="SoPX" HeaderText="Mã PX" ReadOnly="True" 
                SortExpression="SoPX" >
                <HeaderStyle ForeColor="Black" />
            </asp:BoundField>

            <asp:BoundField DataField="NgayXuat" HeaderText="Ngày Lập" 
                SortExpression="NgayLap" >
                <HeaderStyle ForeColor="Black" />
            </asp:BoundField>
            <asp:BoundField DataField="TongTien" HeaderText="Giá Trị" 
                SortExpression="TongTien" DataFormatString="{0:n0} VNĐ" >
                <HeaderStyle ForeColor="Black" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsDoanhThu" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" >
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="TrangThai" Type="Byte" />
            <asp:ControlParameter ControlID="ddlThang" Name="NgayLap" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
</div>
</asp:Content>
