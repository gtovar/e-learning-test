<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (null != Session["User"] && ((VmkLearningKit.Models.Domain.User)Session["User"]).HasRole("Admin"))
    {
%>
<li>
    <%= Html.ActionLink("Администраторская панель", "Index", "Admin") %>
    <ul>
        <li>
            <%= Html.ActionLink("Факультеты", "Departments", "Admin") %></li>
        <li>
            <%= Html.ActionLink("Кафедры", "Chairs", "Admin")%></li>
        <li>
            <%= Html.ActionLink("Программы подготовки", "EducationPlans", "Admin")%></li>
        <li>
            <%= Html.ActionLink("Специальности", "Specialities", "Admin")%></li>
        <li>
            <%= Html.ActionLink("Специализации ", "Specializations", "Admin")%></li>
        <li>
            <%= Html.ActionLink("Дисциплины", "SpecialityDisciplines", "Admin")%></li>
    </ul>
</li>
<li>
    <%= Html.ActionLink("Управление пользователями", "Users", "Admin") %>
    <ul>
        <li>
            <%= Html.ActionLink("Академические группы", "Groups", "Admin") %></li>
    </ul>
</li>
<% }
    else if (null != Session["User"])
    {
        Utility.RedirectToErrorPage("User without admin rights tries to get access to AdminNavigation");
    } %>