<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<% try
   { %>
<%= Html.ActionLink("О себе", "Page", "Professor", new { alias = Html.Encode(((Professor)ViewData["Professor"]).User.NickName), additional = "About" }, new { @class = "menu_lev1" })%><br />
<span class="menu_lev1">Форум</span><br />
<span class="menu_lev1">Календарь-График</span><br />
<%= Html.ActionLink("Дисциплины", "Page", "Professor", new { alias = Html.Encode(((Professor)ViewData["Professor"]).User.NickName), additional = "Disciplines" }, new { @class = "menu_lev1" })%><br />
<% 
    foreach (SpecialityDiscipline specialityDiscipline in (IEnumerable<SpecialityDiscipline>)(((Professor)ViewData["Professor"]).SpecialityDisciplines))
    { %>
<%= Html.ActionLink(specialityDiscipline.Title, "Page", "Professor", new { alias = Html.Encode(((Professor)ViewData["Professor"]).User.NickName), additional = Html.Encode(specialityDiscipline.Alias) }, new { @class = "menu_lev2" })%>
<br />
<% }
   }
   catch (Exception ex)
   {
       Utility.RedirectToErrorPage("ProfessorMenu.ascx: catch exception", ex);
   }%>