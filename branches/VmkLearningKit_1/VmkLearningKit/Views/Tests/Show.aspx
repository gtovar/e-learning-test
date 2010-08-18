<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Вариант
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/themes.css" rel="stylesheet" type="text/css" />
    <% string UnitName = "Тестовый вариант №" + Convert.ToString(Convert.ToInt64(ViewData["TestNumber"]) + 1);%>
    <table class="bodytable" height="100%" width="85%" align="center">
        <tr>
            <td class="banner">
                <span lrece="true">
                    <%=UnitName%></span>
            </td>
        </tr>
        <tr>
            <td class="bodycell" valign="top" height="100%">
                <span id="questionsTable" lrece="true">
                    <% RepositoryManager repositoryManager =
                RepositoryManager.GetRepositoryManager;
                       IGeneratedQuestionRepository generatedQuestionRepository =
                           repositoryManager.GetGeneratedQuestionRepository;
                       IQuestionRepository questionRepository =
                           repositoryManager.GetQuestionRepository;

                       IEnumerable<GeneratedQuestion> generatedQuestion =
                           generatedQuestionRepository.GetAllGeneratedQuestionsByGeneratedTestVariantId(Convert.ToInt64(ViewData["Id"]));

                       int index = 1;

                       foreach (GeneratedQuestion gq in generatedQuestion)
                       {
                    %>
                    <table class="QTable" width="95%" lreq2="3">
                        <%int QuestionNum = index;%>
                        <tr style="vertical-align: baseline">
                            <td class="QNum">
                                <nobr><%=QuestionNum%>.</nobr>
                            </td>
                            <td class="QText" style="width: 100%" colspan="3">
                                <%= gq.Question.Text %>
                                <br />
                            </td>
                            <td class="QPts" style="text-align: right">
                                <font face="Arial,Helvetica,sans-serif" size="2">
                                    <nobr><b></b></nobr>
                                </font>
                            </td>
                        </tr>
                        <% int count = questionRepository.GetAnswersCountByQuestionId(gq.QuestionId);
                           IEnumerable<Answer> answers = questionRepository.GetAllAnswersByQuestionId(gq.QuestionId);

                           int l = 0;

                           foreach (Answer an in answers)
                           {

                               switch (gq.Question.Type)
                               {
                                   case 0:
                                       {%>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="text" name="Q<%= index %>_<%= l %>" size="20" value="" />
                            </td>
                            <%break;
                                       }
                                   case 1:
                                       {%>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="radio" name="Q<%= index %>" value="<%= l+1 %>" />
                            </td>
                            <td class="ANum">
                                <nobr><!--<%= l + 1 %>.--></nobr>
                            </td>
                            <td class="AText" width="100%">
                                <%= an.Text %>
                            </td>
                            <%break;
                                       }
                                   case 2:
                                       {%>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="checkbox" name="Q<%= index %>" value="<%= l+1 %>" />
                            </td>
                            <td class="ANum">
                                <nobr><!--<%= l + 1 %>.--></nobr>
                            </td>
                            <td class="AText" width="100%">
                                <%= an.Text %>
                            </td>
                            <%break;
                                       }
                                   case 3:
                                       {%>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="text" name="Q<%= index %>_<%= l %>" size="20" value="" id="Q<%= index %>_<%= l %>" />
                            </td>
                            <%break;
                                       }
                               }%>
                            <td>
                            </td>
                        </tr>
                        <% l++;
                           }%>
                    </table>
                    <% index++;
                       }%>
                </span>
            </td>
        </tr>
    </table>
    <div align="center">
        <%= Html.ActionLink("Назад", "GetTest", new { alias = Convert.ToInt64(ViewData["TestId"]) })%></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
