<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%string path = System.Web.HttpContext.Current.Server.MapPath("/Uploads/Downloads" + "\\" + DateTime.Now.DayOfYear); %>
    <div class="SuperLink">
        <h3 class="SuperLink">Доступные действия</h3>
        <h4 class="SuperLink"><%= Html.ActionLink("Получить список кафедр", "GetChairDocument")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Получить список преподавателей", "GetTeacherDocument")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Получить список специальностей", "GetSpecialityDocument")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("Получить контингент", "GetStudentDocument")%></h4>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
