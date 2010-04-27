<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Вопросы
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Вопросы варианта</h2>
    <table border="1" cellpadding="10px" cellspacing="10px">
        <tr align="center">
            <td>
                <b>№</b>
            </td>
            <td>
                <b>Раздел</b>
            </td>
            <td>
                <b>Тип</b>
            </td>
            <td>
                <b>Название</b>
            </td>
            <td>
                <b>Количество баллов</b>
            </td>
            <td>
                <b>Правильных ответов</b>
            </td>
            <td>
                <b>Неправильных ответов</b>
            </td>
            <td>
                <b>Группа дублеров</b>
            </td>
            <td>
                <b>Гуппа исключений</b>
            </td>
            <td>
                <b>Состояние</b>
            </td>
            <td>
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
            <td>
                <%= q.Id %>
            </td>
            <td>
                <%= q.Razdel.Title%>
            </td>
            <td>
                <%= q.Type%>
            </td>
            <td>
                <%= q.Title%>
            </td>
            <td>
                <%= q.AssignedCount%>
            </td>
            <td>
                <%= q.RightAnswersCount%>
            </td>
            <td>
                <%= q.WrongAnswersCount%>
            </td>
            <td>
                <%= q.DoubleGroup%>
            </td>
            <td>
                <%= q.ExclusionGroup%>
            </td>
            <td>
                <%= q.IsDeleted %>
            </td>
            <td>
                <%= q.CanCommented %>
            </td>
            <td>
                <%= Html.ActionLink("Редактировать", "EditQuestion")%>
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
