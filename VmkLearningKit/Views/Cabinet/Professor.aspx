<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Личный кабинет / Кабинет преподавателя
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="/Scripts/jquery.validate.min.js"></script>
<%
    try
    {
        if (null != ViewData["ProfessorSpecialityDisciplines"] && null != ViewData["Professor"])
        {
            IEnumerable<SpecialityDiscipline> specialityDisciplines = (IEnumerable<SpecialityDiscipline>)ViewData["ProfessorSpecialityDisciplines"];
		%>      
        <script type="text/javascript">
            $(document).ready(function () {
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
                            required: "Название дисциплины не может быть пустым"
                        }
                    }
                });

                $("img[class=RazdelEdit]").click(function () {
                    var editBlock = $(this).parent().nextAll("div[class=RazdelEditBlock]").attr("id");
                    var url = "/Cabinet/EditDiscipline/" + editBlock.substr(9);

                    if ($("#" + editBlock).is(":hidden")) {
                        $.get(url,
	                  {},
                      function (response) {
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
                                      required: "Название дисциплины не может быть пустым"
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

                $("img[class=RazdelDelete]").click(function () {
                    /*if (confirm("Вы уверены, что хотите удалить дисциплину?")) {
                    var editBlock = $(this).parent().nextAll("div[class=RazdelEditBlock]").attr("id");
                    var url = "/Cabinet/Professor/DeleteDiscipline/" + editBlock.substr(9);
                    $.post(url,
                    {}
                    );
                    $(this).parents(".Razdel").animate({ opacity: "hide" }, "slow");
                    }*/
                });

                $("img[class=RazdelCancel]").click(function () {
                    var editBlock = $(this).parent().prevAll("div[class=RazdelEditBlock]").attr("id");

                    $("#" + editBlock).hide("slow").empty();
                    $(this).parent("div[class=RazdelFooter]").hide("slow");
                });

                $("img[class=RazdelSave]").click(function () {
                    if ($("#RazdelForm").valid()) {
                        document.forms["RazdelForm"].submit();
                    }
                });

                $("a[name=RazdelAdd]").click(function () {
                    $("div[class=RazdelEditBlock]").hide("slow").empty();
                    $("div[class=RazdelFooter]").hide("slow");
                    $(this).prevAll("div[class=NewRazdel]").show("slow");
                });

                $("img[class=NewRazdelCancel]").click(function () {
                    $("div[class=NewRazdel]").hide("slow");
                });

                $("img[class=NewRazdelSave]").click(function () {
                    if ($("#NewRazdelForm").valid()) {
                        document.forms["NewRazdelForm"].submit();
                    }
                });
            });
</script>
                <h3>Преподаваемые дисциплины</h3>
				<br />
                <% if (specialityDisciplines.Count() == 0)
                   {%>
                Дисциплины отсутствуют <div class="RazdelsList"> <% }
                   else
                   { %>
				<div class="RazdelsList">
					<div class="MainRazdelHeader">
						<div class="RazdelNumber">№</div>   
						<div class="RazdelTitle">Название</div>
					</div>
				
					<%
    long razdelNumber = 1;
    foreach (SpecialityDiscipline specialityDiscipline in (IEnumerable<SpecialityDiscipline>)ViewData["ProfessorSpecialityDisciplines"])
    {	 
						%>
						<div class="Razdel">
							<div class="RazdelHeader">
								<div class="RazdelNumber"><%= razdelNumber%></div>
								<div class="RazdelTitle">
									<%= Html.ActionLink(specialityDiscipline.Title, "Professor", "Cabinet", new { alias = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName, additional = specialityDiscipline.Alias }, new { @class = "" })%>
								</div>
								<img src="/Content/Images/edit.png" title="Редактировать" class="RazdelEdit" alt="Редактировать" width="20" height="20" />
								
							</div>
							<div id="<%= Html.Encode("EditBlock" + specialityDiscipline.Id.ToString()) %>" class="RazdelEditBlock"></div>
							<div class="RazdelFooter">
								<img src="/Content/Images/save.png" title="Сохранить" class="RazdelSave" alt="Сохранить" width="20" height="20" />
								<img src="/Content/Images/cancel.png" title="Отменить" class="RazdelCancel" alt="Отменить" width="20" height="20" />
							</div>
						</div>
						<%
    ++razdelNumber;
    }
                   }
					%>
					<br />
					<div class="MainRazdelFooter">
						<div class="NewRazdel">
							<%
    using (Html.BeginForm("Professor", "Cabinet", new { alias = "AddDiscipline" }, FormMethod.Post, new { id = "NewRazdelForm", name = "NewRazdelForm" }))
    {
							%>
								<table class="Editor" style="width:100%;">
									<tr>
										<td class="Editor" style="width:20%">
										<label for="NewRazdelTitle">Название дисциплины:</label>
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
								<img src="/Content/Images/save.png" title="Сохранить" class="NewRazdelSave" alt="Сохранить" width="20" height="20" />
								<img src="/Content/Images/cancel.png" title="Отменить" class="NewRazdelCancel" alt="Отменить" width="20" height="20" />
							</div>
						</div>
						<br />
						<a href="javascript:void(0);" name="RazdelAdd" style="cursor:pointer;">Создать дисциплину</a>
					</div>
				</div>
				<%
    }
        else if (null != ViewData["SpecialityDisciplineTopics"] && null != ViewData["Professor"])
        {
            SpecialityDiscipline discipline = (SpecialityDiscipline)ViewData["SpecialityDiscipline"];
            IEnumerable<SpecialityDisciplineTopic> topics = (IEnumerable<SpecialityDisciplineTopic>)ViewData["SpecialityDisciplineTopics"];
            %>

            <script type="text/javascript">
                $(document).ready(function () {
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
                                required: "Название темы не может быть пустым"
                            }
                        }
                    });

                    $("img[class=RazdelEdit]").click(function () {
                        var editBlock = $(this).parent().nextAll("div[class=RazdelEditBlock]").attr("id");
                        var url = "/Cabinet/EditTopic/" + editBlock.substr(9);

                        if ($("#" + editBlock).is(":hidden")) {
                            $.get(url,
	                  {},
                      function (response) {
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
                                      required: "Название темы не может быть пустым"
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

                    $("img[class=RazdelDelete]").click(function () {
                        if (confirm("Вы уверены, что хотите удалить данную тему?")) {
                        var editBlock = $(this).parent().nextAll("div[class=RazdelEditBlock]").attr("id");
                        var url = "/Cabinet/DeleteTopic/" + editBlock.substr(9);
                        $.post(url,
                        {}
                        );
                        $(this).parents(".Razdel").animate({ opacity: "hide" }, "slow");
                        }
                    });

                    $("img[class=RazdelCancel]").click(function () {
                        var editBlock = $(this).parent().prevAll("div[class=RazdelEditBlock]").attr("id");

                        $("#" + editBlock).hide("slow").empty();
                        $(this).parent("div[class=RazdelFooter]").hide("slow");
                    });

                    $("img[class=RazdelSave]").click(function () {
                        if ($("#RazdelForm").valid()) {
                            document.forms["RazdelForm"].submit();
                        }
                    });

                    $("a[name=RazdelAdd]").click(function () {
                        $("div[class=RazdelEditBlock]").hide("slow").empty();
                        $("div[class=RazdelFooter]").hide("slow");
                        $(this).prevAll("div[class=NewRazdel]").show("slow");
                    });

                    $("img[class=NewRazdelCancel]").click(function () {
                        $("div[class=NewRazdel]").hide("slow");
                    });

                    $("img[class=NewRazdelSave]").click(function () {
                        if ($("#NewRazdelForm").valid()) {
                            document.forms["NewRazdelForm"].submit();
                        }
                    });
                });
</script>

            <h3>Список тем</h3>
		<br />
		<table class="Editor" style="width:100%;">
			<tr class="Editor">
				<td class="Editor" style="width:10%"><b>Дисциплина:</b></td>
				<td class="Editor" style="width:60%"><%= Html.Encode(discipline.Title) %></td>
				<td class="Editor" style="width:30%"><%= Html.ActionLink("Перейти к списку дисциплин", "Professor", "Cabinet", new { alias = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName, additional = "" }, new { @class = "" })%></td>
			</tr>
            <tr class="Editor">
				<td class="Editor" style="width:10%"></td>
				<td class="Editor" style="width:60%"></td>
				<td class="Editor" style="width:30%"><%=Html.ActionLink("Перейти к ведомости", "Statement", "Statement", new { alias = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName, additional = discipline.Alias }, new { @class = "" })%></td>
			</tr>
            <tr class="Editor">
				<td class="Editor" style="width:10%" colspan="2"><%=Html.ActionLink("Перейти к программе дисциплины", "Index", "SpecialityDisciplineProgram", new { alias = discipline.Alias }, new { @class = "" })%></td>
				<td class="Editor" style="width:60%"></td>
				<td class="Editor" style="width:30%"></td>
			</tr>
		</table>
        <br />

        <% if (topics.Count() == 0)
                   {%>
                Темы отсутствуют <div class="RazdelsList"> <% }
                   else
                   { %>
				<div class="RazdelsList">
					<div class="MainRazdelHeader">
						<div class="RazdelNumber">№</div>   
						<div class="RazdelTitle">Название</div>
					</div>
				
					<%
    long razdelNumber = 1;
    foreach (SpecialityDisciplineTopic topic in topics)
    {	 
						%>
						<div class="Razdel">
							<div class="RazdelHeader">
								<div class="RazdelNumber"><%= razdelNumber%></div>
								<div class="RazdelTitle">
                                    <% if (topic.Title.Length < 80)
                                       {%>
									    <%= Html.ActionLink(topic.Title, "Index", "Testing", new { alias = topic.Id }, new { @class = "" })%>
								    <% }
                                       else
                                       {%>
                                        <%= Html.ActionLink(topic.Title.Substring(0, 80) + " ... ", "Index", "Testing", new { alias = topic.Id }, new { @class = "" })%>   
                                       <%}%>
                                </div>
								<img src="/Content/Images/edit.png" title="Редактировать" class="RazdelEdit" alt="Редактировать" width="20" height="20" />
								<img src="/Content/Images/delete.png" title="Удалить" class="RazdelDelete" alt="Удалить" width="20" height="20" />
							</div>
							<div id="<%= Html.Encode("EditBlock" + topic.Id.ToString()) %>" class="RazdelEditBlock"></div>
							<div class="RazdelFooter">
								<img src="/Content/Images/save.png" title="Сохранить" class="RazdelSave" alt="Сохранить" width="20" height="20" />
								<img src="/Content/Images/cancel.png" title="Отменить" class="RazdelCancel" alt="Отменить" width="20" height="20" />
							</div>
						</div>
						<%
    ++razdelNumber;
    }
                   }
					%>
					<br />
					<div class="MainRazdelFooter">
						<div class="NewRazdel">
							<%
    using (Html.BeginForm("Professor", "Cabinet", new { alias = "AddTopic", additional = discipline.Id }, FormMethod.Post, new { id = "NewRazdelForm", name = "NewRazdelForm" }))
    {
							%>
								<table class="Editor" style="width:100%;">
									<tr>
										<td class="Editor" style="width:20%">
										<label for="NewRazdelTitle">Название темы:</label>
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
								<img src="/Content/Images/save.png" title="Сохранить" class="NewRazdelSave" alt="Сохранить" width="20" height="20" />
								<img src="/Content/Images/cancel.png" title="Отменить" class="NewRazdelCancel" alt="Отменить" width="20" height="20" />
							</div>
						</div>
						<br />
						<a href="javascript:void(0);" name="RazdelAdd" style="cursor:pointer;">Создать тему</a>
					</div>
				</div>

            <%
        }
    }
    catch (Exception exc)
    {
        Utility.RedirectToErrorPage("Testing/Index: catch exception", exc);
    }
		
	%>
</asp:Content>    
    
    
    
    
    
    