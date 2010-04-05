<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%= Html.ActionLink("О факультете", "About", "Home", new {alias = "", additional = ""}, new { @class = "menu_lev1" })%><br />
<%= Html.ActionLink("Специальности", "Specialities", "Home", new { alias = "", additional = "" }, new { @class = "menu_lev1" })%><br />
<% if (null != ViewData["Specialities"])
   { %>
<% 
    try
    {
        foreach (Speciality speciality in (IEnumerable<Speciality>)ViewData["Specialities"])
        { %>
<%= Html.ActionLink(speciality.Abbreviation, "Specialities", "Home", new { alias = Html.Encode(speciality.Alias), additional = "" }, new { @class = "menu_lev2" })%>
<br />
<% }
    }
    catch (Exception ex)
    {
        Utility.RedirectToErrorPage("GeneralMenu.ascx: catch exception", ex);
    }%>
<% } %>
<%/*= Html.ActionLink("Кафедры", "Chairs", "Home", new {id = ""}, new { @class = "menu_lev1" })*/%>
<% if (null != ViewData["Chairs"])
   { %>
<% try
   {
       %>
       <span class="menu_lev1">Кафедры</span>
       <%
       foreach (Chair chair in (IEnumerable<Chair>)ViewData["Chairs"])
       { %>
<%= Html.ActionLink(chair.Abbreviation, "Chairs", "Home", new { alias = Html.Encode(chair.Alias), additional = "" }, new { @class = "menu_lev2" })%>
<br />
<% }
   }
   catch (Exception ex)
   {
       Utility.RedirectToErrorPage("GeneralMenu.ascx: catch exception", ex);
   }%>
<% } %>