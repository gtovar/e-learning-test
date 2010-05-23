<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Вопросы
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>

<script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>

<script type="text/javascript">

    $(document).ready(function() {
        /*
        * Обработка события "Редактирование вопроса"
        *
        */
        $("img[class=QuestionEdit]").click(function() {

            // Получаем атрибут id родителя элемента
            var id = $(this).parent().attr("id");
            /*
            * Формируем url страницы для получение списка вопросов варианта.
            * Идентификтор варианта (в БД) заложен в полученный аттрибут.
            *
            */
            var url = "/Editor/Edit/" + id;
            //alert(url);
            window.location = url;
        });
    });
</script>

    <div align="center">
        <h2>
            Вопросы варианта</h2>
    </div>
    <br />
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

            int k = 1;
            foreach (GeneratedQuestion gq in (IEnumerable<GeneratedQuestion>)ViewData["AllGeneratedQuestionsByGeneratedTestVariant"])
            {%>
        <%    
            ViewData["ques"] = l[m++];
            testId = gq.GeneratedTestVariant.GeneratedTestId;

            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
            IQuestionRepository questionRepository = repositoryManager.GetQuestionRepository;


            foreach (Question q in (IEnumerable<Question>)ViewData["ques"])
            {
                
        %>
        <tr align="center">
            <td class="Generator">
                <%= k++ %>
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
                <% if (q.DoubleGroup == -1)
                   {%>
                Нет
                <% }
                   else
                   {%>
                <%= q.DoubleGroup %>
                <% } %>
            </td>
            <td class="Generator">
                <% if (q.ExclusionGroup == -1)
                   {%>
                Нет
                <% }
                   else
                   {%>
                <%= q.ExclusionGroup %>
                <% } %>
            </td>
            <td class="Generator">
                <% if (q.IsDeleted == 0)
                   {%>
                Не удален
                <% }
                   else
                   {%>
                Удален
                <% } %>
            </td>
            <td class="Generator">
                <% if (q.CanCommented == 0)
                   {%>
                Нет
                <% }
                   else
                   {%>
                Да
                <% } %>
            </td>
            <td class="Generator" id="<%= Html.Encode(q.Id.ToString())%>">
                <img src="/Content/Images/pencil.png" class="QuestionEdit" alt="К вопросам" width="20" height="20" />
            </td>
        </tr>
        <%}
            }
        %>
    </table>
    <br />
    <div align="center">
        <%= Html.ActionLink("Назад", "GetTest", new { alias = testId })%>
    </div>
</asp:Content>
