<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Редактор тестовых вопросов / Восстановление тестовых вопросов
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {

            /*
             * Обработка события "Восстановление вопроса"
             *
             */
            $("img[class=QuestionRestore]").click(function() {

                var questionId = $(this).attr("id").substr(7);

                /*
                 * Формируем url страницы для восстановления вопроса.
                 * Идентификтор вопроса (в БД) заложен в полученный аттрибут.
                 *
                 */

                var url = "/Editor/RestoreQuestion/" + questionId;

                $.post(url,
					   {},
					   function(response) {
					       var restored      = "#Restored" + questionId;
					       var restore       = "#Restore" + questionId;
					       var cancelRestore = "#CancelRestore" + questionId;

					       $(restore).hide("slow");
					       $(restored).show("slow");
					       $(cancelRestore).show("slow");
					   }
					  );
			});

			/*
			 * Обработка события "Отмена восстановления вопроса"
			 *
			 */
			$("img[class=QuestionCancelRestore]").click(function() {

			    var questionId = $(this).attr("id").substr(13);

			    /*
			     * Формируем url страницы для восстановления вопроса.
			     * Идентификтор вопроса (в БД) заложен в полученный аттрибут.
			     *
			     */

			    var url = "/Editor/Delete/" + questionId;

			    $.post(url,
				       {},
				       function(response) {
				           var restored      = "#Restored" + questionId;
				           var restore       = "#Restore" + questionId;
				           var cancelRestore = "#CancelRestore" + questionId;

				           $(restore).show("slow");
				           $(restored).hide("slow");
				           $(cancelRestore).hide("slow");
				       }
				      );
			});
        });
    </script>
    <%
        try
        {
            IEnumerable<Question> questionsList = (IEnumerable<Question>)ViewData["QuestionsList"];
            long razdelId = Convert.ToInt64(ViewData["RazdelId"]);

            long questionNumber = 1;
    %>
    <h2>Восстановление тестовых вопросов</h2>
    <br />
    <table class="Editor" style="width:100%;">
        <tr class="Editor">
            <td class="Editor" style="width:10%"><b>Дисциплина:</b></td>
            <td class="Editor" style="width:60%"><%= Html.Encode(Convert.ToString(ViewData["DisciplineTitle"]))%></td>
            <td class="Editor" style="width:30%"><%= Html.ActionLink("Перейти к списку дисциплин", "Professor", "Cabinet", new { alias = Convert.ToString(ViewData["ProfessorNickName"]) }, new { @class = "" })%></td>
        </tr>
         <tr class="Editor">
            <td class="Editor" style="width:10%"><b>Тема:</b></td>
            <td class="Editor" style="width:60%"><%= Html.Encode(Convert.ToString(ViewData["TopicTitle"]))%></td>
            <td class="Editor" style="width:30%"><%= Html.ActionLink("Перейти к списку тем", "Professor", "Cabinet", new { alias = Convert.ToString(ViewData["ProfessorNickName"]), additional = Convert.ToString(ViewData["DisciplineAlias"]) }, new { @class = "" })%></td>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:10%"><b>Раздел:</b></td>
            <td class="Editor" style="width:60%"><%= Html.Encode(Convert.ToString(ViewData["RazdelTitle"]))%></td>
            <td class="Editor" style="width:30%"><%= Html.ActionLink("Перейти к списку разделов", "Index", "Testing", new { alias = Convert.ToInt64(ViewData["TopicId"]) }, new { @class = "" })%></td>
        </tr>
	</table>
	
	<%
        if (questionsList.Count<Question>() == 0)
        {
	%>
		<br />
		<p>По данному разделу нет ни одного удаленного тестового вопроса</p>
	<%
        }
        else
        {
	%>
	    <br />
		<div class="QuestionsList">
            <div class="MainQuestionHeader">
                <div class="QuestionNumber">№</div>   
                <div class="QuestionTitle">Краткое название</div> 
                <div class="QuestionType">Тип вопроса</div> 
            </div>
        <%
           
        foreach (var question in questionsList)
        { 
        %>
            <div class="Question">
                <div class="QuestionHeader">
                    <div class="QuestionNumber"><%= Html.Encode(questionNumber)%></div>
                    <div class="QuestionTitle"><%= Html.Encode(question.Title)%></div>
                    <div class="QuestionType">
                    <%
                    switch (question.Type)
                    {
                        case VLKConstants.QUESTION_TYPE_SIMPLE:
                            {
                                                %>
                                                <%= Html.Encode("Простой")%>
                                                <%
                                                
                                break;
                            }
                        case VLKConstants.QUESTION_TYPE_ALTERNATIVE:
                            {
                                                %>
                                                <%= Html.Encode("Альтернативный")%>
                                                <%
                                                
                                break;
                            }
                        case VLKConstants.QUESTION_TYPE_DISTRIBUTIVE:
                            {
                                                %>
                                                <%= Html.Encode("Дистрибутивный")%>
                                                <%
                                                
                                break;
                            }
                        case VLKConstants.QUESTION_TYPE_FORMULA:
                            {
                                                %>
                                                <%= Html.Encode("Формула")%>
                                                <%
                                                
                                break;
                            }
                    }
                    %>
                    </div>
                    <img id="<%= Html.Encode("Restored" + question.Id.ToString())%>" src="/Content/Images/apply.png" class="QuestionRestored" alt="Восстановлено" width="20" height="20" />
                    <img id="<%= Html.Encode("Restore" + question.Id.ToString()) %>" src="/Content/Images/add.png" title="Восстановить" class="QuestionRestore" alt="Восстановить" width="20" height="20" />
                    <img id="<%= Html.Encode("CancelRestore" + question.Id.ToString())%>" src="/Content/Images/cancel.png" title="Удалить" class="QuestionCancelRestore" alt="Отмена" width="20" height="20" />
                </div>
                </div>
                <% 
                ++questionNumber;
            } 
            %>
            </div>
        <%
        }
        %>
        <br />
        <p>
            <%= Html.ActionLink("Вернуться к списку вопросов", "List", new { alias = razdelId })%> 
        </p>
    <%
    }
    catch (Exception exc)
    {
        Utility.RedirectToErrorPage("Editor/Restore: catch exception", exc);
    } 
    %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
