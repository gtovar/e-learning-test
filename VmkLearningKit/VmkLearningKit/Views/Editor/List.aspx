<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	�������� �������� �������� / ������ �������� ��������
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
	<script type="text/javascript">
        $(document).ready(function(){
            new AjaxUpload($("#ImageUploadLink"), 
						   {
						       autoSubmit: true,
							   action: "/Editor/ImageUpload",
							   name: "UploadedImage",
							   responseType: "json",
							   
							   onSubmit: function(file, extension) {
							       $("#ImageLink").hide().empty();
							       $("#ImageUploading").show();
							   },
							   
							   onComplete: function(file, response) {
							       $("#ImageUploading").hide();
							       $("#ImageLink").append(response).show();
                               }
                           }
            );
            
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
								  
								  // �������� ��� �������� textarea � ���������� class="TextEditor"
						   		  // �� wysiwyg-��������� (jHtmlArea)
								  $("textarea[class=TextEditor]").htmlarea();
								  
								  $("a[class=image]").click(function(){
									   var associatedFrame = $(this).parents("div[class=ToolBar]").next("div").children("iframe")[0];
									   $.fancybox({
									       "href": "#ImageUploadContainer",
									       "titleShow": false,
									       "modal": true,
									       "onClosed": function() {
										       associatedFrame.contentWindow.focus();
										       associatedFrame.contentWindow.document.execCommand("insertimage", false, $("#ImageLink").html());
										   }
								       }); 
								   });
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
                if (confirm("�� �������, ��� ������ ������� ������?")) {
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
            });
            
            $("#HideUploadContainer").click(function(){
                $("div[class=UploadContainer]").hide("slow");
            });
            
            $("#UploadAndParse").fancybox({
			    "titleShow": false,
			    "modal": true,
			    "onComplete": function() { document.forms["UploadWordForm"].submit(); }
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
    <h2>������ �������� ��������</h2>
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
	
	<%
	if (questionsList.Count<Question>() == 0)
	{
	%>
		<br />
		<p>�� ������� ������� ��� �� ������ ��������� �������</p>
	<%
	}
	else
	{
	%>
		<div class="QuestionsList">
            <div class="MainQuestionHeader">
                <div class="QuestionNumber">�</div>   
                <div class="QuestionTitle">������� ��������</div> 
                <div class="QuestionType">��� �������</div> 
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
                    </div>
                    <img src="/Content/Images/edit.png" class="QuestionEdit" alt="�������������" width="20" height="20" />
                    <img src="/Content/Images/delete.png" class="QuestionDelete" alt="�������" width="20" height="20" />
                </div>
                <div id="<%= Html.Encode("EditBlock" + question.Id.ToString()) %>" class="QuestionEditBlock"></div>
                <div class="QuestionFooter">
                    <% 
                       if (question.Type == VLKConstants.QUESTION_TYPE_DISTRIBUTIVE || question.Type == VLKConstants.QUESTION_TYPE_ALTERNATIVE)
                       {
                           %>
                            <img src="/Content/Images/add.png" class="AnswerAdd" alt="�������� ������� ������" width="20" height="20" />
                           <%
                       }
                    %>
                    <img src="/Content/Images/save.png" class="QuestionSave" alt="���������" width="20" height="20" />
                    <img src="/Content/Images/cancel.png" class="QuestionCancel" alt="��������" width="20" height="20" />
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
			<div id="ImageUploadContainer" style="height:80px;">
				<p align="center" id="ImageUploading" style="display:none;">
					<img src="/Content/Images/progress.gif" />
				</p>
				<p align="center" id="ImageLink" style="width:400px;"></p>
				<div id="ImageUploadContainerButtons">
					<p align="center">
						<a href="javascript:void(0);" id="ImageUploadLink">���������</a>
						<a href="javascript:void(0);" id="ImageUploadClose" onclick="$.fancybox.close();">�������</a>
					</p>
				</div>
			</div>
		</div>
		<div style="display:none;">
			<div id="UploadAndParseContainer">
				<p align="center">
					����������� �������� �������� ��������.
				</p>
				<p align="center">����������, ���������</p>
			</div>
		</div>
        <br />
        <p>
            <%= Html.ActionLink("������� ����� ������", "Create", new { alias = razdelId }, new { id = "CreateNew" })%> | 
            <a  href="javascript:void(0);" id="LoadFromFile" style="cursor:pointer;">��������� �� �����</a>
        </p>
        <div class="UploadContainer">
            <% using (Html.BeginForm("Upload", "Editor", new { alias = razdelId }, FormMethod.Post, new { enctype = "multipart/form-data", id = "UploadWordForm", name = "UploadWordForm" }))
               { %>
                    <p align="center">�������� word-�������� � ������� <b>.doc</b> � ������� <b>��������</b></p>
                    <p align="center">
                        <input type="file" id="FileUpload" name="FileUpload" value="�����" class="Button" /> 
                    </p>
                    <p align="center">    
                        <a href="#UploadAndParseContainer" id="UploadAndParse">��������</a> | <a href="javascript:void(0);" id="HideUploadContainer">������</a>
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
