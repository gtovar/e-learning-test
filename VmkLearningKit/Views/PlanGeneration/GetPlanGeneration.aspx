<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Генератор
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>

    <% using (Html.BeginForm("Edit", "PlanGeneration", new { topicId = Convert.ToInt64(ViewData["TopicId"]) }, FormMethod.Post))
       { 
           %>
    <div align="center">
        <h2>
            План генерации</h2>
        <br />
        <table>
            <tr align="center">
                <td class="Generator4">
                    <b>Дисциплина</b>
                </td>
                <td class="Generator4">
                    <b>Тема</b>
                </td>
                <td class="Generator4">
                    <b>Разделов</b>
                </td>
                <th class="Generator4">
                    <b>Вопросов</b>
                </th>
            </tr>
            <% SpecialityDiscipline sd = (SpecialityDiscipline)ViewData["SpecialityDiscipline"];
               string s1 = sd.Title;
               SpecialityDisciplineTopic sdt = (SpecialityDisciplineTopic)ViewData["SpecialityDisciplineTopic"];
               string s2 = sdt.Title;
            %>
            <tr align="center">
                <td class="Generator">
                    <%= s1%>
                </td>
                <td class="Generator">
                    <%= s2%>
                </td>
                <td class="Generator">
                    <%= ViewData["RazdelCountBySpecialityDisciplineTopic"]%>
                </td>
                <td class="Generator">
                    <%= ViewData["QuestionCountBySpecialityDisciplineTopic"]%>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <table width="100%">
        <tr align="center">
            <td class="Generator4">
                <b>№</b>
            </td>
            <td class="Generator4">
                <b>Название раздела</b>
            </td>
            <td class="Generator4">
                <b>Количество вопросов в разделе</b>
            </td>
            <td class="Generator4">
                <b>Вопросов раздела в тестовом варианте</b>
            </td>
        </tr>
        <%
            int k = 1, s = 0, index = 0;
            ArrayList temp = (ArrayList)ViewData["QuestionCountByRazdels"];

            foreach (Razdel r in (IEnumerable<Razdel>)ViewData["AllRazdelsBySpecialityDisciplineTopic"])
            { 
                   
        %>
        <tr align="center">
            <td class="Generator">
                <%= k++%>
            </td>
            <td class="Generator">
                <%= r.Title%>
            </td>
            <td class="Generator">
                <%= temp[s++]%>
            </td>
            <td class="Generator">
                <% if (Convert.ToString(r.QuestionsCount).IndexOf("-") == -1)
                   { %>
                <input type="text" value="<%= r.QuestionsCount %>" size="1" name="in<%= index %>"
                    class="Generator" />
                <% }
                   else
                   {%>
                <input type="text" value="<%= 0 %>" size="1" name="in<%= index %>"
                    class="Generator" />
                <%} %>
            </td>
        </tr>
        <% 
            index++;
    }
        %>
        <tr align="center">
            <td colspan="2" class="Generator">
                <b>Всего</b>
            </td>
            <td class="Generator">
                <%= ViewData["QuestionCountBySpecialityDisciplineTopic"]%>
            </td>
            <td class="Generator">
                <%= ViewData["QuestionCountInTestVariantBySpecialityDisciplineTopic"]%>
            </td>
        </tr>
    </table>
    <br />
    <div align="right">
        <input type="image" name="submit" src="/Content/Images/ok.png" alt="сохранить" width="40"
            height="30" value="Сохранить"></div>
    <div align="left">
        <table>
            <tr align="center">
                <td class="Generator">
                    <b>Количество тестовых вариантов для генерации</b>
                </td>
                <td class="Generator">
                    <input type="text" value="<% = Convert.ToInt64(ViewData["VariantCount"]) %>" size="1"
                        name="variantCount" class="Generator" />
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div align="center">
        <%= Html.ActionLink("Назад", "Index", "Testing", new { alias = Convert.ToInt64(ViewData["TopicId"])}, new { @class = ""})%>&nbsp&nbsp&nbsp&nbsp&nbsp
        <%= Html.ActionLink("Сгенерировать тест", "AddTest", "PlanGeneration", new { topicId = Convert.ToInt64(ViewData["TopicId"]), variantCount = Convert.ToInt32(ViewData["VariantCount"]), questionCount = Convert.ToInt32(ViewData["QuestionCountInTestVariantBySpecialityDisciplineTopic"]) }, new {@class="" })%>&nbsp&nbsp&nbsp&nbsp&nbsp
        <%= Html.ActionLink("Посмотреть сгенерированные тесты", "GetGeneratedTests", "Tests", new { alias = Convert.ToInt64(ViewData["TopicId"]) }, new { @class = "" })%>
    </div>
    <%
        }
    %>
</asp:Content>
