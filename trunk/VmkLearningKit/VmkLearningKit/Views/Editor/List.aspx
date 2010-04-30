<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Редактор тестовых вопросов / Список тестовых вопросов
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/Scripts/Plugins/JHtmlArea/scripts/jHtmlArea-0.7.0.js"></script>
    <link rel="stylesheet" type="text/css" href="/Scripts/Plugins/JHtmlArea/style/jHtmlArea.css" />
    <script type="text/javascript" src="/Scripts/Plugins/JHtmlArea/scripts/jHtmlArea.ColorPickerMenu-0.7.0.js"></script>
    <link rel="stylesheet" type="text/css" href="/Scripts/Plugins/JHtmlArea/style/jHtmlArea.ColorPickerMenu.css" />
	<script type="text/javascript">
        $(document).ready(function(){
            $("img[class=QuestionEdit]").click(function(){
                var editBlock = $(this).parent().nextAll("div[class=QuestionEditBlock]").attr("id");
                var url       = "/Editor/Edit/" + editBlock.substr(9);
                
                if ($("#" + editBlock).is(":hidden")) {
                    $.get(url,
		                  {},
                          function(response) {
                              $("div[class=QuestionFooter]").slideUp("slow");
							  $("div[class=QuestionEditBlock]").slideUp("slow", function(){
							      $("div[class=QuestionEditBlock]").empty();
							      $("#" + editBlock).append(response);
							  });
							  
							  $("#" + editBlock).slideDown("slow", function(){
								  $("#" + editBlock).nextAll("div[class=QuestionFooter]").slideDown("slow");
								  
								  // Заменяем все элементы textarea с аттрибутом class="TextEditor"
						   		  // на wysiwyg-редакторы (jHtmlArea)
								  $("textarea[class=TextEditor]").htmlarea();
							  });
					      }
                         );
                }
                else {
                    $("#" + editBlock).nextAll("div[class=QuestionFooter]").slideUp("slow");
                    $("#" + editBlock).slideUp("slow", function(){
                        $("#" + editBlock).empty();
                    });
                }
            });
		    
            $("img[class=QuestionDelete]").click(function(){
                if (confirm("Вы уверены, что хотите удалить вопрос?")) {
					var editBlock = $(this).parent().nextAll("div[class=QuestionEditBlock]").attr("id");
					var url       = "/Editor/Delete/" + editBlock.substr(9);
					$.post(url,
						   {}
						  );
					$(this).parents(".Question").animate({ opacity: "hide" }, "slow");
				}
		    });
		    
		    $("img[class=QuestionCancel]").click(function(){
                var editBlock = $(this).parent().prevAll("div[class=QuestionEditBlock]").attr("id");
                
                $(this).parent("div[class=QuestionFooter]").slideUp("slow");
                $("#" + editBlock).slideUp("slow", function(){
					$("#" + editBlock).empty();
                });                
		    });
		    
		    $("img[class=QuestionSave]").click(function(){
                document.forms["QuestionForm"].submit();
            });
            
            $("#LoadFromFile").click(function(){
                if ($("div[class=UploadContainer]").is(":hidden")) {
                    $("div[class=QuestionEditBlock]").slideUp("slow").empty();
                    $("div[class=QuestionFooter]").slideUp("slow");
                    $("div[class=UploadContainer]").show("slow");                    
                }
                else {
                    $("div[class=UploadContainer]").hide("slow");
                }
            });
		});
    </script>
    <script src="/Scripts/MathJax/MathJax.js" type="text/javascript">
        //
        //  This script call is what gets MathJax loaded and running
        //
        {
            MathJax.Hub.Config({
                jax: ["input/TeX", "output/HTML-CSS"],    // input is TeX and output is HTML-CSS format
                extensions: ["tex2jax.js"],              // use the tex2jax preprocessor
                tex2jax: {
                    //    inlineMath: [['$','$'],['\\(','\\)']], // uncomment to use $...$ for inline math
                    processEscapes: 1                      // set to 1 to allow \$ to produce a dollar sign
                }
            });

        }
	
	</script>	  

	<link href="/Content/test.css" rel="stylesheet" type="text/css" /> 
    <%
		try
		{ 
            IEnumerable<Question> questionsList  = (IEnumerable<Question>)ViewData["QuestionsList"];
            long razdelId                        = Convert.ToInt64(ViewData["RazdelId"]);

            long questionNumber = 1;
    %>
    <h2>Список тестовых вопросов</h2>
    <table class="Editor" style="width:100%;">
        <tr class="Editor">
            <td class="Editor" style="width:10%"><b>Дисциплина:</b></td>
            <td class="Editor" style="width:60%"><%= Html.Encode(Convert.ToString(ViewData["DisciplineTitle"])) %></td>
            <td class="Editor" style="width:30%"><%= Html.ActionLink("Перейти к списку дисциплин", "Professor", "Cabinet", new { alias = Convert.ToString(ViewData["ProfessorNickName"])}, new { @class = "" })%></td>
        </tr>
         <tr class="Editor">
            <td class="Editor" style="width:10%"><b>Тема:</b></td>
            <td class="Editor" style="width:60%"><%= Html.Encode(Convert.ToString(ViewData["TopicTitle"])) %></td>
            <td class="Editor" style="width:30%"><%= Html.ActionLink("Перейти к списку тем", "Professor", "Cabinet", new { alias = Convert.ToString(ViewData["ProfessorNickName"]), additional = Convert.ToString(ViewData["DisciplineAlias"])}, new { @class = "" })%></td>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:10%"><b>Раздел:</b></td>
            <td class="Editor" style="width:60%"><%= Html.Encode(Convert.ToString(ViewData["RazdelTitle"])) %></td>
            <td class="Editor" style="width:30%"><%= Html.ActionLink("Перейти к списку разделов", "Index", "Testing", new { alias = Convert.ToInt64(ViewData["TopicId"]) }, new { @class = "" })%></td>
        </tr>
	</table>
	
	<%
	if (questionsList.Count<Question>() == 0)
	{
	%>
		<br />
		<p>По данному разделу нет ни одного тестового вопроса</p>
	<%
	}
	else
	{
	%>
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
                    <div class="QuestionNumber"><%= Html.Encode(questionNumber) %></div>
                    <div class="QuestionTitle"><%= Html.Encode(question.Title) %></div>
                    <div class="QuestionType">
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
                    </div>
                    <img src="/Content/Images/edit.png" class="QuestionEdit" alt="Редактировать" width="20" height="20" />
                    <img src="/Content/Images/delete.png" class="QuestionDelete" alt="Удалить" width="20" height="20" />
                </div>
                <div id="<%= Html.Encode("EditBlock" + question.Id.ToString()) %>" class="QuestionEditBlock"></div>
                <div class="QuestionFooter">
                    <% 
                       if (question.Type == VLKConstants.QUESTION_TYPE_DISTRIBUTIVE || question.Type == VLKConstants.QUESTION_TYPE_ALTERNATIVE)
                       {
                           %>
                            <img src="/Content/Images/add.png" class="AnswerAdd" alt="Добавить вариант ответа" width="20" height="20" />
                           <%
                       }
                    %>
                    <img src="/Content/Images/save.png" class="QuestionSave" alt="Сохранить" width="20" height="20" />
                    <img src="/Content/Images/cancel.png" class="QuestionCancel" alt="Отменить" width="20" height="20" />
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
            <%= Html.ActionLink("Создать новый вопрос", "Create", new { alias = razdelId }, new { id = "CreateNew" })%> | 
            <a id="LoadFromFile" style="cursor:pointer;">Загрузить из файла</a>
        </p>
        <div class="UploadContainer">
            <% using (Html.BeginForm("Upload", "Editor", new { alias = razdelId }, FormMethod.Post, new { enctype = "multipart/form-data" }))
               { %>
                    <p>Выберите word-документ в формате <b>.doc</b> и нажмите кнопку <b>добавить</b></p>
                    <p>
                        <input type="file" id="FileUpload" name="FileUpload" value="Обзор" class="Button" />
                        <input type="submit" value="Добавить" class="Button" />
                    </p>
            <% } %>
        </div>
        <%
    }
    catch (Exception exc)
    {
		Utility.RedirectToErrorPage("Editor/List: catch exception", exc);
    }
%>
 
</asp:Content>
