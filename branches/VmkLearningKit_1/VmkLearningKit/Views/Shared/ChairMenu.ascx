<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<% try
   { %>
<%= Html.ActionLink("О кафедре", "Chairs", "Home", new { alias = ((Chair)ViewData["Chair"]).Alias, additional = "About" }, new { @class = "menu_lev1" })%><br />
<%= Html.ActionLink("Преподаватели кафедры", "Chairs", "Home", new { alias = ((Chair)ViewData["Chair"]).Alias, additional = "Professors" }, new { @class = "menu_lev1" })%><br />
<% 
    foreach (Professor professor in (IEnumerable<Professor>)((Chair)ViewData["Chair"]).Professors)
    { 
       string fio = String.Empty;
       if (!professor.User.FirstName.Trim().Equals(String.Empty) &&
           !professor.User.Patronymic.Trim().Equals(String.Empty))
       {
           fio = Html.Encode(professor.User.SecondName + " " +
                        professor.User.FirstName[0].ToString().ToUpper() + "." +
                        professor.User.Patronymic[0].ToString().ToUpper() + ".");
       }
       else
       {
           fio = Html.Encode(professor.User.SecondName);
       } %>
<%= Html.ActionLink(fio, "Page", "Professor", new { alias = Html.Encode(professor.User.NickName) }, new { @class = "menu_lev2" })%>
<br />
<% }
   }
   catch (Exception ex)
   {
       Utility.RedirectToErrorPage("ChairMenu.ascx: catch exception", ex);
   } %>