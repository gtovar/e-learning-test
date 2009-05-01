<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master"CodeBehind="ManageAccounts.aspx.cs" Inherits="UnnLearningKit.Admin.ManageAccounts" %>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

<asp:Content ID="ManageAccountsPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <br />
    <asp:DropDownList ID="rolesList" runat="server" AutoPostBack="True" 
        DataSourceID="ObjectRolesDataSource" DataTextField="RoleName" 
        DataValueField="RoleName">
    </asp:DropDownList>
&nbsp;
    <asp:Button ID="CreateAccount" runat="server" CssClass="button" 
        Text="Добавить учетную запись" 
        PostBackUrl="~/Admin/Users/CreateAccount.aspx" />
    <asp:ObjectDataSource ID="ObjectRolesDataSource" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllRoles" 
        TypeName="dataSetTableAdapters.RolesTableAdapter"></asp:ObjectDataSource>
    <br />
    <br />
    <asp:GridView ID="viewAccounts" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataSourceID="ObjectAccountsDataSource">
        <RowStyle BackColor="White" ForeColor="#003399" />
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="Логин" 
                SortExpression="UserName" />
            <asp:BoundField DataField="LoweredEmail" HeaderText="Email" 
                SortExpression="LoweredEmail" />
            <asp:HyperLinkField DataNavigateUrlFields="UserName" 
                DataNavigateUrlFormatString="EditAccount.aspx?UserName={0}" 
                HeaderText="Редактировать" Text="Редактировать" />
            <asp:HyperLinkField DataNavigateUrlFields="UserName" 
                DataNavigateUrlFormatString="DeleteAccount.aspx?UserName={0}" 
                HeaderText="Удалить" Text="Удалить" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectAccountsDataSource" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountsContent" 
        TypeName="dataSetTableAdapters.AccountsTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="rolesList" Name="role_name" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <div>
    </div>
</asp:Content>
