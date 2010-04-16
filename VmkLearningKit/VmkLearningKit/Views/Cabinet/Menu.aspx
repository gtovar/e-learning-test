<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	eВМК – электронный ВМК / Линый кабинет
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
    if (null != Session["User"])
    {
        VmkLearningKit.Models.Domain.User user = ((VmkLearningKit.Models.Domain.User)Session["User"]);
        if(user.IsStudent)
        {
            Response.Redirect("/Cabinet/Student/" + user.DbUser.NickName);
        }
        else if (user.IsProfessor)
        {
            Response.Redirect("/Cabinet/Professor/" + user.DbUser.NickName);
        }
        else if (user.IsMetodist)
        {
            Response.Redirect("/Cabinet/Metodist/" + user.DbUser.NickName);
        }
        else if (user.IsAdmin)
        {
            Response.Redirect("/Cabinet/Admin/" + user.DbUser.NickName);
        }
    }
    else
    {
        Utility.RedirectToErrorPage("User doesn't have access to the page");
    }
%>
</asp:Content>
