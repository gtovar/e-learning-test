<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК /
    <%= ViewData["PageTitle"] %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
        try
        {
            if (null != ViewData["Chair"])
            {%>
    <h2>
        <%= ((Chair)ViewData["Chair"]).Title%></h2>
    <% if (null == ViewData["Action"] || ViewData["Action"].ToString().Trim().Equals(String.Empty) || ViewData["Action"].ToString().Equals("About"))
       { %>
    <div class="description">
        <%= Html.Encode(((Chair)ViewData["Chair"]).Description) %>
    </div>
    <% }
       else if (null != ViewData["Action"] || ViewData["Action"].ToString().Trim().Equals("Professors"))
       {%>
    <h4 style="margin-top: 10px; margin-bottom: 5px;">
        Преподаватели кафедры</h4>
    <table width="100%" border="1">
        <tr class="table_header">
            <th>
                №
            </th>
            <th>
                ФИО
            </th>
            <th>
                Лекции / Практики
            </th>
            <th>
                Научная степень
            </th>
            <th>
                Должность
            </th>
        </tr>
        <% 
            int i = 1;
            foreach (Professor professor in (IEnumerable<Professor>)((Chair)ViewData["Chair"]).Professors)
            {                    
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= i %>
            </td>
            <td style="padding: 7px;">
                <%= Html.ActionLink(Html.Encode(professor.User.SecondName + " " +
                professor.User.FirstName + " " +
                professor.User.Patronymic), "Page", "Professor", new { alias = Html.Encode(professor.User.NickName) }, new { @class = "" })%>
            </td>
            <td style="padding: 7px;">
                <%
                    int index = 0;
                    foreach (SpecialityDiscipline specialityDiscipline in (IEnumerable<SpecialityDiscipline>)professor.SpecialityDisciplines)
                    {                    
                %>
                <%= Html.Encode(specialityDiscipline.Title) %><br />
                <% if (index < (((IEnumerable<SpecialityDiscipline>)professor.SpecialityDisciplines).Count()) - 1)
                   { %>
                <hr style="margin: 5px;" />
                <% } index++; %>
                <% } %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(professor.Degree) %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(professor.Position) %>
            </td>
        </tr>
        <% i++;
            } %>
    </table>
    <%
        }
            }
            else
            {
                Utility.RedirectToErrorPage("Chairs.aspx: null = ViewData[\"Chair\"]");
            }
        }
        catch (Exception ex)
        {
            Utility.RedirectToErrorPage("Chairs.aspx: catch exception", ex);
        } %>
</asp:Content>
