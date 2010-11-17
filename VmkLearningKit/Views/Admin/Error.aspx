<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	eВМК – электронный ВМК / Администраторская панель 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>eВМК – электронный ВМК / Администраторская панель /Error</h2>
    <p style=" color:red">
    Произошла ошибка во процессе обращения к базе данных: <%=ViewData["Error"] %>
    </p>
</asp:Content>
