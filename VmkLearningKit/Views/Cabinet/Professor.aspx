<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    e��� � ����������� ��� / ������ ������� / ������� �������������
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
                            required: "�������� ���������� �� ����� ���� ������"
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
                                      required: "�������� ���������� �� ����� ���� ������"
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
                    /*if (confirm("�� �������, ��� ������ ������� ����������?")) {
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
                <h3>������������� ����������</h3>
				<br />
                <% if (specialityDisciplines.Count() == 0)
                   {%>
                ���������� ����������� <div class="RazdelsList"> <% }
                   else
                   { %>
				<div class="RazdelsList">
					<div class="MainRazdelHeader">
						<div class="RazdelNumber">�</div>   
						<div class="RazdelTitle">��������</div>
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
								<img src="/Content/Images/edit.png" title="�������������" class="RazdelEdit" alt="�������������" width="20" height="20" />
								
							</div>
							<div id="<%= Html.Encode("EditBlock" + specialityDiscipline.Id.ToString()) %>" class="RazdelEditBlock"></div>
							<div class="RazdelFooter">
								<img src="/Content/Images/save.png" title="���������" class="RazdelSave" alt="���������" width="20" height="20" />
								<img src="/Content/Images/cancel.png" title="��������" class="RazdelCancel" alt="��������" width="20" height="20" />
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
										<label for="NewRazdelTitle">�������� ����������:</label>
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
								<img src="/Content/Images/save.png" title="���������" class="NewRazdelSave" alt="���������" width="20" height="20" />
								<img src="/Content/Images/cancel.png" title="��������" class="NewRazdelCancel" alt="��������" width="20" height="20" />
							</div>
						</div>
						<br />
						<a href="javascript:void(0);" name="RazdelAdd" style="cursor:pointer;">������� ����������</a>
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
                                required: "�������� ���� �� ����� ���� ������"
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
                                      required: "�������� ���� �� ����� ���� ������"
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
                        if (confirm("�� �������, ��� ������ ������� ������ ����?")) {
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

            <h3>������ ���</h3>
		<br />
		<table class="Editor" style="width:100%;">
			<tr class="Editor">
				<td class="Editor" style="width:10%"><b>����������:</b></td>
				<td class="Editor" style="width:60%"><%= Html.Encode(discipline.Title) %></td>
				<td class="Editor" style="width:30%"><%= Html.ActionLink("������� � ������ ���������", "Professor", "Cabinet", new { alias = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName, additional = "" }, new { @class = "" })%></td>
			</tr>
            <tr class="Editor">
				<td class="Editor" style="width:10%"></td>
				<td class="Editor" style="width:60%"></td>
				<td class="Editor" style="width:30%"><%=Html.ActionLink("������� � ���������", "Statement", "Statement", new { alias = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName, additional = discipline.Alias }, new { @class = "" })%></td>
			</tr>
            <tr class="Editor">
				<td class="Editor" style="width:10%" colspan="2"><%=Html.ActionLink("������� � ��������� ����������", "Index", "SpecialityDisciplineProgram", new { alias = discipline.Alias }, new { @class = "" })%></td>
				<td class="Editor" style="width:60%"></td>
				<td class="Editor" style="width:30%"></td>
			</tr>
		</table>
        <br />

        <% if (topics.Count() == 0)
                   {%>
                ���� ����������� <div class="RazdelsList"> <% }
                   else
                   { %>
				<div class="RazdelsList">
					<div class="MainRazdelHeader">
						<div class="RazdelNumber">�</div>   
						<div class="RazdelTitle">��������</div>
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
								<img src="/Content/Images/edit.png" title="�������������" class="RazdelEdit" alt="�������������" width="20" height="20" />
								<img src="/Content/Images/delete.png" title="�������" class="RazdelDelete" alt="�������" width="20" height="20" />
							</div>
							<div id="<%= Html.Encode("EditBlock" + topic.Id.ToString()) %>" class="RazdelEditBlock"></div>
							<div class="RazdelFooter">
								<img src="/Content/Images/save.png" title="���������" class="RazdelSave" alt="���������" width="20" height="20" />
								<img src="/Content/Images/cancel.png" title="��������" class="RazdelCancel" alt="��������" width="20" height="20" />
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
										<label for="NewRazdelTitle">�������� ����:</label>
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
								<img src="/Content/Images/save.png" title="���������" class="NewRazdelSave" alt="���������" width="20" height="20" />
								<img src="/Content/Images/cancel.png" title="��������" class="NewRazdelCancel" alt="��������" width="20" height="20" />
							</div>
						</div>
						<br />
						<a href="javascript:void(0);" name="RazdelAdd" style="cursor:pointer;">������� ����</a>
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
    
    
    
    
    
    