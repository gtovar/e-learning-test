<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Администраторская панель / Управление кафедрами
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Управление кафедрами / Добавить кафедру</h3>
    <%Html.RenderPartial("Chair/ChairForm", ViewData.Model); %>
</asp:Content>
