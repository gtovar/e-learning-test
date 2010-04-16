<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Линый кабинет / Кабинет преподавателя
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% try
       {
           if (null != ViewData["ProfessorSpecialityDisciplines"] && null != ViewData["Professor"])
           {
               Professor professor = (Professor)ViewData["Professor"];
    %>
    <h3 style="margin-top: 10px; margin-bottom: 5px;">
        Преподаваемые дисциплины</h3>
    <table width="100%" border="1">
        <tr class="table_header">
            <th style="padding: 7px; width: 30px;">
                №
            </th>
            <th style="padding: 7px;">
                Дисциплина
            </th>
            <th style="padding: 7px; width: 100px">
                Семестр
            </th>
            <th style="padding: 7px; width: 100px">
                Подробнее
            </th>
        </tr>
        <% int index = 1;
           foreach (SpecialityDiscipline specialityDiscipline in (IEnumerable<SpecialityDiscipline>)ViewData["ProfessorSpecialityDisciplines"])
           {                    
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= index%>
            </td>
            <td style="padding: 7px;">
                <%= Html.ActionLink(Html.Encode(specialityDiscipline.Title), "Professor", "Cabinet", new { alias = professor.User.NickName, additional = specialityDiscipline.Alias}, new { @class = "" })%>
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
            <td style="padding: 7px;">
                <%= Html.ActionLink("Подробнее", "Professor", "Cabinet", new { alias = "Detailed", additional = specialityDiscipline.Alias }, new { @class = "" } ) %>
            </td>
        </tr>
        <% index++;
           } %>
    </table>
    <% }
           else if (null != ViewData["SpecialityDiscipline"] && null != ViewData["Professor"])
           {
               Professor professor = (Professor)ViewData["Professor"];
               SpecialityDiscipline specialityDiscipline = (SpecialityDiscipline)ViewData["SpecialityDiscipline"];
               if (null != ViewData["SpecialityDisciplineTopics"])
               {
                   bool hasLectures = false;
                   bool hasPractices = false;
                   if (null != specialityDiscipline.SpecialityDisciplineTerms &&
                      specialityDiscipline.SpecialityDisciplineTerms.Count > 0)
                   {
                       foreach (SpecialityDisciplineTerm specialityDisciplineTerm in specialityDiscipline.SpecialityDisciplineTerms)
                       {
                           if (null != specialityDiscipline.SpecialityDisciplineTopics &&
                               specialityDiscipline.SpecialityDisciplineTopics.Count > 0)
                           {

                               if (0 != specialityDisciplineTerm.LectureVolume && 
                                   null != specialityDiscipline.LecturePlans &&
                                   specialityDiscipline.LecturePlans.Count > 0)
                               {
                                   hasLectures = true;
                               }
                               if (0 != specialityDisciplineTerm.PracticeVolume &&
                                   null != specialityDiscipline.PracticePlans &&
                                   specialityDiscipline.PracticePlans.Count > 0)
                               {
                                   hasPractices = true;
                               }
                           }
                       }
                   }
    %>
    <h3 style="margin-top: 10px; margin-bottom: 5px;">
        <span style="float: left; margin-bottom: 5px;">
            <%= Html.Encode(specialityDiscipline.Title) %>
        </span><span style="float: right; margin-bottom: 5px;">
            <% if (hasLectures)
               { %>
            <%= Html.ActionLink("План лекций", "LecturePlan", "Cabinet", new { alias = professor.User.NickName, additional = specialityDiscipline.Alias }, new { @style = "font-size: 14px" })%>
            <% } %>
            <% if (hasPractices)
               { %>
            &nbsp;&nbsp;
            <%= Html.ActionLink("План практик", "PracticePlan", "Cabinet", new { alias = professor.User.NickName, additional = specialityDiscipline.Alias }, new { @style = "font-size: 14px" })%>
            <% } %>
        </span>
    </h3>
    <% if (hasLectures)
       {
           foreach (LecturePlan lecturePlan in specialityDiscipline.LecturePlans)
           {
               if (!lecturePlan.Date.HasValue)
               { %>
    <div style="font-size: 15px; color: Red; text-align: center; margin: 10px;">
        Замечание: Не полностью заполнен
        <%= Html.ActionLink("план лекционных занятий", "LecturePlan", "Cabinet", new { alias = professor.User.NickName, additional = specialityDiscipline.Alias }, new { @style = "color: red; text-decoration: underline" })%></div>
    <%          break;
               }
           }
       }%>
    <% 
        if (hasPractices)
        {
            foreach (PracticePlan practicePlan in specialityDiscipline.PracticePlans)
            {
                if (!practicePlan.Date.HasValue)
                { %>
    <div style="font-size: 15px; color: Red; text-align: center; margin: 10px;">
        Замечание: Не полностью заполнен
        <%= Html.ActionLink("план практических занятий", "PracticePlan", "Cabinet", new { alias = professor.User.NickName, additional = specialityDiscipline.Alias }, new { @style = "color: red; text-decoration: underline" })%></div>
    <%          break;
                }
            }
        } %>
    <table width="100%" border="1">
        <tr class="table_header">
            <th style="padding: 7px; width: 30px">
                №
            </th>
            <th style="padding: 7px;">
                Тема
            </th>
            <th style="padding: 7px; width: 150px">
                Тестирование
            </th>
        </tr>
        <% int index = 1;
           foreach (LecturePlan lecturePlan in (IEnumerable<LecturePlan>)specialityDiscipline.LecturePlans)
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
                <%= Html.ActionLink("Тестирование", "")%>
            </td>
        </tr>
        <% index++;
           } %>
    </table>
    <%
        }

               if (null != ViewData["Detailed"])
               {
    %>
    <h3 style="margin-top: 10px; margin-bottom: 5px;">
        <%= Html.Encode(specialityDiscipline.Title) %></h3>
    <table width="100%" border="1">
        <tr class="table_header">
            <th style="padding: 7px;" rowspan="2">
                Семестр
            </th>
            <th style="padding: 7px;" colspan="3">
                Количество часов в неделю
            </th>
            <th style="padding: 7px;" rowspan="2">
                Отчетность
            </th>
        </tr>
        <tr class="table_header">
            <th style="padding: 7px;">
                Лекционных занятий
            </th>
            <th style="padding: 7px;">
                Практических занятий
            </th>
            <th style="padding: 7px;">
                Лабораторных занятий
            </th>
        </tr>
        <% int index = 1;
           foreach (SpecialityDisciplineTerm specialityDisciplineTerm in (IEnumerable<SpecialityDisciplineTerm>)specialityDiscipline.SpecialityDisciplineTerms)
           {                    
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= specialityDisciplineTerm.Term %>
            </td>
            <td style="padding: 7px;">
                <%= specialityDisciplineTerm.LectureVolume %>
            </td>
            <td style="padding: 7px;">
                <%= specialityDisciplineTerm.PracticeVolume %>
            </td>
            <td style="padding: 7px;">
                <%= specialityDisciplineTerm.LabVolume %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(specialityDisciplineTerm.Reporting) %>
            </td>
        </tr>
        <% index++;
           } %>
    </table>
    <%
        }
           }
       }
       catch (Exception ex)
       {
           Utility.RedirectToErrorPage("Cabinet.Professor: catch exception", ex);
       } %>
</asp:Content>
