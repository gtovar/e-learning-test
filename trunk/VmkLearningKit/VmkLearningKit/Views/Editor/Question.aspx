<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Редактор тестовых вопросов / Редактирование тестового вопроса
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

	    $(document).ready(function() {

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

						           if ($("#ImageLink").html().substring(0, 4) == "http") {
						               $.fancybox.close();
						           }
						           else {
						               $("#ImageLink").show("slow");
						           }
						       }
						   }
            );

	        /*
	         * Обработка события "Сохранение вопроса"
	         *
	         */
	        $("img[class=QuestionSave]").click(function() {
	            if ($("#QuestionForm").valid()) {
	                document.forms["QuestionForm"].submit();
	            }
	        });

	        /*
	         * Обработка события "Добавление варианта ответа"
	         *
	         */
	        $("img[class=AnswerAdd]").click(function() {
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

	            $("a[class=image]").click(function() {
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

	            $("img[class=AnswerRemove]").click(function() {
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

	        var questionUrl = '/Editor/Edit/' + '<%= Convert.ToString(ViewData["QuestionId"]) %>';

	        $.get(questionUrl,
	              {},
	              function(response) {
	                  $("div[class=QuestionEditBlock]").empty().append(response);
					  
					  $("div[class=QuestionEditBlock]").show("fast", function(){
						  
						  $("div[class=QuestionFooter]").show();
						  
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
	    });
        
    </script>
    
    <%
        try
        {
            int questionType = (int)ViewData["QuestionType"];
    %>
    <h2>Редактирование тестового вопроса</h2>
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
	<br />
	<div class="QuestionsList">
	    <div class="Question">
            <div class="QuestionEditBlock"></div>
            <div class="QuestionFooter">
                <% 
                   if (questionType == VLKConstants.QUESTION_TYPE_DISTRIBUTIVE || questionType == VLKConstants.QUESTION_TYPE_ALTERNATIVE)
                   {
                       %>
                        <img src="/Content/Images/add.png" title="Добавить вариант ответа" class="AnswerAdd" alt="Добавить" width="20" height="20" />
                       <%
                   }
                %>
                <img src="/Content/Images/save.png" title="Сохранить" class="QuestionSave" alt="Сохранить" width="20" height="20" />
            </div>
        </div>
    </div>
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
    <%
        }
        catch (Exception exc)
        {
            Utility.RedirectToErrorPage("Editor/Question: catch exception", exc);
        } 
    %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
