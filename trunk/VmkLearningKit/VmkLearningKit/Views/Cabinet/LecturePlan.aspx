<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Линый кабинет / Кабинет преподавателя
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
        try
        {
            if (null != ViewData["Professor"] && null != ViewData["SpecialityDiscipline"])
            {
                SpecialityDiscipline specialityDiscipline = (SpecialityDiscipline)ViewData["SpecialityDiscipline"];
                Professor professor = (Professor)ViewData["Professor"];
    %>
    <% using (Html.BeginForm("LecturePlan", "Cabinet", FormMethod.Post))
       {%>
    <span style="float: left; margin-bottom: 5px;">
        <h3 style="margin-bottom: 5px;"> План лекционных занятий</h3>
            <h4 style="margin-bottom: 5px;"><%= Html.Encode(specialityDiscipline.Title) %></h4>
    </span>
    <div style="font-size: 15px; color: Red; text-align: center;">
        Заполните даты проведения лекций по каждой теме
    </div>
    <table width="100%" border="1">
        <tr class="table_header">
            <th style="padding: 7px; width: 30px">
                №
            </th>
            <th style="padding: 7px;">
                Тема
            </th>
            <th style="padding: 7px;">
                Дата проведения
            </th>
            <th style="padding: 7px; width: 150px">
                Количество часов
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
            <td style="padding-right: 3px; width: 150px">
                <% if (lecturePlan.Date.HasValue)
                   {%>
                <input type="text" id="LecturePlanDate_<%= lecturePlan.Id %>" name="LecturePlanDate_<%= lecturePlan.Id %>"
                    value="<%= lecturePlan.Date.Value.ToShortDateString() %>" style="width: 100%; height: 30px; font-size: 15px;" />
                <% }
                   else
                   { %>
                <input type="text" id="LecturePlanDate_<%= lecturePlan.Id %>" name="LecturePlanDate_<%= lecturePlan.Id %>" value=""
                    style="width: 100%; height: 30px; font-size: 15px; border-color: Red" />
                <% } %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(lecturePlan.Volume)%>
            </td>
        </tr>
        <% index++;
           } %>
    </table>
    <div style="float: right; margin-top: 10px; margin-bottom: 10px">
        <input type="submit" id="LecturePlan" name="LecturePlan" value="Сохранить" style="width: 100px;
            height: 30px;" />
    </div>
    <% }
            }
        }
        catch (Exception ex)
        {
            Utility.RedirectToErrorPage("Cabinet.LecturePlan: catch exception", ex);
        } %>
</asp:Content>
