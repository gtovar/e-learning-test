<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User/UserMasterPage.master" CodeFile="DoneList.aspx.cs" Inherits="User_DoneList" %>

<asp:Content ID="DoneUserPage"  ContentPlaceHolderID="userContentPlaceHolder" runat="server">
<asp:Label ID="studentsLabel" runat="server" Text="Выполненные тесты" CssClass="title"></asp:Label>
    <div align="center">
        <br />
        <br />
        <p>Список выполненных тестов</p>
    </div>
</asp:Content>
