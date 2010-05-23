<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Тесты
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>

<script type="text/javascript">

    $(document).ready(function() {
        /*
        * Обработка события "Получение подробной информации о тесте"
        *
        */
        $("img[class=TestView]").click(function() {

            // Получаем атрибут id родителя элемента
            var id = $(this).parent().attr("id");
            /*
            * Формируем url страницы для получения подробной информации о тесте.
            * Идентификтор теста (в БД) заложен в полученный аттрибут.
            *
            */
            var url = "/Tests/GetTest/" + id;
            //alert(url);
            window.location = url;
        });

        /*
        * Обработка события "Удаление теста"
        *
        */
        $("img[class=TestDelete]").click(function() {
            if (confirm("Вы уверены, что хотите удалить тест?")) {

                // Получаем атрибут id родителя элемента
                var id = $(this).parent().attr("id");
                /*
                * Формируем url страницы для удаления теста.
                * Идентификтор вопроса (в БД) заложен в полученный аттрибут.
                *
                */
                var url = "/Tests/DeleteTest/" + id;
                //alert(url);
                window.location = url;
            }
        });
    });
</script>

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
            
            <div class="GeneratedTest">
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
                <td class="Generator" id="<%= Html.Encode(gt.Id.ToString())%>">
                 <img src="/Content/Images/rarrow.png" class="TestView" alt="Подробнее" width="20" height="20" />  
                </td>
                <td class="Generator" id="<%= Html.Encode(gt.Id.ToString())%>" >
                <img src="/Content/Images/ko.png" class="TestDelete" alt="Удалить" width="20" height="20" />
                </td>
                </tr>
              </div>
            
            <% }
            %>
        </table>
    </div>
    <br />
    <div align="center">
        <%= Html.ActionLink("Назад", "GetPlanGeneration", "PlanGeneration", new { alias = Convert.ToInt64(ViewData["TopicId"]) }, new { @class = "" })%>&nbsp&nbsp&nbsp&nbsp&nbsp
    </div>
</asp:Content>
