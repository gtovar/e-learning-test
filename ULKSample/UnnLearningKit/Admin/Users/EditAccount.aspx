<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="EditAccount.aspx.cs" Inherits="UnnLearningKit.Admin.Users.EditAccount" %>

<asp:Content ID="EditAccountPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <div class="title">
        <asp:Label ID="titleText" runat="server" Text="Редактирование учетной записи"></asp:Label>
    </div>
    <div>
        <br />
        <asp:Label ID="loginTitle" runat="server" Text="Логин*:"></asp:Label>
        <br />
        <asp:TextBox ID="loginValue" runat="server" Width="220px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="loginValidation" runat="server" 
            ControlToValidate="loginValue" CssClass="validation" Display="Dynamic" 
            ErrorMessage="Логин">Логин не должен быть пустым</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="emailTitle" runat="server" Text="Email*:"></asp:Label>
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
        <asp:Label ID="roleTitle" runat="server" Text="Группа прав*:"></asp:Label>
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
&nbsp;&nbsp;
        <asp:Button ID="cancelEditAccount" runat="server" 
            PostBackUrl="~/Admin/Users/ManageAccounts.aspx" Text="Отмена" 
            CssClass="button" />
    </div>
</asp:Content>