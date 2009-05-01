<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="DeleteAccount.aspx.cs" Inherits="UnnLearningKit.Admin.Users.DeleteAccount" %>

<asp:Content ID="DeleteAccountPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <div class="notice">
        Вы уверены, что хотите удалить учетную запись?<br />Она будет польностью удалена. 
        <br />
        <br />
        Если вы хотите удалить студента, то это нужно сделать на странице группы, в которую входит студент.
        <br />
        <br />
        <asp:Button ID="deleteAccountConfirm" runat="server" Text="Да, удалить" 
            CssClass="button" onclick="deleteAcountConfirm_Click" />
    </div>
</asp:Content>