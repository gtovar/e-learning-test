<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    try
    {
        if (Session["UserAuth"] != null && ((bool)Session["UserAuth"]) == true && Session["UserName"] != null &&
            Session["User"] != null)
        {
%>
Добро пожаловать <b> <%= Html.Encode(Session["UserName"])%></b>! <br />
<% /*
        string title = null;
        switch (((string)Session["UserRole"]))
        {
            case "Admin":
                title = "администратора";
                break;
            case "Metodist":
                title = "методиста";
                break;
            case "Professor":
                title = "преподавателя";
                break;
            case "Student":
                title = "студента";
                break;
        }
        if (title != null)
        {
    */
%>
[ <%= Html.ActionLink(/*"Кабинет " + title*/ "Личный кабинет", "Menu", "Cabinet", new { alias = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName }, new { @class = "" })%> ]
<% // } %>
[ <%= Html.ActionLink("Выйти", "LogOff", "Auth")%> ]
<%
    }
        else
        {
%>
[
<%= Html.ActionLink("Войти", "LogOn", "Auth")%>
]
<%
    }
    }
    catch (Exception ex)
    {
        Utility.RedirectToErrorPage("LogOnUserControl.ascx: catch exception", ex);   
    }
%>
