<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddDepartments.aspx.cs" Inherits="Admin_Departments_AddDepartments" %>

<asp:Content ID="headAddDepartmentsPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentDepartmentsPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="addDepartmentsLabel" runat="server" CssClass="title" 
        Text="Добавить факультет"></asp:Label>
    <br />
    <br />
    <asp:Label ID="departmentTitleLabel" runat="server" Text="Название:*" 
        Font-Size="Medium"></asp:Label>
    <br />
    <asp:TextBox ID="titleText" runat="server" Width="336px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="departmentTitleRequiredValidator" 
        runat="server" ControlToValidate="titleText" CssClass="validation" 
        Display="Dynamic" ErrorMessage="Название">Название не должно быть пустым</asp:RequiredFieldValidator>
    <br />
    <asp:ValidationSummary ID="departmentValidationSummary" runat="server" 
        CssClass="validation" HeaderText="В следующих полях допущены ошибки:" />
    <br />
    <asp:Button ID="saveDepartment" runat="server" CssClass="button" 
        Text="Сохранить" onclick="saveDepartment_Click" />
</asp:Content>

