<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	eВМК – электронный ВМК / Администраторская панель
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<p align="center" style="font-size:medium">
    Добрый день <b><% if (Session["UserName"] != null)
                   {%><%= Session["UserName"]%><% } %>,</b><br /><br />
    Вы находитесь в администраторской панели.<br /><br />
    Для управления порталом воспользуйтесь навигационным меню вверху страницы.
</p>
</asp:Content>
