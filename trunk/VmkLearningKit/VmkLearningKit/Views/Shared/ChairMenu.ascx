<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<% try
   { %>
<%= Html.ActionLink("О кафедре", "Chairs", "Home", new { alias = ((Chair)ViewData["Chair"]).Alias, additional = "About" }, new { @class = "menu_lev1" })%><br />
<%= Html.ActionLink("Преподаватели кафедры", "Chairs", "Home", new { alias = ((Chair)ViewData["Chair"]).Alias, additional = "Professors" }, new { @class = "menu_lev1" })%><br />
<% }
   catch (Exception ex)
   {
       Utility.RedirectToErrorPage("ChairMenu.ascx: catch exception", ex);
   } %>