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
    <h2 style="margin-top: 5px; margin-bottom: 10px;">
        Преподаваемые дисциплины
    </h2>
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
            <td style="padding: 7px;  text-align: left; font-size: 15px">
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
               if (null != ViewData["SpecialityDisciplineTopics"] && null != ViewData["LecturePlans"])
               {
    %>
    <h2 style="margin-top: 5px; margin-bottom: 10px;">
            <%= Html.Encode(specialityDiscipline.Title) %>
    </h2>
    <% if (null != ViewData["LecturePlanSavingHasErrors"] && ((Boolean)ViewData["LecturePlanSavingHasErrors"]))
       { %>
        <div style="text-align: center; color:Red; font-size: 16px; margin: 10px">
            <%= ViewData["LecturePlanErrorMessage"]%>
        </div>
    <% }
       else if (null != ViewData["LecturePlanSavingHasErrors"] && !((Boolean)ViewData["LecturePlanSavingHasErrors"]))
       { %>
            <div style="text-align: center; color:Green; font-size: 16px; margin: 10px">
                Лекционный план сохранен успешно!
            </div>
     <%} %>
    <% Html.BeginForm("Professor", "Cabinet", FormMethod.Post, new { @name = "LectionPlanForm", @id="LectionPlanForm" } ); %>
    <table width="100%" border="1">
        <tr class="table_header">
            <th style="padding: 7px; width: 30px">
                №
            </th>
            <th style="padding: 7px;">
                Тема
            </th>
            <th style="padding: 7px;">
                Дата
            </th>
            <th style="padding: 7px;">
                Время
            </th>
            <th style="padding: 7px;">
                Аудитория
            </th>
            <th style="padding: 7px; width: 150px">
                Тестирование
            </th>
        </tr>
        <% 
            string time = String.Empty;
            string room = String.Empty;
            string building = String.Empty;
            foreach (LectureTimetable timetable in specialityDiscipline.LectureTimetables)
            {
                if (timetable.SpecialityDisciplineId == specialityDiscipline.Id &&
                    professor.UserId == timetable.ProfessorId)
                {
                    time = timetable.Time;
                    room = timetable.Room.ToString();
                    building = timetable.Building.ToString();
                    break;
                }
            }
                   
           int index = 1;
           string lectionPlanIds = String.Empty;
           foreach (LecturePlan plan in (IEnumerable<LecturePlan>)ViewData["LecturePlans"])
           {
               lectionPlanIds += plan.Id + ",";
        %>
        <tr class="table_row">
            <td style="padding: 7px; width:40px">
                <%= index%>
            </td>
            <td style="padding: 7px;">
                <div style="color: Red; font-size: 13px; text-align: left"><%= ViewData["LectionPlan" + plan.Id + "Error"] %></div>
                <input type="text" style="width:100%; height:20px; font-size: 15px" name="LectionPlanId_<%= plan.Id %>" id="LectionPlanId_<%= plan.Id %>" value="<%= null != ViewData["LecturePlanSavingHasErrors"] && ((Boolean)ViewData["LecturePlanSavingHasErrors"]) ? Html.Encode(ViewData["LectionPlanId_" + plan.Id]) : Html.Encode(plan.SpecialityDisciplineTopic.Title)%>" />
            </td>
            <td style="padding: 7px; width:60px">
                <%= plan.Date.HasValue ? plan.Date.Value.ToShortDateString() : String.Empty %>
            </td>
            <td style="padding: 7px; width:60px">
                <%= time %>
            </td>
            <td style="padding: 7px; width:60px">
                <%= room %>&nbsp;(<%= building%>)
            </td>
            <td style="padding: 7px; width:80px">
                <%= Html.ActionLink("Тестирование", "Index", "Testing", new { alias = plan.SpecialityDisciplineTopic.Id }, new { @class = "" })%>
            </td>
        </tr>
        <% index++;
           }
           lectionPlanIds = lectionPlanIds.Trim(',', ' '); 
           %>
    </table>
    <input type="submit" style="width: 100px; height: 30px; margin-top: 15px; float: right" name="SaveLecturePlans" id="SaveLecturePlans" value="Сохранить" />
    <input type="hidden" value="<%= lectionPlanIds %>" name="LectionPlanIds" id="LectionPlanIds" />
    <% Html.EndForm(); %>
    <%
        }
               if (null != ViewData["Detailed"])
               {
    %>
    <h2 style="margin-top: 5px; margin-bottom: 10px;">
        <%= Html.Encode(specialityDiscipline.Title) %>
    </h2>
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
