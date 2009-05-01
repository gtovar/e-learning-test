<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="Default.aspx.cs" Inherits="UnnLearningKit._Default" %>

<asp:Content ID="DefaultPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
<asp:LoginView ID="loginView" runat="server">
    <LoggedInTemplate>
        Добро пожаловать, <asp:LoginName ID="loginName" runat="server" />!
    </LoggedInTemplate>
    <AnonymousTemplate>
        Перед началом работы нужно пройти <a href="Login.aspx">авторизацию</a><br />
    </AnonymousTemplate>
</asp:LoginView>
</asp:Content>
