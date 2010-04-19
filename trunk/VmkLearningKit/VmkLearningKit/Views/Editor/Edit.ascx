<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VmkLearningKit" %>    
    <% 
    Question question = (Question)ViewData["QuestionData"];

    using (Html.BeginForm("Edit", "Editor", new { alias = question.Id }, FormMethod.Post, new { id = "QuestionForm" }))
    {
    %>
        <table class="Editor" style="width:100%;">
        <tr class="Editor">
            <th class="Editor" colspan="2" rowspan="1">Редактирование вопроса</th>
            <th class="Editor"></th>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:15%">
            <label for="Title">Краткое название:</label>
            </td>
            <td class="Editor" style="width:85%">
            <%= Html.TextBox("Title", question.Title, new { style = "width:100%" })%>
            </td>
        </tr>
    <%
        switch (Convert.ToInt32(ViewData["QuestionType"]))
        {
            case VLKConstants.QUESTION_TYPE_SIMPLE:
                {
                    Answer answer = (Answer)ViewData["AnswerData"];
    %>
                    <tr class="Editor">
                        <td class="Editor">
                        <label for="Text">Текст вопроса:</label>
                        </td>
                        <td class="Editor">
                        <%= Html.TextArea("Text", question.Text)%>
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" colspan="2" rowspan="1">
                        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
                        Включить возможность комментирования вопроса студентами
                        </td>
                        <td class="Editor"></td>
                    </tr>
                    <tr class="Editor">
                        <th class="Editor" colspan="2" rowspan="1">Редактирование ответа</th>
                        <th class="Editor"></th>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor">Ответ</td>
                        <td class="Editor">
                        <%= Html.TextArea(VLKConstants.VARIANT_ANSWER_TEXT + answer.Id.ToString(), answer.Text)%>
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor">
                        <label for="<%= VLKConstants.VARIANT_ANSWER_SCORE  + answer.Id.ToString() %>">Количество баллов:</label>
                        </td>
                        <td class="Editor">
                        <%= Html.TextBox(VLKConstants.VARIANT_ANSWER_SCORE + answer.Id.ToString(), answer.Score)%>
                        </td>
                    </tr>
    
    <%
                    break;
                }
            case VLKConstants.QUESTION_TYPE_FORMULA:
                {
                    Answer answer = (Answer)ViewData["AnswerData"];
    %>
                    <tr class="Editor">
                        <td class="Editor">
                        <label for="Text">Текст вопроса:</label>
                        </td>
                        <td class="Editor">
                        <%= Html.TextBox("Text", question.Text)%>
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" colspan="2" rowspan="1">
                        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
                        Включить возможность комментирования вопроса студентами
                        </td>
                        <td class="Editor"></td>
                    </tr>
                    <tr class="Editor">
                        <th class="Editor" colspan="2" rowspan="1">Редактирование ответа</th>
                        <th class="Editor"></th>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor">Ответ</td>
                        <td class="Editor">
                        <%= Html.TextBox(VLKConstants.VARIANT_ANSWER_TEXT + answer.Id.ToString(), answer.Text)%>
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor">
                        <label for="<%= VLKConstants.VARIANT_ANSWER_SCORE  + answer.Id.ToString() %>">Количество баллов:</label>
                        </td>
                        <td class="Editor">
                        <%= Html.TextBox(VLKConstants.VARIANT_ANSWER_SCORE + answer.Id.ToString(), answer.Score)%>
                        </td>
                    </tr>    
    <%
                    break;
                }
            case VLKConstants.QUESTION_TYPE_ALTERNATIVE:
            case VLKConstants.QUESTION_TYPE_DISTRIBUTIVE:
                {
                    IEnumerable<Answer> answersList = (IEnumerable<Answer>)ViewData["AnswerData"];
    %>
                    <tr class="Editor">
                        <td class="Editor">
                        <label for="Text">Текст вопроса:</label>
                        </td>
                        <td class="Editor">
                        <%= Html.TextArea("Text", question.Text)%>
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" colspan="2" rowspan="1">
                        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
                        Включить возможность комментирования вопроса студентами
                        </td>
                        <td class="Editor"></td>
                    </tr>
                    <tr class="Editor">
                        <th class="Editor" colspan="2" rowspan="1">Редактирование вариантов ответа</th>
                        <th class="Editor"></th>
                    </tr>
    <%
                    long answersCount = 1;
                    foreach (var variantAnswer in answersList)
                    {
    %>
                        <tr class="Editor">
                            <td class="Editor">Вариант ответа</td>
                            <td class="Editor">
                            <%= Html.TextArea(VLKConstants.VARIANT_ANSWER_TEXT + variantAnswer.Id.ToString(), variantAnswer.Text)%>
                            </td>
                        </tr>
                        <tr class="Editor">
                            <td class="Editor">
                            <label for="<%= VLKConstants.VARIANT_ANSWER_SCORE + variantAnswer.Id.ToString() %>">Количество баллов:</label>
                            </td>
                            <td class="Editor">
                            <%= Html.TextBox(VLKConstants.VARIANT_ANSWER_SCORE + variantAnswer.Id.ToString(), variantAnswer.Score)%>
                            </td>                
                        </tr>
                        <tr class="Editor">
                            <td class="Editor" colspan="2" rowspan="1"></td>
                            <td class="Editor">
    <%
                            if (answersCount > VLKConstants.MINIMNUM_ANSWERS_NUMBER)
                            {
    %>
                                <img id="<%= Html.Encode("AnswerRemove" + variantAnswer.Id.ToString()) %>" class="AnswerRemove" src="/Content/Images/Remove.png" alt="Удалить вариант ответа" width="20" height="20" />
    <%
                            }
    %>                     
                            </td>
                        </tr>
    <%
                        ++answersCount;
                    }
                    break;
                }
        }
    %>
        </table>
    <%
    }
    %>   
    