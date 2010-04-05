<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	e��� � ����������� ��� / ����� �������
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<p style="font-size:14px">
    ������ ���� <b><% if (Session["UserName"] != null)
                   {%><%= Session["UserName"]%><% } %>,</b><br /><br />
    �� ���������� � ������ ��������.<br /><br />
    ����� �� ������ ��������� ����������� ������ ��������, � ����� ���������� ����������� �������
    � ����������� �� ����� ����.<br /><br />
    �� �������� ��������� ���������:<br /><br />
    <% try
       { %>
    <ul style="margin-left:20px:">
        <li><%= Html.ActionLink("�������� ��������", "AccountSettings", "Cabinet") %></li><br />
        <% if (null != Session["User"] && ((VmkLearningKit.Models.Domain.User)Session["User"]).IsStudent)
           { %>
        <li><%= Html.ActionLink("������� ��������", "Student", "Cabinet") %></li><br />
           <% } %>
        <% if (null != Session["User"] && ((VmkLearningKit.Models.Domain.User)Session["User"]).IsMetodist)
           { %> 
        <li><%= Html.ActionLink("������� ���������", "Metodist", "Cabinet") %></li><br />
           <% } %>
        <% if (null != Session["User"] && ((VmkLearningKit.Models.Domain.User)Session["User"]).IsProfessor)
           { %>
        <li><%= Html.ActionLink("������� �������������", "Professor", "Cabinet") %></li><br />
           <% } %>
        <% if (null != Session["User"] && ((VmkLearningKit.Models.Domain.User)Session["User"]).IsAdmin)
           { %>
        <li><%= Html.ActionLink("������� ���������������", "Admin", "Cabinet") %></li><br />
           <% } %>
    </ul>
    <%}
       catch (Exception ex)
       {
           Utility.RedirectToErrorPage("CabinetController.Menu: catch exception", ex);
       } %>
</p>
</asp:Content>
