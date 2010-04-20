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
            if (null != ViewData["Professor"] && null != ViewData["SpecialityDiscipline"] &&
                null != ViewData["Group"] && null != ViewData["Groups"])
            {
                VmkLearningKit.Models.Repository.Group group = (VmkLearningKit.Models.Repository.Group)ViewData["Group"];
                SpecialityDiscipline specialityDiscipline = (SpecialityDiscipline)ViewData["SpecialityDiscipline"];
                Professor professor = (Professor)ViewData["Professor"];
    %>
    <% Html.BeginForm("PracticePlan", "Cabinet", FormMethod.Post, new { name = "PracticePlanForm", id = "PracticePlanForm" }); %>
    <table width="100%">
        <tr style="padding-bottom: 5px;">
            <td>
                <h3 style="margin-bottom: 5px;">
                    План практических занятий
                </h3>
                <h4 style="margin-bottom: 5px;">
                    <%= Html.ActionLink(Html.Encode(specialityDiscipline.Title), "Professor", "Cabinet", new { alias = professor.User.NickName, additional = specialityDiscipline.Alias }, new { @class = "" } )%>
                </h4>
            </td>
            <td>
                <%
                    foreach (PracticePlan practicePlan in (IEnumerable<PracticePlan>)ViewData["GroupPracticePlans"])
                {
                    if (!practicePlan.Date.HasValue && null == ViewData["AreDatesCorrect"])
                    { %>
                        <div style="font-size: 15px; color: Red; text-align: center;">
                            Заполните даты проведения практик по каждой теме
                        </div>
                     <% break;
                    }
                }
                if (null != ViewData["AreDatesCorrect"] && ((Boolean)ViewData["AreDatesCorrect"]))
                { %>
                        <div style="font-size: 15px; color: Green; text-align: center;">
                            План сохранен успешно!
                        </div>
             <% }
                else if (null != ViewData["AreDatesCorrect"])
                { %>
                        <div style="font-size: 15px; color: Red; text-align: center;">
                            Ошибки при заполнении плана!
                        </div>
                        <% }
                if (null != ViewData["AssignedPracticePlanResult"] && !((Boolean)ViewData["AssignedPracticePlanResult"]))
                {%>
                        <div style="font-size: 15px; color: Red; text-align: center;">
                            Практические занятия назначены не полностью
                        </div>
                        <% }
                else if (null != ViewData["AssignedPracticePlanResult"])
                { %>
                        <div style="font-size: 15px; color: Green; text-align: center;">
                            Практические занятия назначены успешно!
                        </div>
             <% }
                if (null != ViewData["RemovePracticePlanResult"] && !((Boolean)ViewData["RemovePracticePlanResult"]))
                {%>
                        <div style="font-size: 15px; color: Red; text-align: center;">
                            Практические занятия удалены не полностью
                        </div>
                        <% }
                else if (null != ViewData["RemovePracticePlanResult"])
                { %>
                        <div style="font-size: 15px; color: Green; text-align: center;">
                            Практические занятия удалены успешно!
                        </div>
             <% } %>
            </td>
        </tr>
        <tr>
            <td style="padding-bottom: 10px;">
                Группа: &nbsp;&nbsp;
                <select id="Groups" name="Groups" onchange="SubmitPage('GroupFilter')">
                    <%
                        foreach (VmkLearningKit.Models.Repository.Group groupItem in (IEnumerable<VmkLearningKit.Models.Repository.Group>)ViewData["Groups"])
                        { %>
                    <option value="<%=Html.Encode(groupItem.Id) %>" <% if(groupItem.Id == group.Id) { %>
                        selected="true" <% } %>>
                        <%=Html.Encode(groupItem.Title)%>
                    </option>
                    <%} %>
                </select>
                <% 
                    if (null != ViewData["IsPracticePlanAssigned"] && !((Boolean)ViewData["IsPracticePlanAssigned"]))
                    { %>
                <button name="AssignPracticePlanToGroup" id="AssignPracticePlanToGroup" onclick="SubmitPage('AssignPracticePlanToGroup')"
                    style="width: 150px; height: 25px">
                    Назначить практику
                </button>
                  <%}
                    else if (null != ViewData["IsPracticePlanAssigned"] && ((Boolean)ViewData["IsPracticePlanAssigned"]))
                    {%>
                <button name="RemovePracticePlanFromGroup" id="RemovePracticePlanFromGroup" onclick="SubmitPage('RemovePracticePlanFromGroup')"
                    style="width: 150px; height: 25px">
                    Убрать практику
                </button>
                  <%} %>
            </td>
        </tr>
    </table>
    <%
        string planDateArray = String.Empty;
        bool isPlanForGroupExisted = false;
        foreach (PracticePlan practicePlan in (IEnumerable<PracticePlan>)ViewData["GroupPracticePlans"])
        {
            planDateArray += practicePlan.Id + ",";
        }
        planDateArray = planDateArray.Trim(',', ' ');
        if (!planDateArray.Equals(String.Empty))
        {
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
           foreach (PracticePlan practicePlan in (IEnumerable<PracticePlan>)ViewData["GroupPracticePlans"])
           {
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= index%>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(practicePlan.SpecialityDisciplineTopic.Title)%>
            </td>
            <td style="padding-right: 3px; width: 170px">
                <input name="planDate_<%= practicePlan.Id %>" id="planDate_<%= practicePlan.Id %>"
                    value="<%= practicePlan.Date.HasValue ? practicePlan.Date.Value.ToString() : "" %>"
                    style="width: 140px; height: 15px; float: left; color: Black; font-size: 14px;
                    margin-top: 1px" />
                <a href="#" class="transparent_link">
                    <img class="transparent_img" style="float: left; height: 20px" src="/Content/Images/cal.gif"
                        id="planDateBtn_<%= practicePlan.Id %>" alt="Выбирете дату и время проведения занятия" /></a>
                <% if (null != ViewData["planDate_" + practicePlan.Id])
                   { %>
                <br />
                <span class="error">
                    <%= ViewData["planDate_" + practicePlan.Id]%></span>
                <% } %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(practicePlan.Volume)%>
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
        <% foreach (PracticePlan practicePlan in (IEnumerable<PracticePlan>)specialityDiscipline.PracticePlans)
           {   
                if (practicePlan.GroupId == group.Id)
                {
        %>
                    cal.manageFields("planDateBtn_<%= practicePlan.Id %>", "planDate_<%= practicePlan.Id %>", "%d.%m.%Y %H:%M:%S");
        <%      } 
           }%>
        //]]>
    </script>

    <div style="float: right; margin-top: 10px; margin-bottom: 10px">
        <input type="submit" id="PracticePlanSubmit" name="PracticePlanSubmit" value="Сохранить"
            style="width: 100px; height: 30px;" />
    </div>
    <% } %>
    <% Html.EndForm(); %>
    <% }
        }
        catch (Exception ex)
        {
            Utility.RedirectToErrorPage("Cabinet.PracticePlan: catch exception", ex);
        } %>
</asp:Content>
