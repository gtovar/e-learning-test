<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Тестирование / Список разделов
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
		$("#NewRazdelForm").validate({
			focusInvalid: false,
			focusCleanup: true,
			rules: {
				NewRazdelTitle: {
					required: true
				}
			},
			messages: {
				NewRazdelTitle: {
					required: "Название раздела не может быть пустым"
				}
			}
		});
		
		$("img[class=RazdelEdit]").click(function(){
            var editBlock = $(this).parent().nextAll("div[class=RazdelEditBlock]").attr("id");
            var url       = "/Testing/EditRazdel/" + editBlock.substr(9);
            
            if ($("#" + editBlock).is(":hidden")) {
                $.get(url,
	                  {},
                      function(response) {
						  $("div[class=NewRazdel]").hide("slow");
                          $("div[class=RazdelEditBlock]").hide("slow").empty();
                          $("div[class=RazdelFooter]").hide("slow");
                          $("#" + editBlock).append(response).show("slow");
                          $("#" + editBlock).nextAll("div[class=RazdelFooter]").show("slow");
                          
                          $("#RazdelForm").validate({
							  focusInvalid: false,
							  focusCleanup: true,
							  rules: {
								  Title: {
							          required: true
							      }
						      },
						      messages: {
						 	      Title: {
								      required: "Название раздела не может быть пустым"
							      }
						      }
						  });
                      }
                     );
            }
            else {
                $("div[class=RazdelEditBlock]").hide("slow").empty();
                $("div[class=RazdelFooter]").hide("slow");
            }
        });
	    
        $("img[class=RazdelDelete]").click(function(){
            if (confirm("Вы уверены, что хотите удалить раздел?")) {
				var editBlock = $(this).parent().nextAll("div[class=RazdelEditBlock]").attr("id");
				var url       = "/Testing/DeleteRazdel/" + editBlock.substr(9);
				$.post(url,
					   {}
					  );
				$(this).parents(".Razdel").animate({ opacity: "hide" }, "slow");
			}
	    });
	    
	    $("img[class=RazdelCancel]").click(function(){
            var editBlock = $(this).parent().prevAll("div[class=RazdelEditBlock]").attr("id");
            
            $("#" + editBlock).hide("slow").empty();
            $(this).parent("div[class=RazdelFooter]").hide("slow");
	    });
	    
	    $("img[class=RazdelSave]").click(function(){
            if($("#RazdelForm").valid()) {
				document.forms["RazdelForm"].submit();
			}
        });
        
        $("a[name=RazdelAdd]").click(function(){
			$("div[class=RazdelEditBlock]").hide("slow").empty();
            $("div[class=RazdelFooter]").hide("slow");
            $(this).prevAll("div[class=NewRazdel]").show("slow");
        });
        
        $("img[class=NewRazdelCancel]").click(function(){
            $("div[class=NewRazdel]").hide("slow");
	    });
	    
	    $("img[class=NewRazdelSave]").click(function(){
            if($("#NewRazdelForm").valid()) {
				document.forms["NewRazdelForm"].submit();
			}
        });
	});
</script>

<%
	try
	{
		string disciplineTitle	= Convert.ToString(ViewData["DisciplineTitle"]);
		string topicTitle		= Convert.ToString(ViewData["TopicTitle"]);
		
		IEnumerable<Razdel> razdelsList = (IEnumerable<Razdel>)ViewData["RazdelsList"];
		%>
		<h2>Список разделов</h2>
		<br />
		<table class="Editor" style="width:100%;">
			<tr class="Editor">
				<td class="Editor" style="width:10%"><b>Дисциплина:</b></td>
				<td class="Editor" style="width:60%"><%= Html.Encode(disciplineTitle) %></td>
				<td class="Editor" style="width:30%"><%= Html.ActionLink("Перейти к списку дисциплин", "Professor", "Cabinet", new { alias = Convert.ToString(ViewData["ProfessorNickName"])}, new { @class = "" })%></td>
			</tr>
			 <tr class="Editor">
				<td class="Editor" style="width:10%"><b>Тема:</b></td>
				<td class="Editor" style="width:60%"><%= Html.Encode(topicTitle) %></td>
				<td class="Editor" style="width:30%"><%= Html.ActionLink("Перейти к списку тем", "Professor", "Cabinet", new { alias = Convert.ToString(ViewData["ProfessorNickName"]), additional = Convert.ToString(ViewData["DisciplineAlias"])}, new { @class = "" })%></td>
			</tr>
		</table>
		<%
			if (razdelsList.Count<Razdel>() == 0)
			{
				%>
				<br />
				<p>По данной теме не было создано ни одного раздела</p>
				<div class="RazdelsList">
					<div class="MainRazdelFooter">
						<div class="NewRazdel">
							<%
							using (Html.BeginForm("AddRazdel", "Testing", new { alias = Convert.ToInt64(ViewData["TopicId"]) }, FormMethod.Post, new { id = "NewRazdelForm", name = "NewRazdelForm" }))
							{
							%>
								<table class="Editor" style="width:100%;">
									<tr>
										<td class="Editor" style="width:20%">
										<label for="NewRazdelTitle">Название раздела:</label>
										</td>
										<td class="Editor" style="width:80%">
										<%= Html.TextBox("NewRazdelTitle", String.Empty, new { style = "width:100%" })%>
										</td>
									</tr>
								</table>
							<%
							}
							%>
							<div class="NewRazdelFooter">
								<img src="/Content/Images/save.png" class="NewRazdelSave" alt="Сохранить" width="20" height="20" />
								<img src="/Content/Images/cancel.png" class="NewRazdelCancel" alt="Отменить" width="20" height="20" />
							</div>
						</div>
						<br />
						<a href="javascript:void(0);" name="RazdelAdd" style="cursor:pointer;">Добавить раздел</a>
					</div>
				</div>			
				<%
			}
			else
			{
				%>
				<br />
				<div class="RazdelsList">
					<div class="MainRazdelHeader">
						<div class="RazdelNumber">№</div>   
						<div class="RazdelTitle">Название</div>
					</div>
				
					<%
					long razdelNumber = 1;
					foreach (var razdel in razdelsList)
					{	 
						%>
						<div class="Razdel">
							<div class="RazdelHeader">
								<div class="RazdelNumber"><%= razdelNumber %></div>
								<div class="RazdelTitle">
									<%= Html.ActionLink(razdel.Title, "List", "Editor", new { alias = razdel.Id }, new { @class = "" }) %>
								</div>
								<img src="/Content/Images/edit.png" class="RazdelEdit" alt="Редактировать" width="20" height="20" />
								<img src="/Content/Images/delete.png" class="RazdelDelete" alt="Удалить" width="20" height="20" />
							</div>
							<div id="<%= Html.Encode("EditBlock" + razdel.Id.ToString()) %>" class="RazdelEditBlock"></div>
							<div class="RazdelFooter">
								<img src="/Content/Images/save.png" class="RazdelSave" alt="Сохранить" width="20" height="20" />
								<img src="/Content/Images/cancel.png" class="RazdelCancel" alt="Отменить" width="20" height="20" />
							</div>
						</div>
						<%
						++razdelNumber;
					}
					%>
					<br />
					<div class="MainRazdelFooter">
						<div class="NewRazdel">
							<%
							using (Html.BeginForm("AddRazdel", "Testing", new { alias = Convert.ToInt64(ViewData["TopicId"]) }, FormMethod.Post, new { id = "NewRazdelForm", name = "NewRazdelForm" }))
							{
							%>
								<table class="Editor" style="width:100%;">
									<tr>
										<td class="Editor" style="width:20%">
										<label for="NewRazdelTitle">Название раздела:</label>
										</td>
										<td class="Editor" style="width:80%">
										<%= Html.TextBox("NewRazdelTitle", String.Empty, new { style = "width:100%" })%>
										</td>
									</tr>
								</table>
							<%
							}
							%>
							<div class="NewRazdelFooter">
								<img src="/Content/Images/save.png" class="NewRazdelSave" alt="Сохранить" width="20" height="20" />
								<img src="/Content/Images/cancel.png" class="NewRazdelCancel" alt="Отменить" width="20" height="20" />
							</div>
						</div>
						<br />
						<a href="javascript:void(0);" name="RazdelAdd" style="cursor:pointer;">Создать раздел</a> | 
						<%= Html.ActionLink("Перейти к плану генерации", "GetPlanGeneration", "PlanGeneration", new { topicId = Convert.ToInt64(ViewData["TopicId"]) }, new { @class = "" })%>
					</div>
				</div>
				<%
			}
	}
	catch(Exception exc)
	{
		Utility.RedirectToErrorPage("Testing/Index: catch exception", exc);
	}
		
	%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
