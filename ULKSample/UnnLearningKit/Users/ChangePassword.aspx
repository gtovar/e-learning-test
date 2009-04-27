<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" MasterPageFile="~/Main.Master" Inherits="UnnLearningKit.ChangePassword" %>

<asp:Content ID="ChangePasswordPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:ChangePassword ID="changePasswd" runat="server" 
        CancelDestinationPageUrl="~/Default.aspx">
    </asp:ChangePassword>
&nbsp;
</asp:Content>