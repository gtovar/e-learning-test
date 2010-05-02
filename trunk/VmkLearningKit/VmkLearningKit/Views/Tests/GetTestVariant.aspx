<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Вопросы
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Вопросы варианта</h2>
    <table class="Generator">
        <tr align="center">
            <td class="Generator">
                <b>№</b>
            </td>
            <td class="Generator">
                <b>Раздел</b>
            </td>
            <td class="Generator">
                <b>Тип</b>
            </td>
            <td class="Generator">
                <b>Название</b>
            </td>
            <td class="Generator">
                <b>Количество баллов</b>
            </td>
            <td class="Generator">
                <b>Правильных ответов</b>
            </td>
            <td class="Generator">
                <b>Неправильных ответов</b>
            </td>
            <td class="Generator">
                <b>Группа дублеров</b>
            </td>
            <td class="Generator">
                <b>Гуппа исключений</b>
            </td>
            <td class="Generator">
                <b>Состояние</b>
            </td>
            <td class="Generator">
                <b>Возможность комментария</b>
            </td>
        </tr>
        <% 
            int m = 0; long testId = 0;
            ArrayList l = new ArrayList((ICollection)ViewData["AllQuestionByGeneratedTestVariant"]);

            foreach (GeneratedQuestion gq in (IEnumerable<GeneratedQuestion>)ViewData["AllGeneratedQuestionsByGeneratedTestVariant"])
            {%>
        <%    
            ViewData["ques"] = l[m++];
            testId = gq.GeneratedTestVariant.GeneratedTestId;

            foreach (Question q in (IEnumerable<Question>)ViewData["ques"])
            {
        %>
        <tr align="center">
            <td class="Generator">
                <%= q.Id %>
            </td>
            <td class="Generator">
                <%= q.Razdel.Title%>
            </td>
            <td class="Generator">
                <%= q.Type%>
            </td>
            <td class="Generator">
                <%= q.Title%>
            </td>
            <td class="Generator">
                <%= q.AssignedCount%>
            </td>
            <td class="Generator">
                <%= q.RightAnswersCount%>
            </td>
            <td class="Generator">
                <%= q.WrongAnswersCount%>
            </td>
            <td class="Generator">
                <%= q.DoubleGroup%>
            </td>
            <td class="Generator">
                <%= q.ExclusionGroup%>
            </td>
            <td class="Generator">
                <%= q.IsDeleted %>
            </td>
            <td class="Generator">
                <%= q.CanCommented %>
            </td>
            <td class="Generator">
            <img src="/Content/Images/edit.png" class="QuestionEdit" alt="Редактировать" width="20" height="20" />
                
            </td>
        </tr>
        <%}
            }
        %>
    </table>
    <br />
    <div align="center">
        <%= Html.ActionLink("Назад", "GetTest", new { id = testId })%>
    </div>
</asp:Content>
