<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Список тестовых вопросов
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Список тестовых вопросов</h2>
    <table>
        <tr>
            <th>Номер</th>
            <th>Краткое название</th>
            <th>Тип</th>
            <th></th>
            <th></th>
        </tr>
        
        <% 
            IEnumerable<Question> questionsList  = (IEnumerable<Question>)ViewData["QuestionsList"];

            long questionNumber = 1;
           
            foreach (var question in questionsList)
            { 
        %>
        
        <tr>
            <td>
                <%= Html.Encode(questionNumber) %>
            </td>
            <td>
                <% 
                    if (question.Title.Equals(String.Empty))
                    {
                        %>
                        <%= Html.Encode(question.Text) %>
                        <%
                    }
                    else
                    {
                        %>
                        <%= Html.Encode(question.Title) %>
                        <%
                    }
                %>
            </td>
            <td>
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
            </td>
            <td>
                <%= Html.ActionLink("Редактировать", "Edit", new { id = question.Id })%>
            </td>
            <td>
                <%= Html.ActionLink("Удалить", "Delete", new { id = question.Id }) %>
            </td>
        </tr>
        <% 
            ++questionNumber;
                
            } 
        %>
    </table>
    
    <p>
        <%= Html.ActionLink("Создать новый вопрос", "Create") %>
        <%= Html.ActionLink("Загрузить из файла", "Create") %>
    </p>

</asp:Content>
