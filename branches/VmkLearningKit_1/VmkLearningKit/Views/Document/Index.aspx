<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="SuperLink">
        <h3 class="SuperLink">Доступные действия</h3>
        <h4 class="SuperLink"><%= Html.ActionLink("Получиить список кафедр", "GetChairDocument")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Получиить список преподавателей", "GetTeacherDocument")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Получить список специальностей", "GetSpecialityDocument")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Получить список групп", "GetStudentDocument")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Получить список студентов", "GetStudentDocument")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Получить программу дисциплины", "SpecialityDisciplines", "Admin")%></h4>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
