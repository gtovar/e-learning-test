<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
using (Html.BeginForm("EditTopic", "Cabinet", new { alias = Convert.ToInt64(ViewData["TopicId"]) }, FormMethod.Post, new { id = "RazdelForm", name = "RazdelForm" }))
{
	%>
	<table class="Editor" style="width:100%;">
        <tr class="Editor">
			<td class="Editor" style="width:20%">
            <label for="Title">Новое название:</label>
            </td>
            <td class="Editor" style="width:80%">
            <%= Html.TextBox("Title", "", new { style = "width:100%" })%>
            </td>
        </tr>
    </table>
    <%
}
%>
