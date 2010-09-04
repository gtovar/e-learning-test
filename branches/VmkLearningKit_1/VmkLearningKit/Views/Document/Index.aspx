<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Генератор doc-файлов </h2>
    <br />
    <%= Html.ActionLink("Получить список кафедр", "GetChairDocument")%>
    <br />
    <br />
    <%= Html.ActionLink("Получить список преподавателей", "GetTeacherDocument")%>
    <br />
    <br />
    <%= Html.ActionLink("Получить список специальностей", "GetSpecialityDocument")%>
    <br />
    <br />
    <%= Html.ActionLink("Получить список студентов", "GetStudentDocument")%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
