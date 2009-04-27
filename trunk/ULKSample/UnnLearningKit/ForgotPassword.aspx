<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="ForgotPassword.aspx.cs" Inherits="UnnLearningKit.ForgotPassword" %>

<asp:Content ID="ForgotPasswordPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:PasswordRecovery ID="passwordRecovery" runat="server">
    <MailDefinition From="noreply@unnmlg.com" IsBodyHtml="True" Priority="High" 
        Subject="Ваш новый временный пароль!">
    </MailDefinition>
</asp:PasswordRecovery>
</asp:Content>