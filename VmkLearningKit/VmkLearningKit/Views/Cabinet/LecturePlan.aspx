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
    <% Html.BeginForm("LecturePlan", "Cabinet", FormMethod.Post, new { name = "LecturePlanForm", id = "LecturePlanForm" }); %>
    <table width="100%">
        <tr style="padding-bottom: 5px;">
            <td>
                <h3 style="margin-bottom: 5px;">
                    План лекционных занятий
                </h3>
                <h4 style="margin-bottom: 5px;">
                    <%= Html.ActionLink(Html.Encode(specialityDiscipline.Title), "Professor", "Cabinet", new { alias = professor.User.NickName, additional = specialityDiscipline.Alias }, new { @class = "" } ) %>
                </h4>
            </td>
            <%
                foreach (LecturePlan lecturePlan in specialityDiscipline.LecturePlans)
                {
                    if (!lecturePlan.Date.HasValue && null == ViewData["AreDatesCorrect"])
                    { %>
            <td style="font-size: 15px; color: Red; text-align: center;">
                Заполните даты проведения практик по каждой теме
            </td>
            <%          break;
            }
        }
        if (null != ViewData["AreDatesCorrect"] && ((Boolean)ViewData["AreDatesCorrect"]))
        { %>
            <td style="font-size: 15px; color: Green; text-align: center;">
                План сохранен успешно!
            </td>
            <% }
       else if (null != ViewData["AreDatesCorrect"])
       { %>
            <td style="font-size: 15px; color: Red; text-align: center;">
                Ошибки при заполнении плана!
            </td>
            <% } %>
        </tr>
    </table>
    <%
        string planDateArray = String.Empty;
        foreach (PracticePlan practicePlan in (IEnumerable<PracticePlan>)specialityDiscipline.PracticePlans)
        {
            planDateArray += practicePlan.Id + ",";
        }
        planDateArray = planDateArray.Trim(',', ' ');
    %>
    <input type="hidden" name="planDateArray" id="planDateArray" value="<%= planDateArray %>" />
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
                <input name="planDate_<%= lecturePlan.Id %>" id="planDate_<%= lecturePlan.Id %>"
                    value="<%= lecturePlan.Date.HasValue ? lecturePlan.Date.Value.ToString() : "" %>"
                    style="width: 140px; height: 15px; float: left; color: Black; font-size: 14px;
                    margin-top: 1px" />
                <a href="#" class="transparent_link">
                    <img class="transparent_img" style="float: left; height: 20px" src="/Content/Images/cal.gif"
                        id="planDateBtn_<%= lecturePlan.Id %>" alt="Выбирете дату и время проведения занятия" /></a>
                <% if (null != ViewData["planDate_" + lecturePlan.Id])
                   { %>
                <br />
                <span class="error">
                    <%= ViewData["planDate_" + lecturePlan.Id]%></span>
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
        cal.manageFields("planDateBtn_<%= lecturePlan.Id %>", "planDate_<%= lecturePlan.Id %>", "%d.%m.%Y %H:%M:%S");
        <% } %>
        //]]>
    </script>

    <div style="float: right; margin-top: 10px; margin-bottom: 10px">
        <input type="submit" id="LecturePlanSubmit" name="LecturePlanSubmit" value="Сохранить" style="width: 100px;
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
