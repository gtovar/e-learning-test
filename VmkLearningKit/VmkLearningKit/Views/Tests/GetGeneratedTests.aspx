<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Тесты
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Сгенерированные тесты</h2>
    <br />
    <div align="center">
        <table border="1">
            <tr align="center">
                <td>
                    <b>№</b>
                </td>
                <td>
                    <b>Количество вариантов</b>
                </td>
                <td>
                    <b>Дата генерации</b>
                </td>
                <td>
                    <b>Количество вопросов</b>
                </td>
            </tr>
            <%
                int k = 1;

                foreach (GeneratedTest gt in (IEnumerable<GeneratedTest>)ViewData["AllGeneratedTestsBySpecialityDisciplineTopic"])
                { 
                   
            %>
            <tr align="center">
                <td>
                    <%= k++%>
                </td>
                <td>
                    <%=  gt.VariantsCount %>
                </td>
                <td>
                    <%= gt.GeneratedDate%>
                </td>
                <td>
                    <%= gt.QuestionsCount%>
                </td>
                <td>
                    <%= Html.ActionLink("Подробнее", "GetTest", new { id = gt.Id })%>
                </td>
            </tr>
            <% }
            %>
        </table>
    </div>
    <br />
    <div align="center">
        <%= Html.ActionLink("Назад", "GetPlanGeneration", "PlanGeneration")%>&nbsp&nbsp&nbsp&nbsp&nbsp
    </div>
</asp:Content>
