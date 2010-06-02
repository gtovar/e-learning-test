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
	<script type="text/javascript" src="/Scripts/Plugins/FancyBox/scripts/jquery.fancybox-1.3.1.js"></script>
	<link rel="stylesheet" type="text/css" href="/Scripts/Plugins/FancyBox/style/jquery.fancybox-1.3.1.css" media="screen" />
	<script type="text/javascript" src="/Scripts/Plugins/AjaxUpload/ajaxupload.js"></script>
	<script type="text/javascript" src="/Scripts/jquery.validate.min.js"></script>
	<script type="text/javascript">
        
        // Индекс для аттрибута id нового варианта ответа
        var newVariantAnswerStartIndex = 0;
        
        $(document).ready(function(){
			
			/*
			 * Асинхронная загрузка изображений на сервер с использованием plugin'a "ajaxupload".
			 * Расширяет стандартный набор возможностей используемого wysiwyg-редактора (jHtmlArea).
			 *
			 */
			new AjaxUpload($("#ImageUploadLink"), 
						   {
						       autoSubmit: true,
							   action: "/Editor/ImageUpload",
							   name: "UploadedImage",
							   responseType: "json",
							   
							   onSubmit: function(file, ext) {
							       if ((ext && /^(jpg|png|jpeg|gif)$/i.test(ext))) {
							           $("#ImageLink").hide().empty();
							           $("#ImageUploading").show();
							           $("#ImageUploadContainerButtons").hide();
							       }
							       else {
							           $("#ImageLink").empty().append("Используйте файлы jpg | png | gif").show();
							           return false;
							       }
							   },
							   
							   onComplete: function(file, response) {
							       $("#ImageUploadContainerButtons").show();
							       $("#ImageUploading").hide();
							       $("#ImageLink").append(response);
							       
							       if($("#ImageLink").html().substring(0, 4) == "http") {
									   $.fancybox.close();
								   }
							       else {
							           $("#ImageLink").show("slow");
							       }
                               }
                           }
            );
            
            /*
             * Обработка события "Редактирование вопроса"
             *
             */            
            $("img[class=QuestionEdit]").click(function(){
                
                // Получаем атрибут id ближайшего элемента div с классом "QuestionEditBlock"
                var editBlock = $(this).parent().nextAll("div[class=QuestionEditBlock]").attr("id");
                
                /*
                 * Формируем url страницы, содержащей подробную информацию о вопросе.
                 * Идентификтор вопроса (в БД) заложен в полученный аттрибут.
                 *
                 */
                var url       = "/Editor/Edit/" + editBlock.substr(9);
                
                // Загружаем/Скрываем полученную информацию о вопросе                
                if ($("#" + editBlock).is(":hidden")) {
                    $.get(url,
		                  {},
                          function(response) {
                              $("div[class=QuestionFooter]").hide("slow");
							  $("div[class=QuestionEditBlock]").hide("slow", function(){
							      $("div[class=QuestionEditBlock]").empty();
							      $("#" + editBlock).append(response);
							  });
							  
							  $("#" + editBlock).show("slow", function(){
								  $("#" + editBlock).nextAll("div[class=QuestionFooter]").show("slow");
								  
								  // Заменяем все элементы textarea с аттрибутом class="TextEditor"
						   		  // на wysiwyg-редакторы (jHtmlArea)
								  $("textarea[class=TextEditor]").htmlarea({
									  toolbar: ["forecolor", "|", 
												"bold", "italic", "underline", "strikethrough", "|", 
												"subscript", "superscript", "|",
												"increasefontsize", "decreasefontsize", "|",
												"orderedlist", "unorderedlist", "|",
												"indent", "outdent", "|",
												"link", "unlink", "image", "horizontalrule", "|",
												"cut", "copy", "paste", "|",
												"html"
												]
								  });
								  
								  // Добавляем обработчик для загрузки изображений
								  $("a[class=image]").click(function(){
									   var associatedFrame = $(this).parents("div[class=ToolBar]").next("div").children("iframe")[0];
									   $.fancybox({
									       "href": "#ImageUploadContainer",
									       "titleShow": false,
									       "modal": true,
									       "onClosed": function() {
										       if ($("#ImageLink").html().substring(0, 4) == "http") {
												   associatedFrame.contentWindow.focus();
										           associatedFrame.contentWindow.document.execCommand("insertimage", false, $("#ImageLink").html());
										           $("#ImageLink").empty();
										       }
										       else {
												   $("#ImageLink").empty();
										       }
										   }
								       }); 
								   });
								   
								   // Добавляем обработчик для удаления вариантов ответа
								   $("img[class=AnswerRemove]").click(function(){
										if (confirm("Вы уверены, что хотите удалить вариант ответа?")) {
											var currentRow = $(this).parents("tr")[0];
							                
											$(currentRow).prev("tr").remove();
											$(currentRow).prev("tr").remove();
											$(currentRow).remove();
										}
								   });
								   
								   // Добавляем валидацию элементов формы "QuestionForm"
								   $("#QuestionForm").validate({
							           focusInvalid: false,
							           focusCleanup: true,
							           rules: {
							               Title: { 
							                   required: true 
							               }
							           },
							           messages: {
							               Title: { 
							                   required: "Краткое название вопроса не может быть пустым" 
							               }
							           }
							       });
							       
							       $(document).find("input[id^='<%= Html.Encode(VLKConstants.VARIANT_ANSWER_SCORE) %>']").each(function(index){
								       $(this).rules("add",
												     { 
													     required: true,
													     number: true, 
													     range: [0, 100],
													     messages: {
														     required: "Количество баллов за вариант ответа не может быть пустым",
														     number: "Количество баллов за вариант ответа должно быть числом от 0 до 100",
														     range: "Количество баллов за вариант ответа должно быть числом от 0 до 100"
													     }													
												     }
											        );
							       });
							  });
					      }
                         );
                }
                else {
                    $("#" + editBlock).nextAll("div[class=QuestionFooter]").hide("slow");
                    $("#" + editBlock).hide("slow", function(){
                        $("#" + editBlock).empty();
                    });
                }
            });
		    
		    /*
             * Обработка события "Удаление вопроса"
             *
             */
            $("img[class=QuestionDelete]").click(function(){
                if (confirm("Вы уверены, что хотите удалить вопрос?")) {
					
					// Получаем атрибут id ближайшего элемента div с классом "QuestionEditBlock"
					var editBlock = $(this).parent().nextAll("div[class=QuestionEditBlock]").attr("id");
					
					/*
                     * Формируем url страницы для удаления вопроса.
                     * Идентификтор вопроса (в БД) заложен в полученный аттрибут.
                     *
                     */
					var url       = "/Editor/Delete/" + editBlock.substr(9);
					$.post(url,
						   {}
						  );
					$(this).parents(".Question").animate({ opacity: "hide" }, "slow");
				}
		    });
		    
		    /*
             * Обработка события "Отмена редактирования вопроса"
             *
             */
		    $("img[class=QuestionCancel]").click(function(){
                
                // Получаем атрибут id ближайшего элемента div с классом "QuestionEditBlock"
                var editBlock = $(this).parent().prevAll("div[class=QuestionEditBlock]").attr("id");
                
                $(this).parent("div[class=QuestionFooter]").hide("slow");
                $("#" + editBlock).hide("slow", function(){
					$("#" + editBlock).empty();
                });                
		    });
		    
		    /*
             * Обработка события "Сохранение вопроса"
             *
             */
		    $("img[class=QuestionSave]").click(function(){
                if($("#QuestionForm").valid()) {
					document.forms["QuestionForm"].submit();
				}
            });
		    
		    /*
             * Обработка события "Загрузка списка вопросов из файла"
             *
             */
            $("#LoadFromFile").click(function(){
                if ($("div[class=UploadContainer]").is(":hidden")) {
                    $("div[class=QuestionEditBlock]").hide("slow").empty();
                    $("div[class=QuestionFooter]").hide("slow");
                    $("div[class=UploadContainer]").show("slow");                    
                }
            });
            
            /*
             * Обработка события "Отмена загрузки списка вопросов из файла"
             *
             */
            $("#HideUploadContainer").click(function(){
                $("div[class=UploadContainer]").hide("slow");
            });
            
            $("#UploadAndParse").fancybox({
			    "titleShow": false,
			    "modal": true,
			    "onComplete": function() { document.forms["UploadWordForm"].submit(); }
	        });
	        
	        /*
             * Обработка события "Добавление варианта ответа"
             *
             */
	        $("img[class=AnswerAdd]").click(function(){
				var table = $(this).parents("div[class=QuestionFooter]").prevAll("div[class=QuestionEditBlock]").children("form").children("table");

				var text = "<tr class=\"Editor\">" +
						   "    <td class=\"Editor\" style=\"width:20%\">Текст ответа:</td>" +
						   "    <td class=\"Editor\" style=\"width:80%\"><div style=\"width:100%\"><textarea id=\"<%= Html.Encode(VLKConstants.NEW_VARIANT_ANSWER_TEXT) %>" + newVariantAnswerStartIndex + "\" name=\"<%= Html.Encode(VLKConstants.NEW_VARIANT_ANSWER_TEXT) %>" + newVariantAnswerStartIndex + "\" class=\"TextEditor\" style=\"width:inherit;height:100px;\" /></div></td>" +
						   "</tr>" +
						   "<tr class=\"Editor\">" +
						   "    <td class=\"Editor\" style=\"width:20%\"><label for=\"<%= Html.Encode(VLKConstants.NEW_VARIANT_ANSWER_SCORE) %>" + newVariantAnswerStartIndex + "\">Количество баллов:</label></td>" +
						   "    <td class=\"Editor\" style=\"width:80%\"><div style=\"width:100%\"><input type=\"text\" id=\"<%= Html.Encode(VLKConstants.NEW_VARIANT_ANSWER_SCORE) %>" + newVariantAnswerStartIndex + "\" name=\"<%= Html.Encode(VLKConstants.NEW_VARIANT_ANSWER_SCORE) %>" + newVariantAnswerStartIndex + "\" /></div></td>" +
						   "</tr>" +
						   "<tr class=\"Editor\">" +
                           "    <td class=\"Editor\" colspan=\"2\" rowspan=\"1\" style=\"width:20%\"></td>" +
                           "    <td class=\"Editor\" style=\"width:80%\"><img class=\"AnswerRemove\" src=\"/Content/Images/remove.png\" title=\"Удалить вариант ответа\" alt=\"Удалить\" width=\"20\" height=\"20\" /></td>" +
						   "</tr>";
				
				$(table).append(text);
				
				$("textarea[id=<%= Html.Encode(VLKConstants.NEW_VARIANT_ANSWER_TEXT) %>" + newVariantAnswerStartIndex + "]").htmlarea({
		 	        toolbar: ["forecolor", "|", 
						"bold", "italic", "underline", "strikethrough", "|", 
						"subscript", "superscript", "|",
						"increasefontsize", "decreasefontsize", "|",
						"orderedlist", "unorderedlist", "|",
						"indent", "outdent", "|",
						"link", "unlink", "image", "horizontalrule", "|",
						"cut", "copy", "paste", "|",
						"html"
						]
			    });
			    
			    $("a[class=image]").click(function(){
				    var associatedFrame = $(this).parents("div[class=ToolBar]").next("div").children("iframe")[0];
				    $.fancybox({
					    "href": "#ImageUploadContainer",
					    "titleShow": false,
					    "modal": true,
					    "onClosed": function() {
						    if ($("#ImageLink").html().substring(0, 4) == "http") {
						 	    associatedFrame.contentWindow.focus();
						 	    associatedFrame.contentWindow.document.execCommand("insertimage", false, $("#ImageLink").html());
							    $("#ImageLink").empty();
						    }
						    else {
							    $("#ImageLink").empty();
						    }
					    }
				    }); 
				});
				
				$("img[class=AnswerRemove]").click(function(){
					if (confirm("Вы уверены, что хотите удалить вариант ответа?")) {
						var currentRow = $(this).parents("tr")[0];
		                
						$(currentRow).prev("tr").remove();
						$(currentRow).prev("tr").remove();
						$(currentRow).remove();
					}
				});
				
				var newVariantAnswerScore = "#" + "<%= Html.Encode(VLKConstants.NEW_VARIANT_ANSWER_SCORE) %>" + newVariantAnswerStartIndex;
				
				$(newVariantAnswerScore).rules("add",
			                  { 
				                  required: true,
				                  number: true, 
				                  range: [0, 100],
				                  messages: {
					                  required: "Количество баллов за вариант ответа не может быть пустым",
					                  number: "Количество баллов за вариант ответа должно быть числом от 0 до 100",
					                  range: "Количество баллов за вариант ответа должно быть числом от 0 до 100"
				                  }													
			                  }
		        );
			    
			    ++newVariantAnswerStartIndex;
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
    <br />
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
	    <br />
	    <p>
	        <%= Html.ActionLink("Группы вопросов-дублеров", "Grouping", new { alias = VLKConstants.QUESTION_GROUP_DOUBLE , additional = razdelId }) %> | 
	        <%= Html.ActionLink("Группы вопросов-исключений", "Grouping", new { alias = VLKConstants.QUESTION_GROUP_EXCLUSION , additional = razdelId }) %>
	    </p>
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
                    <div class="QuestionTitle"><%= Html.ActionLink(question.Title, "Question", new { alias = question.Id }) %></div>
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
                    <img src="/Content/Images/edit.png" title="Редактировать" class="QuestionEdit" alt="Редактировать" width="20" height="20" />
                    <img src="/Content/Images/delete.png" title="Удалить" class="QuestionDelete" alt="Удалить" width="20" height="20" />
                </div>
                <div id="<%= Html.Encode("EditBlock" + question.Id.ToString()) %>" class="QuestionEditBlock"></div>
                <div class="QuestionFooter">
                    <% 
                       if (question.Type == VLKConstants.QUESTION_TYPE_DISTRIBUTIVE || question.Type == VLKConstants.QUESTION_TYPE_ALTERNATIVE)
                       {
                           %>
                            <img src="/Content/Images/add.png" title="Добавить вариант ответа" class="AnswerAdd" alt="Добавить" width="20" height="20" />
                           <%
                       }
                    %>
                    <img src="/Content/Images/save.png" title="Сохранить" class="QuestionSave" alt="Сохранить" width="20" height="20" />
                    <img src="/Content/Images/cancel.png" title="Отменить редактирование" class="QuestionCancel" alt="Отменить" width="20" height="20" />
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
        <div style="display:none;">
			<div id="ImageUploadContainer" style="width:300px; height:130px;">
			    <p align="center" style="background-color:#E2EFFF;">Загрузка изображений на сервер</p>
				<p align="center" id="ImageUploading" style="display:none;">
					<img src="/Content/Images/progress.gif" alt="Идет загрузка" />
				</p>
				<p align="center" id="ImageLink"></p>
				<div id="ImageUploadContainerButtons">
					<p align="center">
						<a href="javascript:void(0);" id="ImageUploadLink">Загрузить</a> | 
						<a href="javascript:void(0);" id="ImageUploadClose" onclick="$.fancybox.close();">Закрыть</a>
					</p>
				</div>
			</div>
		</div>
		<div style="display:none;">
			<div id="UploadAndParseContainer">
			    <p align="center">
					Выполняется загрузка тестовых вопросов.
				</p>
				<p align="center">
			        <img src="/Content/Images/progress.gif" alt="Идет загрузка" />
			    </p>
				<p align="center">Пожалуйста, подождите</p>
			</div>
		</div>
        <br />
        <p>
            <%= Html.ActionLink("Создать вопрос", "Create", new { alias = razdelId })%> | 
            <%= Html.ActionLink("Восстановить вопрос", "Restore", new { alias = razdelId })%> | 
            <a  href="javascript:void(0);" id="LoadFromFile" style="cursor:pointer;">Загрузить из файла</a>
        </p>
        <div class="UploadContainer">
            <% using (Html.BeginForm("Upload", "Editor", new { alias = razdelId }, FormMethod.Post, new { enctype = "multipart/form-data", id = "UploadWordForm", name = "UploadWordForm" }))
               { %>
                    <p align="center">Выберите word-документ в формате <b>.doc</b> и нажмите <b>добавить</b></p>
                    <p align="center">
                        <input type="file" id="FileUpload" name="FileUpload" value="Обзор" class="Button" /> 
                    </p>
                    <p align="center">    
                        <a href="#UploadAndParseContainer" id="UploadAndParse">Добавить</a> | <a href="javascript:void(0);" id="HideUploadContainer">Отмена</a>
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
