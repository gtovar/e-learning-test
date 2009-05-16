<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="ManageAccounts.aspx.cs" Inherits="Admin_Accounts_ManageAccounts" %>

<asp:Content ID="headManageAccountsPage" ContentPlaceHolderID="headAdminMasterPage"
    runat="Server">
</asp:Content>
<asp:Content ID="contentManageAccountsPage" ContentPlaceHolderID="adminContentPlaceHolder"
    runat="Server">
    <asp:Label ID="accountsTitleLabel" runat="server" CssClass="title" Text="Учетные записи"></asp:Label>
    <br />
    <br />
    <table width="100%">
        <tr>
            <td width="5%">
                <asp:Label ID="roleTitleLabel" runat="server" Text="Роль:" Font-Size="Medium"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="rolesList" runat="server" AutoPostBack="True" DataSourceID="RolesObjectDataSource"
                    DataTextField="RoleName" DataValueField="RoleName" 
                    ondatabound="rolesList_DataBound">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="RolesObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetAllRoles" TypeName="dataSetTableAdapters.RolesTableAdapter">
                </asp:ObjectDataSource>
            </td>
            <td align="right" valign="bottom">
                <asp:Button ID="addAccount" runat="server" Text="Добавить учетную запись" CssClass="button"
                    OnClick="addAccount_Click" />
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="accountsGridView" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="AccountsObjectDataSource"
        ForeColor="#333333" GridLines="None" Width="100%">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="Логин" SortExpression="UserName">
                <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="LoweredEmail" HeaderText="E-mail" SortExpression="LoweredEmail">
                <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="UserName" DataNavigateUrlFormatString="~/Admin/Accounts/EditAccount.aspx?UserName={0}"
                HeaderText="Операции" Text="Редактировать">
                <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="UserName" DataNavigateUrlFormatString="~/Admin/Accounts/DeleteAccount.aspx?UserName={0}"
                HeaderText="Операции" Text="Удалить">
                <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
            </asp:HyperLinkField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:ObjectDataSource ID="AccountsObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAccountContent" TypeName="dataSetTableAdapters.AccountsTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="rolesList" Name="role_name" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
</asp:Content>
