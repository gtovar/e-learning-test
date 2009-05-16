<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditAccount.aspx.cs" Inherits="Admin_Accounts_EditAccount" %>

<asp:Content ID="headEditAccountPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentEditAccountPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
<div class="title">
        <asp:Label ID="titleText" runat="server" Text="Редактирование учетной записи"></asp:Label>
    </div>
    <div>
        <br />
        <asp:Label ID="loginTitle" runat="server" Text="Логин*:" Font-Size="Medium"></asp:Label>
        <br />
        <asp:TextBox ID="loginValue" runat="server" Width="220px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="loginValidation" runat="server" 
            ControlToValidate="loginValue" CssClass="validation" Display="Dynamic" 
            ErrorMessage="Логин">Логин не должен быть пустым</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="emailTitle" runat="server" Text="Email*:" Font-Size="Medium"></asp:Label>
        <br />
        <asp:TextBox ID="emailValue" runat="server" Width="220px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="emailValidation" runat="server" 
            ControlToValidate="emailValue" CssClass="validation" Display="Dynamic" 
            ErrorMessage="Email">Email не должен быть пустым</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="emailFormatValidation" runat="server" 
            ControlToValidate="emailValue" CssClass="validation" Display="Dynamic" 
            ErrorMessage="Email" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Email должен соответствовать формату электронной почты</asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="roleTitle" runat="server" Text="Группа прав*:" 
            Font-Size="Medium"></asp:Label>
        <br />
        <asp:DropDownList ID="rolesList" runat="server" 
            DataSourceID="ObjectRolesDataSource" DataTextField="RoleName" 
            DataValueField="RoleId">
        </asp:DropDownList>
        <br />
        <asp:ObjectDataSource ID="ObjectRolesDataSource" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllRoles" 
            TypeName="dataSetTableAdapters.RolesTableAdapter"></asp:ObjectDataSource>
        <asp:ValidationSummary ID="editAccountValidationSummary" runat="server" 
            CssClass="validation" HeaderText="Ошибки при заполнении следующих полей" />
        <br />
        <asp:Button ID="saveAccount" runat="server" CssClass="button" 
            Text="Сохранить" onclick="saveAccount_Click" />
    </div>
</asp:Content>

