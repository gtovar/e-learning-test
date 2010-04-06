<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="VmkLearningKit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Редактирование тестового вопроса
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Редактирование тестового вопроса</h2>
    
    <%  Question            question    = (Question)ViewData["QuestionData"];
        IEnumerable<Answer> answersList = (IEnumerable<Answer>)ViewData["AnswerData"];
        
        using (Html.BeginForm())
        {%>
    <p>Тип вопроса: 
        <%
            switch (question.Type)
            {
                case VLKConstants.QUESTION_TYPE_SIMPLE:
                    {
                        %>
                        <%= Html.Encode("Простой") %>
                        <%
                        
                        break;
                    }
                case VLKConstants.QUESTION_TYPE_ALTERNATIVE:
                    {
                        %>
                        <%= Html.Encode("Альтернативный") %>
                        <%
                        
                        break;
                    }
                case VLKConstants.QUESTION_TYPE_DISTRIBUTIVE:
                    {
                        %>
                        <%= Html.Encode("Дистрибутивный") %>
                        <%
                        
                        break;
                    }
                case VLKConstants.QUESTION_TYPE_FORMULA:
                    {
                        %>
                        <%= Html.Encode("Формула") %>
                        <%
                        
                        break;
                    }                            
             }
        %>
    </p>
    <p>
        <label for="Title">Краткое название: </label>
        <%= Html.TextBox("Title", question.Title) %>
    </p>
    <p>
        <label for="Text">Текст вопроса: </label>
        <%= Html.TextBox("Text", question.Text) %>
    </p>
    <p>
        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
        Включить возможность комментирования вопроса студентами
    </p>
    <p>
        <label for="DoubleGroup">Номер группы дубль-вопросов: </label>
        <%= Html.TextBox("DoubleGroup", question.DoubleGroup) %>
    </p>
    <p>
        <label for="ExclusionGroup">Номер группы вопросов-исключений: </label>
        <%= Html.TextBox("ExclusionGroup", question.ExclusionGroup)%>
    </p>
    <%
        switch (question.Type)
        {
            case VLKConstants.QUESTION_TYPE_SIMPLE:
                {
                    %>
                    <h2>Ответ</h2>
                    <p>
                        <label for="VariantAnswer"></label>
                        <%= Html.TextBox("VariantAnswer", answersList.ElementAt<Answer>(0).Text)%>
                    </p>
                    <%
                    
                    break;
                }
            case VLKConstants.QUESTION_TYPE_ALTERNATIVE:
                {
                    %>
                    <h2>Варианты ответа</h2>
                    <%
                    
                    long answersCount = 1;
                    
                    foreach(var variantAnswer in answersList)
                    {
                        %>
                        
                        <p>
                            <label for="VariantAnswer<%= Html.Encode(answersCount) %>">Вариант ответа № <%= Html.Encode(answersCount) %></label>
                            <%= Html.TextBox("VariantAnswer" + answersCount.ToString(), variantAnswer.Text)%>
                            <label for="Score<%= Html.Encode(answersCount) %>">Количество баллов за ответ</label>
                            <%= Html.TextBox("Score" + answersCount.ToString(), variantAnswer.Score)%>
                        </p>
                        <p>
                            <% if (answersCount > 1) 
                               {%>
                                <%= Html.ActionLink("Удалить вариант ответа", "DeleteAnswer", new { id = variantAnswer.Id }) %>
                                <%
                               }
                            %>
                        </p>
                        <%
                        ++answersCount;
                    }
                    
                    break;
                }
            case VLKConstants.QUESTION_TYPE_DISTRIBUTIVE:
                {
                    %>
                    <h2>Варианты ответа</h2>
                    <%
                    
                    long answersCount = 1;
                    
                    foreach(var variantAnswer in answersList)
                    {
                        %>
                        
                        <p>
                            <label for="VariantAnswer<%= Html.Encode(answersCount) %>">Вариант ответа № <%= Html.Encode(answersCount) %></label>
                            <%= Html.TextBox("VariantAnswer" + answersCount.ToString(), variantAnswer.Text)%>
                            <label for="Score<%= Html.Encode(answersCount) %>">Количество баллов за ответ</label>
                            <%= Html.TextBox("Score" + answersCount.ToString(), variantAnswer.Score)%>
                        </p>
                        <p>
                            <% if (answersCount > 1) 
                               {%>
                                <%= Html.ActionLink("Удалить вариант ответа", "DeleteAnswer", new { id = variantAnswer.Id }) %>
                                <%
                               }
                            %>
                        </p>
                        <%
                        ++answersCount;
                    }
                    
                    break;
                }
            case VLKConstants.QUESTION_TYPE_FORMULA:
                {
                    %>
                    <h2>Варианты ответа</h2>
                    <%
                    
                    long answersCount = 1;
                    
                    foreach(var variantAnswer in answersList)
                    {
                        %>
                        
                        <p>
                            <label for="VariantAnswer<%= Html.Encode(answersCount) %>">Вариант ответа № <%= Html.Encode(answersCount) %></label>
                            <%= Html.TextBox("VariantAnswer" + answersCount.ToString(), variantAnswer.Text) %>
                            <label for="Score<%= Html.Encode(answersCount) %>">Количество баллов за ответ</label>
                            <%= Html.TextBox("Score" + answersCount.ToString(), variantAnswer.Score)%>
                        </p>
                        <p>
                            <% if (answersCount > 1) 
                               {%>
                                <%= Html.ActionLink("Удалить вариант ответа", "DeleteAnswer", new { id = variantAnswer.Id }) %>
                                <%
                               }
                            %>
                        </p>
                        
                        <%
                        ++answersCount;
                    }
                    
                    break;
                }                                        
         }
         %>
        <p>
            <%= Html.ActionLink("Добавить новый вариант ответа", "CreateAnswer", new { id = question.Id }) %>
        </p>
        <br />
        <p>
            <input type="submit" value="Сохранить" />
        </p>
    <% } %>
    <p>
        <%= Html.ActionLink("Вернуться к списку вопросов по разделу", "List", new { id = question.RazdelId }) %>
    </p>
    
</asp:Content>
