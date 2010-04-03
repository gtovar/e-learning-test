<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Session["UserAuth"] != null && ((bool)Session["UserAuth"]) == true && Session["UserName"] != null &&
        Session["UserRole"] != null)
    {
%>
Добро пожаловать <b> <%= Html.Encode(Session["UserName"])%></b>! <br />
<% 
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
%>
[ <%= Html.ActionLink("Кабинет " + title, (string)Session["UserRole"], "Cabinet")%> ]
<% } %>
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
%>
