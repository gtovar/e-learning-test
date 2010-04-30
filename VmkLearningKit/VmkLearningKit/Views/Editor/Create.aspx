<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Редактор тестовых вопросов / Создание тестового вопроса
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/Scripts/Plugins/JHtmlArea/scripts/jHtmlArea-0.7.0.js"></script>
    <link rel="stylesheet" type="text/css" href="/Scripts/Plugins/JHtmlArea/style/jHtmlArea.css" />
    <script type="text/javascript" src="/Scripts/Plugins/JHtmlArea/scripts/jHtmlArea.ColorPickerMenu-0.7.0.js"></script>
    <link rel="stylesheet" type="text/css" href="/Scripts/Plugins/JHtmlArea/style/jHtmlArea.ColorPickerMenu.css" />
	<script type="text/javascript">
        $(document).ready(function() {
            $("#QuestionTypeList").change(function(){
                var url;
		        switch ($(this).attr("value")) {
                    case "0" : url = "/Editor/CreateSimple";       break;
                    case "1" : url = "/Editor/CreateAlternative";  break;
                    case "2" : url = "/Editor/CreateDistributive"; break;
                    case "3" : url = "/Editor/CreateFormula";      break;
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
							           
							           // Заменяем все элементы textarea с аттрибутом class="TextEditor"
									   // на wysiwyg-редакторы (jHtmlArea)
									   $("textarea[class=TextEditor]").htmlarea();
							       });
							   });
                           });
                       }
                      );
            });
            
            $("img[class=QuestionSave]").click(function(){
                document.forms["QuestionForm"].submit();
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
		%>
		<h2>Создание тестового вопроса</h2>
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
		<br />
		<%
			long                        razdelId         = Convert.ToInt64(ViewData["RazdelId"]);
			IEnumerable<SelectListItem> QuestionTypeList = (IEnumerable<SelectListItem>)ViewData["QuestionTypeList"];

			using (Html.BeginForm("Create", "Editor", new { alias = razdelId }, FormMethod.Post, new { id = "QuestionForm" }))
			{
				%>
				<p>Выберите тип вопроса: <%= Html.DropDownList("QuestionTypeList", QuestionTypeList) %></p>
				<div class="QuestionsList">
					<div class="Question">
						<div class="QuestionEditBlock"></div>
						<div class="QuestionFooter">
							<img src="/Content/Images/save.png" class="QuestionSave" alt="Сохранить" width="20" height="20" />
						</div>
					</div>
				</div>
				<%
			} 
		%>
		<br />
		<p>
			<%= Html.ActionLink("Вернуться к списку вопросов по разделу", "List", new { alias = razdelId }) %>
		</p>
	<%
	}
	catch (Exception exc)
	{
		Utility.RedirectToErrorPage("Editor/Create: catch exception", exc);
	}
	%>
</asp:Content>
