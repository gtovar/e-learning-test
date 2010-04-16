<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <% try
       { %>
    eВМК – электронный ВМК / 
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
       { %>
    <h2>
        <%= Html.Encode(((Professor)ViewData["Professor"]).User.SecondName + " " +
        ((Professor)ViewData["Professor"]).User.FirstName + " " +
         ((Professor)ViewData["Professor"]).User.Patronymic)%>
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
        Преподаваемые дисциплины</h4>
    <table width="100%" border="1">
        <tr class="table_header">
             <th style="padding: 7px;">
                №
            </th>
            <th style="padding: 7px;">
                Дисциплина
            </th>
            <th style="padding: 7px;">
                Семестр
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
       else if(null != ViewData["SpecialityDiscipline"])
       { %>
 <h4 style="margin-top: 10px; margin-bottom: 5px;">
        <%= Html.Encode(((SpecialityDiscipline)ViewData["SpecialityDiscipline"]).Title) %></h4>
    <table width="100%" border="1">
        <tr class="table_header">
             <th style="padding: 7px;">
                №
            </th>
            <th style="padding: 7px;">
                Тема
            </th>
            <th style="padding: 7px;">
                Количество часов
            </th>
        </tr>
        <% int index = 1;
           foreach (LecturePlan lecturePlan in (IEnumerable<LecturePlan>)(((SpecialityDiscipline)ViewData["SpecialityDiscipline"]).LecturePlans))
           {                    
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
            <%= index%>
            </td>
            <td style="padding: 7px;">
            <%= Html.Encode(lecturePlan.SpecialityDisciplineTopic.Title)%>
            </td>
            <td style="padding: 7px;">
            <%= Html.Encode(lecturePlan.Volume)%>
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
