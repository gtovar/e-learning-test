<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Линый кабинет / Кабинет преподавателя
</asp:Content>
<asp:Content ID="Contnet3" ContentPlaceHolderID="ScriptContent" runat="server">

    <script type="text/javascript" src="/Scripts/Calendar/js/jscal2.js"></script>

    <script type="text/javascript" src="/Scripts/Calendar/js/lang/ru.js"></script>

    <link rel="stylesheet" type="text/css" href="/Content/Calendar/css/jscal2.css" />
    <link rel="stylesheet" type="text/css" href="/Content/Calendar/css/border-radius.css" />
    <link rel="stylesheet" type="text/css" href="/Content/Calendar/css/steel/steel.css" />

    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>

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
    <% Html.BeginForm("LecturePlan", "Cabinet", FormMethod.Post); %>
    <span style="float: left; margin-bottom: 5px;">
        <h3 style="margin-bottom: 5px;">
            План лекционных занятий</h3>
        <h4 style="margin-bottom: 5px;">
            <%= Html.Encode(specialityDiscipline.Title) %></h4>
    </span>
    <%
        foreach (LecturePlan lecturePlan in specialityDiscipline.LecturePlans)
        {
            if (!lecturePlan.Date.HasValue)
            { %>
    <div style="font-size: 15px; color: Red; text-align: center;">
        Заполните даты проведения лекций по каждой теме
    </div>
    <%          break;
            }
        }
        string lecturePlanDateArray = String.Empty;
        foreach (LecturePlan lecturePlan in (IEnumerable<LecturePlan>)specialityDiscipline.LecturePlans)
        {
            lecturePlanDateArray += lecturePlan.Id + ",";
        }
        lecturePlanDateArray = lecturePlanDateArray.Trim(',', ' ');
    %>
    <input type="hidden" name="lecturePlanDateArray" id="lecturePlanDateArray" value="<%= lecturePlanDateArray %>" />
    <% if (null != ViewData["IsDatesCorrect"] && ((Boolean)ViewData["IsDatesCorrect"]))
       { %>
    <div style="font-size: 15px; color: Green; text-align: center;">
        План сохранен успешно!
    </div>
    <% }
       else if (null != ViewData["IsDatesCorrect"])
       { %>
    <div style="font-size: 15px; color: Red; text-align: center;">
        Ошибки на странице!
    </div>
    <% } %>
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
            <td style="padding-right: 3px; width: 170px">
                <input name="LecturePlanDate_<%= lecturePlan.Id %>" id="LecturePlanDate_<%= lecturePlan.Id %>"
                    value="<%= lecturePlan.Date.HasValue ? lecturePlan.Date.Value.ToString() : "" %>"
                    style="width: 140px; height: 15px; float: left; color: Black; font-size: 14px;
                    margin-top: 1px" />
                <a href="#" class="transparent_link">
                    <img class="transparent_img" style="float: left; height: 20px" src="/Content/Images/cal.gif"
                        id="LecturePlanDateBtn_<%= lecturePlan.Id %>" alt="Выбирете дату и время проведения занятия" /></a>
                <% if (null != ViewData["LecturePlanDate_" + lecturePlan.Id])
                   { %>
                <br />
                <span class="error">
                    <%= ViewData["LecturePlanDate_" + lecturePlan.Id]%></span>
                <% } %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(lecturePlan.Volume)%>
            </td>
        </tr>
        <% index++;
           } %>
    </table>

    <script type="text/javascript">//<![CDATA[
        var cal = Calendar.setup({
            onSelect: function(cal) { cal.hide() },
            showTime: true
        });
        <% foreach (LecturePlan lecturePlan in (IEnumerable<LecturePlan>)specialityDiscipline.LecturePlans)
           {   
        %>
        cal.manageFields("LecturePlanDateBtn_<%= lecturePlan.Id %>", "LecturePlanDate_<%= lecturePlan.Id %>", "%d.%m.%Y %H:%M:%S");
        <% } %>
        //]]>
    </script>

    <div style="float: right; margin-top: 10px; margin-bottom: 10px">
        <input type="submit" id="LecturePlan" name="LecturePlan" value="Сохранить" style="width: 100px;
            height: 30px;" />
    </div>
    <% Html.EndForm(); %>
    <% }
        }
        catch (Exception ex)
        {
            Utility.RedirectToErrorPage("Cabinet.LecturePlan: catch exception", ex);
        } %>
</asp:Content>
