<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Линый кабинет / Кабинет студента
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="float: left">
        <h2 style="margin-bottom: 10px">
            Расписание</h2>
    </div>
    <div style="float: right; margin-top: 8px">
        <%= Html.ActionLink("Тестирование", "Testing") %>
        &nbsp;
        <%= Html.ActionLink("График занятий", "Timetable", new { alias = String.Empty, additional = String.Empty } )%>
    </div>
    <% if (null != ViewData["SpecialityDisciplines"])
       {
           IEnumerable<SpecialityDiscipline> specialityDisciplines = ((IEnumerable<SpecialityDiscipline>)ViewData["SpecialityDisciplines"]);
           if (null != specialityDisciplines && specialityDisciplines.Count() > 0)
           {
    %>
    <table width="100%" border="1">
        <tr class="table_header">
            <th class="table_th" width="40px">
            </th>
            <th class="table_th" width="150px">
                Понедельник
            </th>
            <th class="table_th" width="150px">
                Вторник
            </th>
            <th class="table_th" width="150px">
                Среда
            </th>
            <th class="table_th" width="150px">
                Четверг
            </th>
            <th class="table_th" width="150px">
                Пятница
            </th>
            <th class="table_th" width="150px">
                Суббота
            </th>
        </tr>
        <%
            // объявления переменных
            string schedule = String.Empty;
            string upSchedule = null;
            string downSchedule = null;
            LectureTimetable lecture = null;
            List<LectureTimetable> foundLectureTimetables = null;
            List<PracticeAndLabTimetable> foundPracticeAndLabTimetables = null;
            bool both_weeks = false;
        %>
        <tr class="table_row">
            <td class="table_td">
                <% string time = "8:00"; %>
                08<sup>00</sup>
            </td>
            <!-- Понедельник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Понедельник", time);
                    foundPracticeAndLabTimetables = Utility.FindSchedule(((VmkLearningKit.Models.Domain.User)Session["user"]).DbUser.Id, specialityDisciplines, "Понедельник", time);
                    
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }
                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Вторник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Вторник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Среда -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Среда", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Четверг -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Четверг", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Пятница -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Пятница", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Суббота -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Суббота", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% time = "9:40"; %>
                09<sup>40</sup>
            </td>
            <!-- Понедельник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Понедельник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Вторник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Вторник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Среда -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Среда", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Четверг -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Четверг", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Пятница -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Пятница", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Суббота -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Суббота", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% time = "11:20"; %>
                11<sup>20</sup>
            </td>
            <!-- Понедельник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Понедельник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Вторник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Вторник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Среда -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Среда", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Четверг -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Четверг", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Пятница -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Пятница", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Суббота -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Суббота", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% time = "13:00"; %>
                13<sup>00</sup>
            </td>
            <!-- Понедельник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Понедельник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Вторник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Вторник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Среда -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Среда", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Четверг -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Четверг", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Пятница -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Пятница", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Суббота -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Суббота", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% time = "14:40"; %>
                14<sup>40</sup>
            </td>
            <!-- Понедельник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Понедельник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Вторник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Вторник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Среда -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Среда", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Четверг -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Четверг", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Пятница -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Пятница", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Суббота -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Суббота", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% time = "16:20"; %>
                16<sup>20</sup>
            </td>
            <!-- Понедельник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Понедельник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Вторник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Вторник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Среда -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Среда", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Четверг -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Четверг", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Пятница -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Пятница", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Суббота -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Суббота", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% time = "18:00"; %>
                18<sup>00</sup>
            </td>
            <!-- Понедельник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Понедельник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Вторник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Вторник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Среда -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Среда", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Четверг -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Четверг", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Пятница -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Пятница", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Суббота -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Суббота", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% time = "19:40"; %>
                19<sup>40</sup>
            </td>
            <!-- Понедельник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Понедельник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Вторник -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Вторник", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Среда -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Среда", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Четверг -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Четверг", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Пятница -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Пятница", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
            <!-- Суббота -->
            <td class="table_td">
                <%
                    foundLectureTimetables = Utility.FindSchedule(specialityDisciplines, "Суббота", time);
                    if (null != foundLectureTimetables && foundLectureTimetables.Count > 0 && foundLectureTimetables.Count < 3)
                    {
                        both_weeks = foundLectureTimetables.Count == 2 ? true : false;

                        if (both_weeks)
                        {
                            if (foundLectureTimetables[0].Week.Trim().Equals(VLKConstants.UP_WEEK))
                            {
                                upSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                            }
                            else
                            {
                                upSchedule = foundLectureTimetables[1].Room != 0 ? foundLectureTimetables[1].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[1].Room + " (" + foundLectureTimetables[1].Building + ") " : foundLectureTimetables[1].SpecialityDiscipline.Abbreviation;
                                downSchedule = foundLectureTimetables[0].Room != 0 ? foundLectureTimetables[0].SpecialityDiscipline.Abbreviation + " " + foundLectureTimetables[0].Room + " (" + foundLectureTimetables[0].Building + ") " : foundLectureTimetables[0].SpecialityDiscipline.Abbreviation;
                            }

                        }
                        else
                        {
                            lecture = foundLectureTimetables[0];
                            schedule = lecture.Room != 0 ? lecture.SpecialityDiscipline.Abbreviation + " " + lecture.Room + " (" + lecture.Building + ") " : lecture.SpecialityDiscipline.Abbreviation;
                        }
                            %>
                            <% if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.UP_WEEK))
                               {
                                %>
                                    <%= schedule%>
                                    <hr style="margin: 4px; margin-bottom: 10px"/>
                                <%
                               }
                               else if (!both_weeks && lecture.Week.Trim().Equals(VLKConstants.DOWN_WEEK))
                               {
                                %>
                                    <hr style="margin: 4px; margin-top: 10px"/>
                                    <%= schedule%>
                                <%
                               }
                               else if (!both_weeks)
                               { %>
                                    <%= schedule%>
                            <% }
                               else
                               {
                                   %>
                                     <%= upSchedule %>
                                     <hr style="margin: 4px"/>
                                     <%= downSchedule %>   
                                   <%    
                               }
                        }
                 %>
            </td>
        </tr>
    </table>
    <%
        }
       } %>
</asp:Content>
