<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	eВМК – электронный ВМК / Линый кабинет
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<p style="font-size:14px">
    Добрый день <b><% if (Session["UserName"] != null)
                   {%><%= Session["UserName"]%><% } %>,</b><br /><br />
    Вы находитесь в личном кабинете.<br /><br />
    Здесь вы можете управлять настройками своего аккаунта, а также отдельными настройками портала
    в зависимости от ваших прав.<br /><br />
    Вы доступны следующие настройки:<br /><br />
    <% try
       { %>
    <ul style="margin-left:20px:">
        <li><%= Html.ActionLink("Нстройки аккаунта", "AccountSettings", "Cabinet") %></li><br />
        <% if (null != Session["User"] && ((VmkLearningKit.Models.Domain.User)Session["User"]).IsStudent)
           { %>
        <li><%= Html.ActionLink("Кабинет студента", "Student", "Cabinet") %></li><br />
           <% } %>
        <% if (null != Session["User"] && ((VmkLearningKit.Models.Domain.User)Session["User"]).IsMetodist)
           { %> 
        <li><%= Html.ActionLink("Кабинет методиста", "Metodist", "Cabinet") %></li><br />
           <% } %>
        <% if (null != Session["User"] && ((VmkLearningKit.Models.Domain.User)Session["User"]).IsProfessor)
           { %>
        <li><%= Html.ActionLink("Кабинет преподавателя", "Professor", "Cabinet") %></li><br />
           <% } %>
        <% if (null != Session["User"] && ((VmkLearningKit.Models.Domain.User)Session["User"]).IsAdmin)
           { %>
        <li><%= Html.ActionLink("Кабинет админинстратора", "Admin", "Cabinet") %></li><br />
           <% } %>
    </ul>
    <%}
       catch (Exception ex)
       {
           Utility.RedirectToErrorPage("CabinetController.Menu: catch exception", ex);
       } %>
</p>
</asp:Content>
