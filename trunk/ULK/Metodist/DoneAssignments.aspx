﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Metodist/MetodistMasterPage.master" CodeFile="DoneAssignments.aspx.cs" Inherits="Metodist_DoneAssignments" %>

<asp:Content ID="DoneAssignmentsMetodistPage"  ContentPlaceHolderID="metodistContentPlaceHolder" runat="server">
<asp:Label ID="metodistLabel" runat="server" Text="Выполненные тесты" CssClass="title"></asp:Label>
    <div align="center">
        <br />
        <br />
        <p>Список выполненных пользователями тестов, выборка по факультету, группе, студенту</p>
    </div>
</asp:Content>