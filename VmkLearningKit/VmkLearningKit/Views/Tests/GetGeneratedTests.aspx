<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Тесты
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <h2>
            Сгенерированные тесты</h2>
        <br />
        <table class="Generator">
            <tr align="center">
                <td class="Generator">
                    <b>№</b>
                </td>
                <td class="Generator">
                    <b>Количество вариантов</b>
                </td>
                <td class="Generator">
                    <b>Дата генерации</b>
                </td>
                <td class="Generator">
                    <b>Количество вопросов</b>
                </td>
            </tr>
            <%
                int k = 1;

                foreach (GeneratedTest gt in (IEnumerable<GeneratedTest>)ViewData["AllGeneratedTestsBySpecialityDisciplineTopic"])
                { 
                   
            %>
            <tr align="center">
                <td class="Generator">
                    <%= k++%>
                </td>
                <td class="Generator">
                    <%=  gt.VariantsCount %>
                </td>
                <td class="Generator">
                    <%= gt.GeneratedDate%>
                </td>
                <td class="Generator">
                    <%= gt.QuestionsCount%>
                </td>
                <td class="Generator">
                    <%= Html.ActionLink("Подробнее", "GetTest", new { id = gt.Id })%>
                </td>
            </tr>
            <% }
            %>
        </table>
    </div>
    <br />
    <div align="center">
        <%= Html.ActionLink("Назад", "GetPlanGeneration", "PlanGeneration", new { topicId = Convert.ToInt64(ViewData["TopicId"]) }, new { @class = "" })%>&nbsp&nbsp&nbsp&nbsp&nbsp
    </div>
</asp:Content>
