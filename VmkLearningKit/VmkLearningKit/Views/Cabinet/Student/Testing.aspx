<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Линый кабинет / Кабинет студента
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link type="text/css" href="/Scripts/Plugins/Tabber/css/ui-lightness/jquery-ui-1.8.1.custom.css"
        rel="stylesheet" />

    <script type="text/javascript" src="/Scripts/Plugins/Tabber/js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="/Scripts/Plugins/Tabber/js/jquery-ui-1.8.1.custom.min.js"></script>

    <script type="text/javascript">
        $(function() {
            // Tabs
            $('#tabs').tabs();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="float: left">
        <h2 style="margin-bottom: 10px">Тестирование - Список заданий</h2>
    </div>
    <div style="float: right; margin-top: 8px">
        <%= Html.ActionLink("Расписание", "Schedule") %>
        &nbsp;
        <%= Html.ActionLink("График занятий", "Timetable", new { alias = String.Empty, additional = String.Empty } )%>
    </div>
    <br />
    <br />

    <%
        IEnumerable<AssignedTestVariant> assignedTestVariants = null;

        var newTests = false;
        var inprogressTests = false;
        var doneTests = false;
        var checkedTests = false;

        if (null != ViewData["AssignedTestVariants"])
        {
            assignedTestVariants = (IEnumerable<AssignedTestVariant>)ViewData["AssignedTestVariants"];

            foreach (var assignedTestVariant in assignedTestVariants)
            {
                switch (assignedTestVariant.State)
                {
                    case VLKConstants.TEST_VARIANT_STATE_NEW:
                        newTests = true;
                        break;
                    case VLKConstants.TEST_VARIANT_STATE_IN_PROGRESS:
                        inprogressTests = true;
                        break;
                    case VLKConstants.TEST_VARIANT_STATE_DONE:
                        doneTests = true;
                        break;
                    case VLKConstants.TEST_VARIANT_STATE_CHECKED:
                        checkedTests = true;
                        break;
                }
            }
        }
    %>

    <div id="tabs">
        <ul>
            <li><a href="#newTestVariantTab">Новые</a></li>
            <li><a href="#inprogressTestVariantTab">В процессе</a></li>
            <li><a href="#doneTestVariantTab">Выполненные</a></li>
            <li><a href="#checkedTestVariantTab">Проверенные</a></li>
        </ul>

        <div id="newTestVariantTab">
            <% 
                if (newTests)
                {
            %>

            <table width="100%" border="1">
                <tr class="table_header">
                    <th class="table_th">
                        №
                    </th>
                    <th class="table_th">
                        Дисциплина
                    </th>
                    <th class="table_th">
                        Тест
                    </th>
                </tr>
                <% 
                    var index = 1;
                    foreach (var assignedTestVariant in assignedTestVariants)
                    {
                       // выводим только новые тесты
                       if (assignedTestVariant.State == VLKConstants.TEST_VARIANT_STATE_NEW)
                       {
                %>
                <tr class="table_row">
                    <td class="table_td">
                        <%= index %>
                    </td>
                    <td class="table_td" style="text-align:left">
                        <%
                            string disciplineTitle = String.Empty;
                            if (null != assignedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline)
                            {
                                disciplineTitle = assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline.Title;
                            }
                        %>
                        <%= Html.Encode(disciplineTitle) %>
                    </td>
                    <td class="table_td">
                        <% 
                           string testVariantTitle = String.Empty;
                           string testVariantLink = String.Empty;
                           
                           if (null != assignedTestVariant && !assignedTestVariant.Path.Trim().Equals(String.Empty))
                           {
                               testVariantTitle = "Вариант_" + Path.GetFileNameWithoutExtension(assignedTestVariant.Path);
                               testVariantLink = ConfigurationManager.AppSettings["webPlayerUrl"].ToString() + "/Execute.aspx?key=" + assignedTestVariant.StudentKey;
                           }
                           
                        %>
                        <a href="<%= testVariantLink %>"><%= testVariantTitle %></a>
                    </td>
                </tr>

                <%
                            index++;
                        }
                    }
                %>

            </table>

            <% 
                }
                else
                {
            %>

            <div align="center">Нет новых заданий</div>
            
            <%
                }
            %>
        </div>

        <div id="inprogressTestVariantTab">
            <% 
                if (inprogressTests)
                {
            %>

            <table width="100%" border="1">
                <tr class="table_header">
                    <th class="table_th">
                        №
                    </th>
                    <th class="table_th">
                        Дисциплина
                    </th>
                    <th class="table_th">
                        Тест
                    </th>
                </tr>
                <% 
                    var index = 1;
                    foreach (var assignedTestVariant in assignedTestVariants)
                    {
                       // выводим только новые тесты
                       if (assignedTestVariant.State == VLKConstants.TEST_VARIANT_STATE_IN_PROGRESS)
                       {
                %>
                <tr class="table_row">
                    <td class="table_td">
                        <%= index %>
                    </td>
                    <td class="table_td" style="text-align:left">
                        <%
                            string disciplineTitle = String.Empty;
                            if (null != assignedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline)
                            {
                                disciplineTitle = assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline.Title;
                            }
                        %>
                        <%= Html.Encode(disciplineTitle) %>
                    </td>
                    <td class="table_td">
                        <% 
                           string testVariantTitle = String.Empty;
                           string testVariantLink = String.Empty;
                           
                           if (null != assignedTestVariant && !assignedTestVariant.Path.Trim().Equals(String.Empty))
                           {
                               testVariantTitle = "Вариант_" + Path.GetFileNameWithoutExtension(assignedTestVariant.Path);
                               testVariantLink = ConfigurationManager.AppSettings["webPlayerUrl"].ToString() + "/Execute.aspx?key=" + assignedTestVariant.StudentKey;
                           }
                           
                        %>
                        <a href="<%= testVariantLink %>"><%= testVariantTitle %></a>
                    </td>
                </tr>

                <%
                            index++;
                        }
                    }
                %>

            </table>

            <% 
                }
                else
                {
            %>

            <div align="center">Нет заданий в процессе выполнения</div>
            
            <%
                }
            %>
        </div>

        <div id="doneTestVariantTab">
            <%
                if (doneTests)
                {
            %>
            <table width="100%" border="1">
                <tr class="table_header">
                    <th class="table_th">
                        №
                    </th>
                    <th class="table_th">
                        Дисциплина
                    </th>
                    <th class="table_th">
                        Тест
                    </th>
                    <th class="table_th">
                        Балл
                    </th>
                </tr>
                <%
                    var index = 1;
                    foreach (var assignedTestVariant in assignedTestVariants)
                    {
                        // выводим только выполненые тесты
                        if (assignedTestVariant.State == VLKConstants.TEST_VARIANT_STATE_DONE &&
                            ((int)(DateTime.Now.Date - assignedTestVariant.AssignedDate.Date).TotalDays) < VLKConstants.HOW_LONG_SHOW_DONE_TEST)
                        {
                %>
                <tr class="table_row">
                    <td class="table_td">
                        <%= index %>
                    </td>
                    <td class="table_td" style="text-align: left">
                        <%
                            string disciplineTitle = String.Empty;
                            if (null != assignedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline)
                            {
                                disciplineTitle = assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline.Title;
                            }
                        %>
                        <%= Html.Encode(disciplineTitle) %>
                    </td>
                    <td class="table_td">
                        <%
                            string testVariantTitle = String.Empty;
                            if (null != assignedTestVariant && !assignedTestVariant.Path.Trim().Equals(String.Empty))
                            {
                                testVariantTitle = "Вариант_" + Path.GetFileNameWithoutExtension(assignedTestVariant.Path);
                            }
                        %>
                        <%
                            if (!testVariantTitle.Trim().Equals(String.Empty))
                            { 
                        %>
                        <%= Html.Encode(testVariantTitle)%>
                        <% 
                            } 
                        %>
                    </td>
                    <td class="table_td">
                        <%= assignedTestVariant.Score %>
                    </td>
                </tr>
                <%
                            index++;
                        }
                    }
                %>
            </table>

            <%
                }
                else 
                {
            %>

            <div align="center">Нет выполненных заданий</div>
            
            <%
                }
            %>

        </div>

        <div id="checkedTestVariantTab">
            <% 
                if (checkedTests)
                {
            %>
            <table width="100%" border="1">
                <tr class="table_header">
                    <th class="table_th">
                        №
                    </th>
                    <th class="table_th">
                        Дисциплина
                    </th>
                    <th class="table_th">
                        Тест
                    </th>
                    <th class="table_th">
                        Балл
                    </th>
                    <th class="table_th">
                        Оценка
                    </th>
                </tr>
                <% 
                    var index = 1;
                    foreach (var assignedTestVariant in assignedTestVariants)
                    {
                        // выводим только проверенные тесты
                        if (assignedTestVariant.State == VLKConstants.TEST_VARIANT_STATE_CHECKED &&
                            ((int)(DateTime.Now.Date - assignedTestVariant.AssignedDate.Date).TotalDays) < VLKConstants.HOW_LONG_SHOW_CHECKED_TEST)

                        {
                %>
                <tr class="table_row">
                    <td class="table_td">
                        <%= index %>
                    </td>
                    <td class="table_td" style="text-align:left">
                        <%
                            string disciplineTitle = String.Empty;
                            if (null != assignedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline)
                            {
                                disciplineTitle = assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline.Title;
                            }
                        %>
                        <%= Html.Encode(disciplineTitle) %>
                    </td>
                    <td class="table_td">
                        <% 
                            string testVariantTitle = String.Empty;
                            if (null != assignedTestVariant && !assignedTestVariant.Path.Trim().Equals(String.Empty))
                            {
                                testVariantTitle = "Вариант_" + Path.GetFileNameWithoutExtension(assignedTestVariant.Path);
                            }
                        %>
                        <% 
                            if (!testVariantTitle.Trim().Equals(String.Empty))
                            { 
                        %>
                        <%= Html.Encode(testVariantTitle) %>
                        <% 
                            } 
                        %>
                    </td>
                    <td class="table_td">
                        <%= assignedTestVariant.Score %>
                    </td>
                    <td class="table_td">
                        <%= assignedTestVariant.Mark %>
                    </td>
                </tr>
                <% 
                            index++;
                        }
                    }
                %>
            </table>
            <%
                }
                else 
                {
            %>

            <div align="center">Нет проверенных заданий</div>
            
            <%
                }
            %>      
        </div>
    </div>
</asp:Content>
