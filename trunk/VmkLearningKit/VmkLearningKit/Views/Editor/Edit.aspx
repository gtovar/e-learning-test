<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="VmkLearningKit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �������������� ��������� �������
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>�������������� ��������� �������</h2>
    
    <%  Question            question    = (Question)ViewData["QuestionData"];
        IEnumerable<Answer> answersList = (IEnumerable<Answer>)ViewData["AnswerData"];
        
        using (Html.BeginForm())
        {%>
    <p>��� �������: 
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
    </p>
    <p>
        <label for="Title">������� ��������: </label>
        <%= Html.TextBox("Title", question.Title) %>
    </p>
    <p>
        <label for="Text">����� �������: </label>
        <%= Html.TextBox("Text", question.Text) %>
    </p>
    <p>
        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
        �������� ����������� ��������������� ������� ����������
    </p>
    <p>
        <label for="DoubleGroup">����� ������ �����-��������: </label>
        <%= Html.TextBox("DoubleGroup", question.DoubleGroup) %>
    </p>
    <p>
        <label for="ExclusionGroup">����� ������ ��������-����������: </label>
        <%= Html.TextBox("ExclusionGroup", question.ExclusionGroup)%>
    </p>
    <%
        switch (question.Type)
        {
            case VLKConstants.QUESTION_TYPE_SIMPLE:
                {
                    %>
                    <h2>�����</h2>
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
                    <h2>�������� ������</h2>
                    <%
                    
                    long answersCount = 1;
                    
                    foreach(var variantAnswer in answersList)
                    {
                        %>
                        
                        <p>
                            <label for="VariantAnswer<%= Html.Encode(answersCount) %>">������� ������ � <%= Html.Encode(answersCount) %></label>
                            <%= Html.TextBox("VariantAnswer" + answersCount.ToString(), variantAnswer.Text)%>
                            <label for="Score<%= Html.Encode(answersCount) %>">���������� ������ �� �����</label>
                            <%= Html.TextBox("Score" + answersCount.ToString(), variantAnswer.Score)%>
                        </p>
                        <p>
                            <% if (answersCount > 1) 
                               {%>
                                <%= Html.ActionLink("������� ������� ������", "DeleteAnswer", new { id = variantAnswer.Id }) %>
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
                    <h2>�������� ������</h2>
                    <%
                    
                    long answersCount = 1;
                    
                    foreach(var variantAnswer in answersList)
                    {
                        %>
                        
                        <p>
                            <label for="VariantAnswer<%= Html.Encode(answersCount) %>">������� ������ � <%= Html.Encode(answersCount) %></label>
                            <%= Html.TextBox("VariantAnswer" + answersCount.ToString(), variantAnswer.Text)%>
                            <label for="Score<%= Html.Encode(answersCount) %>">���������� ������ �� �����</label>
                            <%= Html.TextBox("Score" + answersCount.ToString(), variantAnswer.Score)%>
                        </p>
                        <p>
                            <% if (answersCount > 1) 
                               {%>
                                <%= Html.ActionLink("������� ������� ������", "DeleteAnswer", new { id = variantAnswer.Id }) %>
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
                    <h2>�������� ������</h2>
                    <%
                    
                    long answersCount = 1;
                    
                    foreach(var variantAnswer in answersList)
                    {
                        %>
                        
                        <p>
                            <label for="VariantAnswer<%= Html.Encode(answersCount) %>">������� ������ � <%= Html.Encode(answersCount) %></label>
                            <%= Html.TextBox("VariantAnswer" + answersCount.ToString(), variantAnswer.Text) %>
                            <label for="Score<%= Html.Encode(answersCount) %>">���������� ������ �� �����</label>
                            <%= Html.TextBox("Score" + answersCount.ToString(), variantAnswer.Score)%>
                        </p>
                        <p>
                            <% if (answersCount > 1) 
                               {%>
                                <%= Html.ActionLink("������� ������� ������", "DeleteAnswer", new { id = variantAnswer.Id }) %>
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
            <%= Html.ActionLink("�������� ����� ������� ������", "CreateAnswer", new { id = question.Id }) %>
        </p>
        <br />
        <p>
            <input type="submit" value="���������" />
        </p>
    <% } %>
    <p>
        <%= Html.ActionLink("��������� � ������ �������� �� �������", "List", new { id = question.RazdelId }) %>
    </p>
    
</asp:Content>
