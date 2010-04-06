<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	������ �������� ��������
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>������ �������� ��������</h2>
    <table>
        <tr>
            <th>�����</th>
            <th>������� ��������</th>
            <th>���</th>
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
                                <%= Html.Encode("�������") %>
                                <%
                                
                                break;
                            }
                        case VLKConstants.QUESTION_TYPE_ALTERNATIVE:
                            {
                                %>
                                <%= Html.Encode("��������������") %>
                                <%
                                
                                break;
                            }
                        case VLKConstants.QUESTION_TYPE_DISTRIBUTIVE:
                            {
                                %>
                                <%= Html.Encode("��������������") %>
                                <%
                                
                                break;
                            }
                        case VLKConstants.QUESTION_TYPE_FORMULA:
                            {
                                %>
                                <%= Html.Encode("�������") %>
                                <%
                                
                                break;
                            }                            
                    }
                %>
            </td>
            <td>
                <%= Html.ActionLink("�������������", "Edit", new { id = question.Id })%>
            </td>
            <td>
                <%= Html.ActionLink("�������", "Delete", new { id = question.Id }) %>
            </td>
        </tr>
        <% 
            ++questionNumber;
                
            } 
        %>
    </table>
    
    <p>
        <%= Html.ActionLink("������� ����� ������", "Create") %>
        <%= Html.ActionLink("��������� �� �����", "Create") %>
    </p>

</asp:Content>
