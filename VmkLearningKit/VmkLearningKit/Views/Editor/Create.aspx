<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	�������� �������� �������� / �������� ��������� �������
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
        
        // ������ ��� ��������� id ������ �������� ������
        var newVariantAnswerStartIndex = <%= Html.Encode(VLKConstants.MINIMNUM_ANSWERS_NUMBER) %>;
        
        $(document).ready(function() {
		    
		    // ��������� ��������� ��������� ����� "QuestionForm"
	        $("#QuestionForm").validate({
                focusInvalid: false,
                focusCleanup: true
            });
		
		    /*
			 * ����������� �������� ����������� �� ������ � �������������� plugin'a "ajaxupload".
			 * ��������� ����������� ����� ������������ ������������� wysiwyg-��������� (jHtmlArea).
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
							           $("#ImageLink").empty().append("����������� ����� jpg | png | gif").show();
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
             * ��������� ������� "����� ���� �������"
             *
             */
            $("#QuestionTypeList").change(function(){
                var url;
		        switch ($(this).attr("value")) {
                    case "0" : url = "/Editor/CreateSimple";
							   $("div[class=QuestionFooter]").children(".AnswerAdd").hide();
							   break;
                    case "1" : url = "/Editor/CreateAlternative";  
							   $("div[class=QuestionFooter]").children(".AnswerAdd").show();
							   break;
                    case "2" : url = "/Editor/CreateDistributive";  
							   $("div[class=QuestionFooter]").children(".AnswerAdd").show();
							   break;
                    case "3" : url = "/Editor/CreateFormula";
							   $("div[class=QuestionFooter]").children(".AnswerAdd").hide();
							   break;
                    default  : $("div[class=QuestionFooter]").hide("slow");
							   $("div[class=QuestionEditBlock]").hide("slow").empty();
							   return;
                }
		        
		        $.post(url,
		               {},
                       function(response) {
                           $("div[class=QuestionFooter]").hide("slow", function(){
							   $("div[class=QuestionEditBlock]").hide("slow", function(){
							       $("div[class=QuestionEditBlock]").empty();
							       $("div[class=QuestionEditBlock]").append(response).show("slow", function(){
							           $("div[class=QuestionFooter]").show("slow");
							           
							           // �������� ��� �������� textarea � ���������� class="TextEditor"
									   // �� wysiwyg-��������� (jHtmlArea)
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
									   
									   // ��������� ���������� ��� �������� �����������
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
									   
									   // ��������� ��������� ��������� ����� "QuestionForm"
								       $(document).find("input[id^='<%= Html.Encode(VLKConstants.NEW_VARIANT_ANSWER_SCORE) %>']").each(function(index){
								           $(this).rules("add",
												         { 
													         required: true,
													         number: true, 
													         range: [0, 100],
													         messages: {
														         required: "���������� ������ �� ������� ������ �� ����� ���� ������",
														         number: "���������� ������ �� ������� ������ ������ ���� ������ �� 0 �� 100",
														         range: "���������� ������ �� ������� ������ ������ ���� ������ �� 0 �� 100"
													         }													
												         }
											            );
							           });
							           
							           $("#Title").rules("add",
												         { 
													         required: true,
													         messages: {
														         required: "������� �������� ������� �� ����� ���� ������"
														     }
														 }
														);
							       });
							   });
                           });
                       }
                      );
            });
            
            /*
             * ��������� ������� "���������� �������"
             *
             */
		    $("img[class=QuestionSave]").click(function(){
                if($("#QuestionForm").valid()) {
					document.forms["QuestionForm"].submit();
				}
            });
            
            $("img[class=AnswerAdd]").click(function(){
				var table = $(this).parents("div[class=QuestionFooter]").prevAll("div[class=QuestionEditBlock]").children("table");
				
				var text = "<tr class=\"Editor\">" +
						   "    <td class=\"Editor\" style=\"width:20%\">����� ������:</td>" +
						   "    <td class=\"Editor\" style=\"width:80%\"><div style=\"width:100%\"><textarea id=\"<%= Html.Encode(VLKConstants.NEW_VARIANT_ANSWER_TEXT) %>" + newVariantAnswerStartIndex + "\" name=\"<%= Html.Encode(VLKConstants.NEW_VARIANT_ANSWER_TEXT) %>" + newVariantAnswerStartIndex + "\" class=\"TextEditor\" style=\"width:inherit;height:100px;\" /></div></td>" +
						   "</tr>" +
						   "<tr class=\"Editor\">" +
						   "    <td class=\"Editor\" style=\"width:20%\"><label for=\"<%= Html.Encode(VLKConstants.NEW_VARIANT_ANSWER_SCORE) %>" + newVariantAnswerStartIndex + "\">���������� ������:</label></td>" +
						   "    <td class=\"Editor\" style=\"width:80%\"><div style=\"width:100%\"><input type=\"text\" id=\"<%= Html.Encode(VLKConstants.NEW_VARIANT_ANSWER_SCORE) %>" + newVariantAnswerStartIndex + "\" name=\"<%= Html.Encode(VLKConstants.NEW_VARIANT_ANSWER_SCORE) %>" + newVariantAnswerStartIndex + "\" /></div></td>" +
						   "</tr>" +
						   "<tr class=\"Editor\">" +
                           "    <td class=\"Editor\" colspan=\"2\" rowspan=\"1\" style=\"width:20%\"></td>" + 
                           "    <td class=\"Editor\" style=\"width:80%\"><img class=\"AnswerRemove\" src=\"/Content/Images/remove.png\" title=\"������� ������� ������\" alt=\"�������\" width=\"20\" height=\"20\" /></td>" +
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
					// �������� �������� ������
					if (confirm("�� �������, ��� ������ ������� ������� ������?")) {
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
					                  required: "���������� ������ �� ������� ������ �� ����� ���� ������",
					                  number: "���������� ������ �� ������� ������ ������ ���� ������ �� 0 �� 100",
					                  range: "���������� ������ �� ������� ������ ������ ���� ������ �� 0 �� 100"
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
                },
                "HTML-CSS": { scale: 85 }
            });

        }
	</script>

	  <link href="/Content/test.css" rel="stylesheet" type="text/css" />
    <%
    try
    {
		%>
		<h2>�������� ��������� �������</h2>
		<br />
		<table class="Editor" style="width:100%;">
			<tr class="Editor">
				<td class="Editor" style="width:10%"><b>����������:</b></td>
				<td class="Editor" style="width:60%"><%= Html.Encode(Convert.ToString(ViewData["DisciplineTitle"])) %></td>
				<td class="Editor" style="width:30%"><%= Html.ActionLink("������� � ������ ���������", "Professor", "Cabinet", new { alias = Convert.ToString(ViewData["ProfessorNickName"])}, new { @class = "" })%></td>
			</tr>
			 <tr class="Editor">
				<td class="Editor" style="width:10%"><b>����:</b></td>
				<td class="Editor" style="width:60%"><%= Html.Encode(Convert.ToString(ViewData["TopicTitle"])) %></td>
				<td class="Editor" style="width:30%"><%= Html.ActionLink("������� � ������ ���", "Professor", "Cabinet", new { alias = Convert.ToString(ViewData["ProfessorNickName"]), additional = Convert.ToString(ViewData["DisciplineAlias"])}, new { @class = "" })%></td>
			</tr>
			<tr class="Editor">
				<td class="Editor" style="width:10%"><b>������:</b></td>
				<td class="Editor" style="width:60%"><%= Html.Encode(Convert.ToString(ViewData["RazdelTitle"])) %></td>
				<td class="Editor" style="width:30%"><%= Html.ActionLink("������� � ������ ��������", "Index", "Testing", new { alias = Convert.ToInt64(ViewData["TopicId"]) }, new { @class = "" })%></td>
			</tr>
		</table>
		<br />
		<%
			long                        razdelId         = Convert.ToInt64(ViewData["RazdelId"]);
			IEnumerable<SelectListItem> QuestionTypeList = (IEnumerable<SelectListItem>)ViewData["QuestionTypeList"];

			using (Html.BeginForm("Create", "Editor", new { alias = razdelId }, FormMethod.Post, new { id = "QuestionForm", name = "QuestionForm" }))
			{
				%>
				<p>�������� ��� �������: <%= Html.DropDownList("QuestionTypeList", QuestionTypeList) %></p>
				<div class="QuestionsList">
					<div class="Question">
						<div class="QuestionEditBlock"></div>
						<div class="QuestionFooter">
							<img src="/Content/Images/add.png" title="�������� ������� ������" class="AnswerAdd" alt="��������" width="20" height="20" style="display:none;" />
							<img src="/Content/Images/save.png" title="���������" class="QuestionSave" alt="���������" width="20" height="20" />
						</div>
					</div>
				</div>
				<%
			} 
		%>		
		<div style="display:none;">
			<div id="ImageUploadContainer" style="width:300px; height:130px;">
			    <p align="center" style="background-color:#E2EFFF;">�������� ����������� �� ������</p>
				<p align="center" id="ImageUploading" style="display:none;">
					<img src="/Content/Images/progress.gif" alt="���� ��������" />
				</p>
				<p align="center" id="ImageLink"></p>
				<div id="ImageUploadContainerButtons">
					<p align="center">
						<a href="javascript:void(0);" id="ImageUploadLink">���������</a> | 
						<a href="javascript:void(0);" id="ImageUploadClose" onclick="$.fancybox.close();">�������</a>
					</p>
				</div>
			</div>
		</div>
		<br />
		<p>
			<%= Html.ActionLink("������� � ������ �������� �� �������", "List", new { alias = razdelId }) %>
		</p>
		
		
	<%
	}
	catch (Exception exc)
	{
		Utility.RedirectToErrorPage("Editor/Create: catch exception", exc);
	}
	%>
</asp:Content>
