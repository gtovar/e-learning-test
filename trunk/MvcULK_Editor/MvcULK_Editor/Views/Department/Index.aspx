<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcULK_Editor.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%= ViewData["Title"] %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%= ViewData["Title"] %></h2>
    <table>
        <tr>
            <td>Факультет</td>
        </tr>
        <% foreach(department _department in (IEnumerable<department>)ViewData["Departments"]) 
           { %>
        <tr>
            <td>
            <%= _department.title %>
            </td>
        </tr>
        <% } %>
    </table>

</asp:Content>
