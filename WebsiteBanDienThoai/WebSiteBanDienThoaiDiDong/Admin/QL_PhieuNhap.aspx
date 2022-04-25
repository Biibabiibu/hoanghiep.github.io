<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QL_PhieuNhap.aspx.cs" Inherits="WebSiteBanDienThoaiDiDong.Admin.QL_PhieuNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="left-column">
    </div>
    <div id="center-column">
        <div class="top-bar">
            <h1>
                Quản lý phiếu nhập</h1>
        </div>
        <div class="select-bar">
            <label>
                <asp:TextBox ID="txtTimKiem" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvTimKiem" runat="server" ErrorMessage="Bạn cần nhập từ khóa tìm kiếm!"
                    ControlToValidate="txtTimKiem" Display="None" SetFocusOnError="True" ValidationGroup="TimKiem"></asp:RequiredFieldValidator>
                <asp:ValidationSummary ID="vsTimKiem" runat="server" ShowMessageBox="True" ShowSummary="False"
                    ValidationGroup="TimKiem" />
            </label>
            <label>
                <asp:Button ID="cmdTimKiem" runat="server" Text="Tìm kiếm dòng phiếu nhập" ValidationGroup="TimKiem"
                    OnClick="cmdTimKiem_Click" />
            </label>
            <label>
                <asp:Button ID="cmdShow" runat="server" Text="Hiện toàn bộ bản ghi" OnClick="cmdShow_Click" />
            </label>
        </div>
        <asp:GridView ID="gvPhieuNhap" runat="server" AutoGenerateColumns="False" DataKeyNames="SoPN"
            DataSourceID="sdsPhieuNhap" CssClass="listing" OnSelectedIndexChanged="gvPhieuNhap_SelectedIndexChanged"
            OnRowDeleting="gvPhieuNhap_RowDeleting" 
            onrowupdating="gvPhieuNhap_RowUpdating">
            <Columns>
                <asp:BoundField DataField="SoPN" HeaderText="SoPN" InsertVisible="False" ReadOnly="True"
                    SortExpression="SoPN" />
                <asp:BoundField DataField="NgayNhap" HeaderText="NgayNhap" SortExpression="NgayNhap" />
                <asp:BoundField DataField="MaNCC" HeaderText="MaNCC" SortExpression="MaNCC" />
                <asp:TemplateField HeaderText="Chức Năng">
                    <ItemTemplate>
                        <asp:ImageButton ID="ibDelete" runat="server" title="header=[Xóa] body=[&nbsp;] fade=[on]"
                            ImageUrl="~/Admin/img/hr.gif" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa bản ghi này hay không?');" />
                        <asp:ImageButton ID="ibSelect" runat="server" title="header=[Sửa] body=[&nbsp;] fade=[on]"
                            ImageUrl="~/Admin/img/edit-icon.gif" CommandName="Select" />
                    </ItemTemplate>
                    <HeaderStyle ForeColor="Black" />
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                Không có phiếu nhập nào!
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsPhieuNhap" runat="server" ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>"
            SelectCommand="SELECT * FROM [tblPhieuNhap]" DeleteCommand="DELETE FROM [tblPhieuNhap] WHERE [SoPN] = @SoPN"
            InsertCommand="INSERT INTO [tblPhieuNhap] ([NgayNhap], [MaNCC]) VALUES (@NgayNhap, @MaNCC)"
            UpdateCommand="UPDATE [tblPhieuNhap] SET [NgayNhap] = @NgayNhap, [MaNCC] = @MaNCC WHERE [SoPN] = @SoPN">
            <DeleteParameters>
                <asp:Parameter Name="SoPN" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NgayNhap" Type="DateTime" />
                <asp:Parameter Name="MaNCC" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NgayNhap" Type="DateTime" />
                <asp:Parameter Name="MaNCC" Type="Int32" />
                <asp:Parameter Name="SoPN" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div class="table">
            <div style="border-top: 2px solid #f70; margin-top: 17px;">
                <h3 style="color: #43729F">
                    Chi tiết phiếu nhập</h3>
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td class="nhan">
                            Số phiếu nhập:
                        </td>
                        <td>
                            <asp:Label ID="lbSoPN" runat="server" Text="Tự động" ForeColor="Red"></asp:Label>
                            <asp:HiddenField ID="hfSoPN" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="nhan">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="nhan">
                            Ngày nhập:
                        </td>
                        <td>
                            <asp:TextBox ID="txtNgayNhap" Width="200" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvngay" ControlToValidate="txtNgayNhap" ErrorMessage="(*)"
                                ValidationGroup="addGroup" runat="server"></asp:RequiredFieldValidator>
                            <p>
                                <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged">
                                </asp:Calendar>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="nhan">
                            Nhà cung cấp:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlNCC" runat="server" DataSourceID="sdsNCC" DataTextField="TenNCC"
                                DataValueField="IDNCC">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsNCC" runat="server" ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>"
                                SelectCommand="SELECT * FROM [tblNCC]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="nhan">
                            Dòng phiếu nhập:
                        </td>
                        <td>
                            <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False" Width="100%"
                                ShowHeader="true" ShowFooter="true" OnRowCommand="gvDetails_RowCommand" DataKeyNames="ID"
                                CssClass="listing" OnRowCancelingEdit="gvDetails_RowCancelingEdit" OnRowDeleting="gvDetails_RowDeleting"
                                OnRowEditing="gvDetails_RowEditing" OnRowUpdating="gvDetails_RowUpdating" 
                                ondatabinding="gvDetails_DataBinding">
                                <Columns>
                                    <asp:TemplateField HeaderText="Chức năng">
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="img/update.jpg"
                                                title="header=[Cập nhật] body=[&nbsp;] fade=[on]" />
                                            <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="img/Cancel.jpg"
                                                title="header=[Hủy bỏ] body=[&nbsp;] fade=[on]" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server"
                                                ImageUrl="img/delete_16.png" title="header=[Xóa] body=[&nbsp;] fade=[on]" />
                                            <asp:HiddenField ID="hfID" Value='<% Eval("IDDT") %>' runat="server" />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="img/add_16.png" CommandName="AddNew"
                                                title="header=[Thêm mới dòng phiếu nhập] body=[&nbsp;] fade=[on]" ValidationGroup="validaiton" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ID Điện thoại">
                                        <ItemTemplate>
                                            <asp:Label ID="lbIDDT" runat="server" Text='<%#Eval("IDDT") %>' />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="tbIDDT" runat="server" Width="100" />
                                            <asp:RequiredFieldValidator ID="rfvIDDT" runat="server" ControlToValidate="tbIDDT"
                                                Text="*" ValidationGroup="validaiton" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tên Điện thoại">
                                        <ItemTemplate>
                                            <asp:Label ID="lbTenDT" runat="server" Text='<%#Eval("TenDT") %>' />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="tbTenDT" runat="server" Width="100" />
                                            <asp:RequiredFieldValidator ID="rfvTenDT" runat="server" ControlToValidate="tbIDDT"
                                                Text="*" ValidationGroup="validaiton" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Số lượng">
                                        <ItemTemplate>
                                            <asp:Label ID="lbSoLuong" runat="server" Text='<%#Eval("SoLuong") %>' />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="tbSoLuong" Width="50" runat="server" />
                                            <asp:RequiredFieldValidator ID="rfvSoLuong" runat="server" ControlToValidate="tbSoLuong"
                                                Text="*" ValidationGroup="validaiton" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Giá nhập">
                                        <ItemTemplate>
                                            <asp:Label ID="lbGia" runat="server" Text='<%#Eval("GiaNhap") %>' />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="tbGiaNhap" runat="server" />
                                            <asp:RequiredFieldValidator ID="rfvgia" runat="server" ControlToValidate="tbGiaNhap"
                                                Text="*" ValidationGroup="validaiton" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:GridView ID="gvDetailsUpdate" runat="server" Width="100%" Visible="False" CssClass="listing"
                                AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="IDDPN" OnRowCommand="gvDetailsUpdate_RowCommand"
                                OnRowDeleting="gvDetailsUpdate_RowDeleting" OnRowCancelingEdit="gvDetailsUpdate_RowCancelingEdit"
                                OnRowEditing="gvDetailsUpdate_RowEditing" OnRowUpdating="gvDetailsUpdate_RowUpdating">
                                <Columns>
                                    <asp:TemplateField HeaderText="Chức năng">
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="img/check_16.png"
                                                title="header=[Lưu lại] body=[&nbsp;] fade=[on]" />
                                            <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="img/cancel_16.png"
                                                title="header=[Hủy bỏ] body=[&nbsp;] fade=[on]" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" ImageUrl="img/edit-icon.gif"
                                                title="header=[Sửa thông tin] body=[&nbsp;] fade=[on]" />
                                            <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server"
                                                ImageUrl="img/delete_16.png" title="header=[Xóa] body=[&nbsp;] fade=[on]" />
                                            <asp:HiddenField ID="hfID" Value='<% Eval("IDDT") %>' runat="server" />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="img/add_16.png" CommandName="AddNew"
                                                title="header=[Thêm mới dòng phiếu nhập] body=[&nbsp;] fade=[on]" ValidationGroup="validaiton" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Số phiếu nhập">
                                        <ItemTemplate>
                                            <asp:Label ID="lbSoPN" Text='<%# Eval("SoPN") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ID điện thoại">
                                        <ItemTemplate>
                                            <asp:Label ID="lbIDDT" Text='<%# Eval("IDDT") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtIDDT" Text='<%# Eval("IDDT") %>' CssClass="qlpn-input" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="tbIDDT" Width="100" runat="server" CssClass="qlpn-input"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv1" ControlToValidate="tbIDDT" ValidationGroup="update"
                                                ErrorMessage="(*)" runat="server"></asp:RequiredFieldValidator>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tên điện thoại">
                                        <ItemTemplate>
                                            <asp:Label ID="lbTenDT" Text='<%# Eval("TenDT") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtTenDT" Text='<%# Eval("TenDT") %>' runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="tbTenDT" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv5" ControlToValidate="tbTenDT" ValidationGroup="update"
                                                ErrorMessage="(*)" runat="server"></asp:RequiredFieldValidator>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Số lượng">
                                        <ItemTemplate>
                                            <asp:Label ID="lbSoLuong" Text='<%# Eval("SoLuong") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtSoLuong" Text='<%# Eval("SoLuong") %>' Width="35" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="tbSoLuong" Width="35" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv2" ControlToValidate="tbSoLuong" ValidationGroup="update"
                                                ErrorMessage="(*)" runat="server"></asp:RequiredFieldValidator>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Giá nhập">
                                        <ItemTemplate>
                                            <asp:Label ID="lbGiaNhap" Text='<%# Eval("GiaNhap", "{0:n0} VND") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtGiaNhap" Text='<%# Eval("GiaNhap") %>' runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="tbGiaNhap" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv3" ControlToValidate="tbGiaNhap" ValidationGroup="update"
                                                ErrorMessage="(*)" runat="server"></asp:RequiredFieldValidator>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    Không tồn tại dòng phiếu nhập nào cho PHIẾU NHẬP này!
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsDetailsUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:MyDataConnectionString %>">
                            </asp:SqlDataSource>
                            <br />
                            <asp:Label ID="lblresult" runat="server" ForeColor="Red" Font-Size="12px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="nhan">
                        </td>
                        <td>
                            <asp:Button ID="cmdThemMoi" Text="Thêm mới" runat="server" OnClick="cmdThemMoi_Click"
                                ValidationGroup="addGroup" />
                            <asp:Button ID="cmdCapNhat" Text="Cập nhật" runat="server" OnClick="cmdCapNhat_Click" />
                            <asp:Button ID="cmdLamLai" Text="Làm lại" runat="server" OnClick="cmdLamLai_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
