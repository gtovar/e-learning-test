<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VmkLearningKit" %>    
    <% 
    Question question = (Question)ViewData["QuestionData"];

    using (Html.BeginForm("Edit", "Editor", new { alias = question.Id }, FormMethod.Post, new { id = "QuestionForm" }))
    {
    %>
        <table style="width:100%;">
        <tr>
            <th colspan="2" rowspan="1">�������������� �������</th>
            <th></th>
        </tr>
        <tr>
            <td style="width:15%">
            <label for="Title">������� ��������:</label>
            </td>
            <td style="width:85%">
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
                    <tr>
                        <td>
                        <label for="Text">����� �������:</label>
                        </td>
                        <td>
                        <%= Html.TextArea("Text", question.Text)%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" rowspan="1">
                        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
                        �������� ����������� ��������������� ������� ����������
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th colspan="2" rowspan="1">�������������� ������</th>
                        <th></th>
                    </tr>
                    <tr>
                        <td>�����</td>
                        <td>
                        <%= Html.TextArea(VLKConstants.VARIANT_ANSWER_TEXT + answer.Id.ToString(), answer.Text)%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <label for="<%= VLKConstants.VARIANT_ANSWER_SCORE  + answer.Id.ToString() %>">���������� ������:</label>
                        </td>
                        <td>
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
                    <tr>
                        <td>
                        <label for="Text">����� �������:</label>
                        </td>
                        <td>
                        <%= Html.TextBox("Text", question.Text)%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" rowspan="1">
                        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
                        �������� ����������� ��������������� ������� ����������
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th colspan="2" rowspan="1">�������������� ������</th>
                        <th></th>
                    </tr>
                    <tr>
                        <td>�����</td>
                        <td>
                        <%= Html.TextBox(VLKConstants.VARIANT_ANSWER_TEXT + answer.Id.ToString(), answer.Text)%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <label for="<%= VLKConstants.VARIANT_ANSWER_SCORE  + answer.Id.ToString() %>">���������� ������:</label>
                        </td>
                        <td>
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
                    <tr>
                        <td>
                        <label for="Text">����� �������:</label>
                        </td>
                        <td>
                        <%= Html.TextArea("Text", question.Text)%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" rowspan="1">
                        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
                        �������� ����������� ��������������� ������� ����������
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th colspan="2" rowspan="1">�������������� ��������� ������</th>
                        <th></th>
                    </tr>
    <%
                    long answersCount = 1;
                    foreach (var variantAnswer in answersList)
                    {
    %>
                        <tr>
                            <td>������� ������</td>
                            <td>
                            <%= Html.TextArea(VLKConstants.VARIANT_ANSWER_TEXT + variantAnswer.Id.ToString(), variantAnswer.Text)%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <label for="<%= VLKConstants.VARIANT_ANSWER_SCORE + variantAnswer.Id.ToString() %>">���������� ������:</label>
                            </td>
                            <td>
                            <%= Html.TextBox(VLKConstants.VARIANT_ANSWER_SCORE + variantAnswer.Id.ToString(), variantAnswer.Score)%>
                            </td>                
                        </tr>
                        <tr>
                            <td colspan="2" rowspan="1"></td>
                            <td>
    <%
                            if (answersCount > VLKConstants.MINIMNUM_ANSWERS_NUMBER)
                            {
    %>
                                <img id="<%= Html.Encode("AnswerRemove" + variantAnswer.Id.ToString()) %>" class="AnswerRemove" src="/Content/Images/Remove.png" alt="������� ������� ������" width="20" height="20" />
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
    