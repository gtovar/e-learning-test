﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User/UserMasterPage.master" CodeFile="ToDoList.aspx.cs" Inherits="User_ToDoList" %>

<asp:Content ID="ToDoUserPage"  ContentPlaceHolderID="userContentPlaceHolder" runat="server">
<asp:Label ID="studentsLabel" runat="server" Text="Назначенные тесты" CssClass="title"></asp:Label>
    <div align="center">
        <br />
        <br />
        <p>Список назначенных тестов и тестов находящихся в процессе выполнения</p>
    </div>
</asp:Content>
