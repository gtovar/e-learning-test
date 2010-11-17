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
        <%= ((Chair)ViewData["Chair"]).Description %>
    </div>
    <% }
       else if (null != ViewData["Action"] || ViewData["Action"].ToString().Trim().Equals("Professors"))
       {%>
    <h4 style="margin-top: 10px; margin-bottom: 5px;">
        Преподаватели кафедры</h4>
    <table width="100%" border="1">
        <tr class="table_header">
            <th style="padding: 7px;">
                №
            </th>
            <th style="padding: 7px;">
                ФИО
            </th>
            <th style="padding: 7px;">
                Лекции / Практики
            </th>
            <th style="padding: 7px;">
                Научная степень
            </th>
            <th style="padding: 7px;">
                Должность
            </th>
        </tr>
        <% 
            int i = 1;
            Chair chair = (Chair)ViewData["Chair"];
            if (null != chair)
            {
                foreach (Professor professor in (IEnumerable<Professor>)RepositoryManager.GetRepositoryManager.GetProfessorRepository.GetAll(chair.Alias))
                {                    
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= i%>
            </td>
            <td style="padding: 7px;">
            <% string fio = String.Empty;
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
            <%= Html.ActionLink(fio, "Page", "Professor", new { alias = Html.Encode(professor.User.NickName) }, new { @class = "" })%>
            </td>
            <td style="padding: 7px;">
                <%
int index = 0;

                    IEnumerable<SpecialityDiscipline> specialityDisciplines = RepositoryManager.GetRepositoryManager.GetSpecialityDisciplineRepository.GetAllByProfessor(professor.User.NickName);
                    if (null != specialityDisciplines)
                    {
                        foreach (SpecialityDiscipline specialityDiscipline in specialityDisciplines)
                        {
    %>
                <%= Html.Encode(specialityDiscipline.Title)%><br />
                <% if (index < (specialityDisciplines.Count()) - 1)
                   { %>
                <hr style="margin: 5px;" />
                <% } index++; %>
                <% }
                    }%>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(professor.Degree)%>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(professor.Position)%>
            </td>
        </tr>
        <% i++;
                }
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
