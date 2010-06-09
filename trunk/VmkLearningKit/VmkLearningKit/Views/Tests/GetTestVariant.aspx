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
                var url = "/Editor/Question/" + id;
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
                <img src="/Content/Images/d.png" alt="Количество баллов" width="35" height="35" />
            </td>
            <td class="Generator">
                <img src="/Content/Images/h1.png" alt="Правильных ответов" width="35" height="35" />
            </td>
            <td class="Generator">
                <img src="/Content/Images/h2.png" alt="Неправильных ответов" width="35" height="35" />
            </td>
            <td class="Generator">
                <img src="/Content/Images/g1.png" alt="Группа-дублеров" width="35" height="35" />
            </td>
            <td class="Generator">
                <img src="/Content/Images/g2.png" alt="Группа-иключений" width="35" height="35" />
            </td>
            <td class="Generator">
                <img src="/Content/Images/s2.png" alt="Состояние" width="35" height="35" />
            </td>
            <td class="Generator">
                <img src="/Content/Images/c.png" alt="Возможность комментария" width="35" height="35" />
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
                <%switch (q.Type)
                  {
                      case 0:%>
                Простой<%break;%>
                <%case 1:%>
                Альтернативный<%break;%>
                <%case 2:%>
                Дистрибутивный<%break;%>
                <%case 3:%>
                Формула<%break;%>
                <%}%>
            </td>
            <td class="Generator">
                <%= q.Title%>
            </td>
            <td class="Generator">
                <% if (q.AssignedCount == -1)
                   {%>
                Не назначено
                <% }
                   else
                   {%>
                <%= q.AssignedCount%>
                <% } %>
            </td>
            <td class="Generator">
                <% if (q.RightAnswersCount == -1)
                   {%>
                -
                <% }
                   else
                   {%>
                <%= q.RightAnswersCount%>
                <% } %>
            </td>
            <td class="Generator">
                <% if (q.WrongAnswersCount == -1)
                   {%>
                -
                <% }
                   else
                   {%>
                <%= q.WrongAnswersCount%>
                <% } %>
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
                <img src="/Content/Images/pencil.png" class="QuestionEdit" alt="К вопросам" width="20"
                    height="20" />
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
