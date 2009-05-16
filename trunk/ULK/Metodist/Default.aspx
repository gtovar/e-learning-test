<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Metodist/MetodistMasterPage.master" CodeFile="Default.aspx.cs" Inherits="Metodist_Default" %>

<asp:Content ID="DefaultMetodistPage"  ContentPlaceHolderID="metodistContentPlaceHolder" runat="server">
    <div align="center">
        <br />
        <br />
        <div class="title">Панель методиста</div>
        <br />
        <asp:Label ID="HelloLabel" runat="server" Text="Здравствуйте!" Font-Size="Medium" Font-Bold="True"></asp:Label>
        <br />
        <asp:Label ID="MetodistInfoLabel1" runat="server" Text="В разделе Назначение тестов вы можете назначить тесты студентам определенной группы." Font-Size="Medium"></asp:Label>
        <br />
                <asp:Label ID="MetodistInfoLabel2" runat="server" Text="В разделе Назначенные тесты вы можете просмотреть список назначенных тестов студентами." Font-Size="Medium"></asp:Label>
        <br />
        <asp:Label ID="MetodistInfoLabel3" runat="server" Text="В разделе Выполенные тесты вы можете просмотреть список выполненных тестов студентами, а также полученный ими балл." Font-Size="Medium"></asp:Label>
    </div>
</asp:Content>
