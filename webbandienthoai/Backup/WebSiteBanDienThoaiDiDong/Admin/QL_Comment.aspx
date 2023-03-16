<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_Comment.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_Comment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="left-column"></div>
<div id="center-column">
    <div class="top-bar">
        <h1>Quản lý Comments</h1>
    </div>
    <div class="select-bar">
        <asp:TextBox ID="txtTimkiem" runat="server"></asp:TextBox>
        <asp:Button ID="cmdTimKiem" Text="Tim kiếm" runat="server" 
            onclick="cmdTimKiem_Click" />
    </div>
    <asp:GridView ID="gvComment" runat="server" AutoGenerateColumns="False" 
        CssClass="listing" DataKeyNames="CommentID,IDDT" DataSourceID="sdsComment" 
        AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="CommentID" HeaderText="CommentID" 
                InsertVisible="False" ReadOnly="True" SortExpression="CommentID" />
            <asp:BoundField DataField="IDDT" HeaderText="IDDT" ReadOnly="True" 
                SortExpression="IDDT" />
            <asp:BoundField DataField="TieuDe" HeaderText="TieuDe" 
                SortExpression="TieuDe" />
            <asp:BoundField DataField="Comments" HeaderText="Comments" 
                SortExpression="Comments" />
            <asp:BoundField DataField="TaiKhoan" HeaderText="TaiKhoan" 
                SortExpression="TaiKhoan" />
            <asp:BoundField DataField="NgayDang" HeaderText="NgayDang" 
                SortExpression="NgayDang" />
            <asp:TemplateField HeaderText="Chức Năng">
            <ItemTemplate>
                <asp:ImageButton ID="ibDelete" runat="server" title="header=[Xóa] body=[&nbsp;] fade=[on]" ImageUrl="~/Admin/img/hr.gif" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa bản ghi này hay không?');" />                
            </ItemTemplate>
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            Không có comment nào
        </EmptyDataTemplate>
    </asp:GridView>

    <asp:SqlDataSource ID="sdsComment" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>" 
        DeleteCommand="DELETE FROM [tblComment] WHERE [CommentID] = @CommentID AND [IDDT] = @IDDT" 
        InsertCommand="INSERT INTO [tblComment] ([IDDT], [TieuDe], [Comments], [TaiKhoan], [NgayDang]) VALUES (@IDDT, @TieuDe, @Comments, @TaiKhoan, @NgayDang)" 
        SelectCommand="SELECT * FROM [tblComment]" 
        UpdateCommand="UPDATE [tblComment] SET [TieuDe] = @TieuDe, [Comments] = @Comments, [TaiKhoan] = @TaiKhoan, [NgayDang] = @NgayDang WHERE [CommentID] = @CommentID AND [IDDT] = @IDDT">
        <DeleteParameters>
            <asp:Parameter Name="CommentID" Type="Int32" />
            <asp:Parameter Name="IDDT" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IDDT" Type="String" />
            <asp:Parameter Name="TieuDe" Type="String" />
            <asp:Parameter Name="Comments" Type="String" />
            <asp:Parameter Name="TaiKhoan" Type="String" />
            <asp:Parameter Name="NgayDang" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TieuDe" Type="String" />
            <asp:Parameter Name="Comments" Type="String" />
            <asp:Parameter Name="TaiKhoan" Type="String" />
            <asp:Parameter Name="NgayDang" Type="DateTime" />
            <asp:Parameter Name="CommentID" Type="Int32" />
            <asp:Parameter Name="IDDT" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

<br /><br /><br />
</div>

</asp:Content>
