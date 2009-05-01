<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="Login.aspx.cs" Inherits="UnnLearningKit.Login" %>

<asp:Content ID="LoginPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:Login ID="loginForm" runat="server" BackColor="#E3EAEB" BorderColor="#E6E2D8" 
    BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
    Font-Size="0.8em" ForeColor="#333333" PasswordRecoveryText="Забыли пароль?" 
        PasswordRecoveryUrl="~/ForgotPassword.aspx" TextLayout="TextOnTop" 
        LoginButtonText="Войти" TitleText="Авторизация" >
    <TextBoxStyle Font-Size="0.8em" />
    <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" 
        BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
    <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="0.9em" 
        ForeColor="White" />
</asp:Login>
&nbsp;
</asp:Content>