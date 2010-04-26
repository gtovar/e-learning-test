<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    try
    {
        if (Session["UserAuth"] != null && ((bool)Session["UserAuth"]) == true && Session["UserName"] != null &&
            Session["User"] != null)
        {
%>
Добро пожаловать <b>
    <%= Html.Encode(Session["UserName"])%></b>!
<br />
[
<%= Html.ActionLink("Настройки аккаунта", "AccountSettings", "Cabinet", new { alias = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName }, new { @class = "" })%>
] [
<%= Html.ActionLink("Сменить пароль", "ChangePassword", "Cabinet", new { alias = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName }, new { @class = "" })%>
]
<br />
<%
    VmkLearningKit.Models.Domain.User user = (VmkLearningKit.Models.Domain.User)Session["user"];
    if (user.IsAdmin)
    {
%>
[
<%= Html.ActionLink("Личный кабинет", "Admin", "Cabinet", new { alias = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName, additional = String.Empty }, new { @class = "" })%>
]
<%
    }
             else if (user.IsMetodist)
             {
%>
[
<%= Html.ActionLink("Личный кабинет", "Metodist", "Cabinet", new { alias = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName, additional = String.Empty }, new { @class = "" })%>
]
<%
    }
             else if (user.IsProfessor)
             {
%>
[
<%= Html.ActionLink("Личный кабинет", "Professor", "Cabinet", new { alias = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName, additional = String.Empty }, new { @class = "" })%>
]
<%
    }
             else if (user.IsStudent)
             {
%>
[
<%= Html.ActionLink("Личный кабинет", "Student", "Cabinet", new { alias = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName, additional = String.Empty }, new { @class = "" })%>
]
<%
    }
%>
[
<%= Html.ActionLink("Выйти", "LogOff", "Auth")%>
]
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
