<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Линый кабинет / Кабинет студента
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link rel="stylesheet" type="text/css" href="/Scripts/Plugins/Pager/Designbump/pager.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%">
        <tr>
            <td width="285px">
                <h2 style="float: left">
                    График занятий
                </h2>
                <h4 style="margin-top: 7px">
                     &nbsp;&nbsp; по неделям
                </h4>
            </td>
            <td style="padding-bottom: 10px">
                <% if (null != ViewData["TimetableLecturePlans"] && null != ViewData["TimetablePages"])
                   {
                       IEnumerable<LecturePlan> lecturePlans = (IEnumerable<LecturePlan>)ViewData["TimetableLecturePlans"];
                       int[] pages = (int[])ViewData["TimetablePages"];

                       int timetablePage = 1;
                       if (null != ViewData["TimetablePage"] && !ViewData["TimetablePage"].ToString().Trim().Equals(String.Empty))
                       {
                           timetablePage = (int)ViewData["TimetablePage"];
                       }
                       DateTime mondayDate = DateTime.Today;
                       if (null != ViewData["MondayDate"])
                       {
                           mondayDate = (DateTime)ViewData["MondayDate"];
                       }
                %>
                <% if (pages.Length > 1)
                   { %>
                <div class="pagerDB" style="float: left">
                    <span class="pagerDB-list">
                        <%
                    foreach (int page in pages)
                    {
                        if (page == timetablePage)
                        {
                        %>
                        <strong class="pagerDB-current">
                            <%= page%>
                        </strong>
                        <%  }
                        else
                        { %>
                        <%= Html.ActionLink(page.ToString(), "Timetable", "Cabinet", new { alias = "Page", additional = page.ToString() }, new { @class = "pagerDB-next active", @title = "Перейти к " + page.ToString() + " странице" })%>
                        <%
                    }
                    }
                        %>
                    </span>
                </div>
                <% } %>
                <span style="float: right">
                    <div style="padding-top: 12px">
                        <%= Html.ActionLink("Тестирование", "Testing")%> 
                    </div>
                    <div style="padding-top: 3px">
                        <%= Html.ActionLink("Расписание", "Schedule") %> 
                    </div>
                </span>
            </td>
        </tr>
    </table>
    <table width="100%" border="2">
        <!-- Понедельник -->
        <% string day = "Понедельник";
           DateTime today = mondayDate;
        %>
        <tr>
            <td rowspan="9" style="width: 20px; <% if (today.Date.Equals(DateTime.Now.Date)) { %>background-color: #534d00;<% } %>">
                <font style="layout-flow: vertical-ideographic; <% if (today.Date.Equals(DateTime.Now.Date)) { %>color: White;<% } %>"><b>
                    <%= day %>
                    &nbsp;&nbsp;&nbsp;
                    <%= today.ToString("d MMMM")%>
                </b></font>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% string time = "8:00"; %>
                8<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    LecturePlan foundLecturePlan = null;
                    string foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    string disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    string room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    string professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                        null != foundLecturePlan.SpecialityDiscipline) 
                        /*&& 
                        null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                       // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan,day,time);
                        
                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    string topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "9:40"; %>
                9<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "11:20"; %>
                11<sup>20</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "13:00"; %>
                13<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "14:40"; %>
                14<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "16:20"; %>
                16<sup>20</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                        null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "18:00"; %>
                18<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "19:40"; %>
                19<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <!-- Отступ -->
        <tr>
            <td style="height: 10px; border: 0">
            </td>
        </tr>
        <!-- Вторник -->
        <% day = "Вторник";
           today = mondayDate.AddDays(1);
        %>
        <tr>
            <td rowspan="9" style="width: 20px; <% if (today.Date.Equals(DateTime.Now.Date)) { %>background-color: #534d00;<% } %>">
                <font style="layout-flow: vertical-ideographic; <% if (today.Date.Equals(DateTime.Now.Date)) { %>color: White;<% } %>"><b>
                    <%= day %>
                    &nbsp;&nbsp;&nbsp;
                    <%= today.ToString("d MMMM") %>
                </b></font>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "8:00"; %>
                8<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "9:40"; %>
                9<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "11:20"; %>
                11<sup>20</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                          null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "13:00"; %>
                13<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "14:40"; %>
                14<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "16:20"; %>
                16<sup>20</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "18:00"; %>
                18<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "19:40"; %>
                19<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <!-- Отступ -->
        <tr>
            <td style="height: 10px; border: 0">
            </td>
        </tr>
        <!-- Среда -->
        <% day = "Среда";
           today = mondayDate.AddDays(2);
        %>
        <tr>
            <td rowspan="9" style="width: 20px; <% if (today.Date.Equals(DateTime.Now.Date)) { %>background-color: #534d00;<% } %>">
                <font style="layout-flow: vertical-ideographic; <% if (today.Date.Equals(DateTime.Now.Date)) { %>color: White;<% } %>"><b>
                    <%= day %>
                    &nbsp;&nbsp;&nbsp;
                    <%= today.ToString("d MMMM")%>
                </b></font>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "8:00"; %>
                8<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "9:40"; %>
                9<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                        null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "11:20"; %>
                11<sup>20</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "13:00"; %>
                13<sup>00</sup>
            </td>
             <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                        null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "14:40"; %>
                14<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "16:20"; %>
                16<sup>20</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "18:00"; %>
                18<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                        null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "19:40"; %>
                19<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <!-- Отступ -->
        <tr>
            <td style="height: 10px; border: 0">
            </td>
        </tr>
        <!-- Четверг -->
        <% day = "Четверг"; 
           today = mondayDate.AddDays(3);
        %>
        <tr>
            <td rowspan="9" style="width: 20px; <% if (today.Date.Equals(DateTime.Now.Date)) { %>background-color: #534d00;<% } %>">
                <font style="layout-flow: vertical-ideographic; <% if (today.Date.Equals(DateTime.Now.Date)) { %>color: White;<% } %>"><b>
                    <%= day %>
                    &nbsp;&nbsp;&nbsp;
                    <%= today.ToString("d MMMM")%>
                </b></font>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "8:00"; %>
                8<sup>00</sup>
            </td>
             <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "9:40"; %>
                9<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "11:20"; %>
                11<sup>20</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                        null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "13:00"; %>
                13<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                        null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "14:40"; %>
                14<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                        null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "16:20"; %>
                16<sup>20</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "18:00"; %>
                18<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "19:40"; %>
                19<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <!-- Отступ -->
        <tr>
            <td style="height: 10px; border: 0">
            </td>
        </tr>
        <!-- Пятница -->
        <% day = "Пятница";
           today = mondayDate.AddDays(4);
        %>
        <tr>
            <td rowspan="9" style="width: 20px; <% if (today.Date.Equals(DateTime.Now.Date)) { %>background-color: #534d00;<% } %>">
                <font style="layout-flow: vertical-ideographic; <% if (today.Date.Equals(DateTime.Now.Date)) { %>color: White;<% } %>"><b>
                    <%= day %>
                    &nbsp;&nbsp;&nbsp;
                    <%= today.ToString("d MMMM")%>
                </b></font>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "8:00"; %>
                8<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "9:40"; %>
                9<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                        null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "11:20"; %>
                11<sup>20</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "13:00"; %>
                13<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "14:40"; %>
                14<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "16:20"; %>
                16<sup>20</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                        null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "18:00"; %>
                18<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "19:40"; %>
                19<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <!-- Отступ -->
        <tr>
            <td style="height: 10px; border: 0">
            </td>
        </tr>
        <!-- Суббота -->
        <% day = "Суббота"; 
           today = mondayDate.AddDays(5);
        %>
        <tr>
            <td rowspan="9" style="width: 20px; <% if (today.Date.Equals(DateTime.Now.Date)) { %>background-color: #534d00;<% } %>">
                <font style="layout-flow: vertical-ideographic; <% if (today.Date.Equals(DateTime.Now.Date)) { %>color: White;<% } %>"><b>
                    <%= day %>
                    &nbsp;&nbsp;&nbsp;
                    <%= today.ToString("d MMMM")%>
                </b></font>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "8:00"; %>
                8<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "9:40"; %>
                9<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                        null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "11:20"; %>
                11<sup>20</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                        null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "13:00"; %>
                13<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "14:40"; %>
                14<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "16:20"; %>
                16<sup>20</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                          null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "18:00"; %>
                18<sup>00</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                         null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "19:40"; %>
                19<sup>40</sup>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    foundLecturePlan = Utility.FindLecturePlan(lecturePlans, day, time);
                    disciplineAbbreviation = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        foundTime = String.Copy(time);
                        if (null != foundLecturePlan.SpecialityDiscipline)
                        {
                            disciplineAbbreviation = foundLecturePlan.SpecialityDiscipline.Abbreviation;
                        }
                    }
                %>
                <%= disciplineAbbreviation %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    room = String.Empty;
                    if (null != foundLecturePlan)
                    {
                        room = Utility.GetRoom(foundLecturePlan, day, time);
                    }
                %>
                <%= room %>
            </td>
            <td style="width: 150px; padding: 5px; text-align: center">
                <%
                    professorFullName = String.Empty;
                    if (null != foundLecturePlan &&
                        null != foundLecturePlan.SpecialityDiscipline)
                    /*&& 
                    null != foundLecturePlan.SpecialityDiscipline.Professor)*/
                    {
                        // professorFullName = Utility.GetProfessorFullName(foundLecturePlan.SpecialityDiscipline.Professor);
                        professorFullName = Utility.GetProfessorFullName(foundLecturePlan, day, time);

                    }
                %>
                <%= professorFullName%>
            </td>
            <td style="padding: 5px">
                <%
                    topic = String.Empty;
                    if (null != foundLecturePlan && null != foundTime && foundTime.Trim().Equals(time))
                    {
                        topic = Utility.GetTopicTitle(foundLecturePlan, day);
                    }
                %>
                <%= topic %>
            </td>
        </tr>
    </table>
    <% } %>
</asp:Content>
