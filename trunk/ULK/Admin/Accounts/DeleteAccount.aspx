<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DeleteAccount.aspx.cs" Inherits="Admin_Accounts_DeleteAccount" %>

<asp:Content ID="headDeleteAccountPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentDeleteAccountPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="deleteAccountLabel" runat="server" CssClass="title" 
        Text="Удаление учентной записи"></asp:Label>
    <br />
    <br />
    <br />
    <div style="text-align: center; font-size: medium">
        Вы действительно хотите удалить учетную запись!!! 
        <br />
        После удаления она не сможет быть восстановлена, только создана заново.
        <br />
        Если вы точно уверены, то нажмите продолжить.
        <br />
        <br />
        <asp:Button ID="deleteAccount" runat="server" Text="Продолжить" 
            CssClass="button" onclick="deleteAccount_Click" />
    </div>
</asp:Content>

