<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User/UserMasterPage.master" CodeFile="Default.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="DefaultUserPage"  ContentPlaceHolderID="userContentPlaceHolder" runat="server">
    <div align="center">
        <br />
        <br />
        <div class="title">Панель пользователя</div>
        <br />
        <asp:Label ID="HelloLabel" runat="server" Text="Здравствуйте!" Font-Size="Medium" Font-Bold="True"></asp:Label>
        <br />
        <asp:Label ID="InfoAboutNewTestsLabel" runat="server" Text="В разделе Назначенные тесты вы можете просмотреть список назначенных вам тестов и пройти их." Font-Size="Medium"></asp:Label>
        <br />
        <asp:Label ID="InfoAboutDoneTestsLabel" runat="server" Text="В разделе Выполенные тесты вы можете просмотреть список пройденных тестов, а также узнать свой балл за каждый тест." Font-Size="Medium"></asp:Label>
    </div>
</asp:Content>
