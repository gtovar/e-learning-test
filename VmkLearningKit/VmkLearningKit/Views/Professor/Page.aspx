<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <% try
       { 
    %>
    e��� � ����������� ��� /
    <%= Html.Encode(((Professor)ViewData["Professor"]).Chair.Title)%>
    /
    <%= Html.Encode(((Professor)ViewData["Professor"]).User.SecondName + " " +
        ((Professor)ViewData["Professor"]).User.FirstName + " " +
         ((Professor)ViewData["Professor"]).User.Patronymic)%>
    <% }
       catch (Exception ex)
       {
           Utility.RedirectToErrorPage("ProfessorController.Page.aspx: ViewData[\"Professor\"] isn't valid", ex);
       }    %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% try
       {
           Professor professor = (Professor)ViewData["Professor"];
           %>
    <h2>
        <% string fio = String.Empty;
           if (!professor.User.FirstName.Trim().Equals(String.Empty) &&
               !professor.User.Patronymic.Trim().Equals(String.Empty))
           {
               /*fio = Html.Encode(professor.User.SecondName + " " +
                            professor.User.FirstName[0].ToString().ToUpper() + "." +
                            professor.User.Patronymic[0].ToString().ToUpper() + ".");
               */
               fio = Html.Encode(professor.User.SecondName + " " +
                            professor.User.FirstName + " " +
                            professor.User.Patronymic);
           }
           else
           {
               fio = Html.Encode(professor.User.SecondName);
           } %>
        <%= fio %>
    </h2>
    <% if (null == ViewData["Action"] || ViewData["Action"].ToString().Trim().Equals("About"))
       {%>
    <div class="description">
        <%= Html.Encode(((Professor)ViewData["Professor"]).About)%>
    </div>
    <% }
       else if (ViewData["Action"].ToString().Trim().Equals("Disciplines"))
       { %>
    <h4 style="margin-top: 10px; margin-bottom: 5px;">
        ������������� ����������</h4>
    <table width="100%" border="1">
        <tr class="table_header">
            <th style="padding: 7px;">
                �
            </th>
            <th style="padding: 7px;">
                ����������
            </th>
            <th style="padding: 7px;">
                �������
            </th>
        </tr>
        <% int index = 1;
           foreach (SpecialityDiscipline specialityDiscipline in (IEnumerable<SpecialityDiscipline>)(((Professor)ViewData["Professor"]).SpecialityDisciplines))
           {                    
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= index%>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(specialityDiscipline.Title)%>
            </td>
            <% string term = String.Empty;
               foreach (SpecialityDisciplineTerm specialityDisciplineTerm in (IEnumerable<SpecialityDisciplineTerm>)specialityDiscipline.SpecialityDisciplineTerms)
               {
                   term += specialityDisciplineTerm.Term + ", ";
               }
            %>
            <td style="padding: 7px;">
                <%= term.Trim(',', ' ')%>
            </td>
        </tr>
        <% index++;
           } %>
    </table>
    <% }
       else if (null != ViewData["SpecialityDiscipline"])
       { %>
    <h4 style="margin-top: 10px; margin-bottom: 5px;">
        <%= Html.Encode(((SpecialityDiscipline)ViewData["SpecialityDiscipline"]).Title) %></h4>
    <table width="100%" border="1">
        <tr class="table_header">
            <th style="padding: 7px;">
                �
            </th>
            <th style="padding: 7px; text-align: left">
                ����
            </th>
        </tr>
        <% int index = 1;
           foreach (SpecialityDisciplineTopic specialityDisciplineTopic in (IEnumerable<SpecialityDisciplineTopic>)(((SpecialityDiscipline)ViewData["SpecialityDiscipline"]).SpecialityDisciplineTopics))
           {                    
        %>
        <tr class="table_row">
            <td style="padding: 7px">
                <%= index%>
            </td>
            <td style="padding: 7px; text-align: left">
                <%= Html.Encode(specialityDisciplineTopic.Title)%>
            </td>
        </tr>
        <% index++;
           } %>
    </table>
    <% }
       }
       catch (Exception ex)
       {
           Utility.RedirectToErrorPage("ProfessorController.Page.aspx: ViewData[\"Professor\"] isn't valid", ex);
       }    %>
</asp:Content>
