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
            <td width="240px">
                <h2>
                    Расписание занятий
                </h2>
            </td>
            <td style="padding-bottom: 10px">
                <% if (null != ViewData["TimetableLecturePlans"] &&
           null != ViewData["TimetablePages"])
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
                <div class="pagerDB">
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
                        <%= Html.ActionLink(page.ToString(), "Student", "Cabinet", new { alias = ((VmkLearningKit.Models.Domain.User)Session["user"]).DbUser.NickName, additional = page.ToString() }, new { @class = "pagerDB-next active", @title = "Перейти к " + page.ToString() + " странице" })%>
                        <%
                    }
                    }
                        %>
                    </span>
                </div>
                <% } %>
            </td>
        </tr>
    </table>
    <table width="100%" border="2">
        <!-- Понедельник -->
        <% string day = "Понедельник"; %>
        <tr>
            <td rowspan="9" style="width: 20px">
                <font style="layout-flow: vertical-ideographic"><b>
                    <%= day %>
                    &nbsp;&nbsp;&nbsp;
                    <%= mondayDate.ToString("d MMMM") %>
                </b></font>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% string time = "8:00"; %>
                8<sup>00</sup>
            </td>
            <td style="width: 100px; padding: 5px; text-align: center">
                <%
                    string titleAndRoom = String.Empty;
                    LecturePlan foundLecturePlan = null;
                    string foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
        <% day = "Вторник"; %>
        <tr>
            <td rowspan="9" style="width: 20px">
                <font style="layout-flow: vertical-ideographic"><b>
                    <%= day %>
                    &nbsp;&nbsp;&nbsp;
                    <%= mondayDate.AddDays(1).ToString("d MMMM") %>
                </b></font>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "8:00"; %>
                8<sup>00</sup>
            </td>
            <td style="width: 100px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
        <% day = "Среда"; %>
        <tr>
            <td rowspan="9" style="width: 20px">
                <font style="layout-flow: vertical-ideographic"><b>
                    <%= day %>
                    &nbsp;&nbsp;&nbsp;
                    <%= mondayDate.AddDays(2).ToString("d MMMM")%>
                </b></font>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "8:00"; %>
                8<sup>00</sup>
            </td>
            <td style="width: 100px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
        <% day = "Четверг"; %>
        <tr>
            <td rowspan="9" style="width: 20px">
                <font style="layout-flow: vertical-ideographic"><b>
                    <%= day %>
                    &nbsp;&nbsp;&nbsp;
                    <%= mondayDate.AddDays(3).ToString("d MMMM")%>
                </b></font>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "8:00"; %>
                8<sup>00</sup>
            </td>
            <td style="width: 100px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
        <% day = "Пятница"; %>
        <tr>
            <td rowspan="9" style="width: 20px">
                <font style="layout-flow: vertical-ideographic"><b>
                    <%= day %>
                    &nbsp;&nbsp;&nbsp;
                    <%= mondayDate.AddDays(4).ToString("d MMMM")%>
                </b></font>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "8:00"; %>
                8<sup>00</sup>
            </td>
            <td style="width: 100px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
        <% day = "Суббота"; %>
        <tr>
            <td rowspan="9" style="width: 20px">
                <font style="layout-flow: vertical-ideographic"><b>
                    <%= day %>
                    &nbsp;&nbsp;&nbsp;
                    <%= mondayDate.AddDays(5).ToString("d MMMM")%>
                </b></font>
            </td>
        </tr>
        <tr>
            <td style="width: 40px; padding: 5px; text-align: center">
                <% time = "8:00"; %>
                8<sup>00</sup>
            </td>
            <td style="width: 100px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
            <td style="width: 50px; padding: 5px; text-align: center">
                <%
                    titleAndRoom = String.Empty;
                    foundLecturePlan = null;
                    foundTime = String.Empty;
                    titleAndRoom = Utility.GetSubjectAndRoom(lecturePlans, day, time, out foundLecturePlan);
                    if (null != titleAndRoom && !titleAndRoom.Trim().Equals(String.Empty))
                    {
                        foundTime = String.Copy(time);
                    }
                %>
                <%= titleAndRoom %>
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
