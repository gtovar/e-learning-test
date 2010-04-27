<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Генератор
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <h2>
            Генератор тестовых вариантов</h2>
        <br />
        <table border ="1">
            <tr align="center">
                <td>
                    <b>Дисциплина</b>
                </td>
                <td>
                    <b>Тема</b>
                </td>
                <td>
                    <b>Количество разделов</b>
                </td>
                <td>
                    <b>Количество вопросов</b>
                </td>
            </tr>
            <% SpecialityDiscipline sd = (SpecialityDiscipline)ViewData["SpecialityDiscipline"];
               string s1 = sd.Title;
               SpecialityDisciplineTopic sdt = (SpecialityDisciplineTopic)ViewData["SpecialityDisciplineTopic"];
               string s2 = sdt.Title;
                %>
            <tr align="center">
                <td>
                   <%= s1%>
                </td>
                <td>
                    <%= s2%>
                </td>
                <td>
                    <%= ViewData["RazdelCountBySpecialityDisciplineTopic"]%>
                </td>
                <td>
                    <%= ViewData["QuestionCountBySpecialityDisciplineTopic"]%>
                </td>
            </tr>
        </table>
    </div>
    <h3 align="left">
        План генерации</h3>
    <br />
    <table border = "1">
        <tr align="center">
            <td>
                <b>№</b>
            </td>
            <td>
                <b>Название раздела</b>
            </td>
            <td>
                <b>Количество вопросов в разделе</b>
            </td>
            <td>
                <b>Вопросов раздела в тестовом варианте</b>
            </td>
        </tr>
        <%
            int k = 1, s = 0;
            ArrayList temp = (ArrayList)ViewData["QuestionCountByRazdels"];

            foreach (Razdel r in (IEnumerable<Razdel>)ViewData["AllRazdelsBySpecialityDisciplineTopic"])
            { 
                   
        %>
        <tr align="center">
            <td>
                <%= k++%>
            </td>
            <td>
                <%= r.Title%>
            </td>
            <td>
                <%= temp[s++]%>
            </td>
            <td>
                <%= r.QuestionsCount%>
            </td>
        </tr>
        <% }
        %>
        <tr align="center">
            <td colspan="2">
                <b>Всего</b>
            </td>
            <td>
                <%= ViewData["QuestionCountBySpecialityDisciplineTopic"]%>
            </td>
            <td>
                <%= ViewData["QuestionCountInTestVariantBySpecialityDisciplineTopic"]%>
            </td>
        </tr>
    </table>
    <br />
    <div align="left">
        <table border ="1">
            <tr align="center">
                <td>
                    <b>Количество тестовых вариантов для генерации</b>
                </td>
                <td>
                    <%= ViewData["RequiredVariantCount"]%>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div align="center">
        <%= Html.ActionLink("Назад", "Index", "Home") %>&nbsp&nbsp&nbsp&nbsp&nbsp
        <%= Html.ActionLink("Сгенерировать тест", "AddTest", "PlanGeneration")%>&nbsp&nbsp&nbsp&nbsp&nbsp
        <%= Html.ActionLink("Посмотреть сгенерированные тесты", "GetGeneratedTests", "Tests")%>
    </div>
</asp:Content>
