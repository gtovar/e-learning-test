<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	eВМК – электронный ВМК / Администраторская панель
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="SuperLink">
        <h3 class="SuperLink">Доступные действия</h3>
        <h4 class="SuperLink"><%= Html.ActionLink("Управление факультетами", "Departments", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Управление кафедрами", "Chairs", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Управление программами подготовки", "EducationPlans", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Управление специальностями", "Specialities", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Управление специализациями", "Specializations", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Управление дисциплинами", "SpecialityDisciplines", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Загрузка образовательных документов", "XmlParse", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Генерация образовательных документов", "Index", "Document")%></h4>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
