<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Редактор тестовых вопросов / Распределение вопросов по группам
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .Grouping  
        {
            list-style-type: none; 
            margin: 4px 4px 4px 4px; 
            padding: 4px 4px 4px 4px; 
            background-color: #FFFFFF;
            border: solid 3px #c4c4c4; 
        }
        .QuestionInGroup
        {
            background-color: #E2EFFF;
            border: solid 2px #c4c4c4;
        }
        #WorkField
        {
            border: solid 10px #E2EFFF;
            background-color: #FFFFFF;
            margin: 5px 5px 5px 5px;
            padding: 5px 5px 5px 5px;
        }
    </style>
    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/Scripts/Plugins/UI/Sortable/jquery-ui-1.7.3.custom.min.js"></script>
    <script type="text/javascript">

        var groupStartIndex = '<%= (Convert.ToInt32(ViewData["MaxQuestionGroupIndex"]) == VLKConstants.FAKE_VALUE ? 0 : ViewData["MaxQuestionGroupIndex"]) %>';

        var localGroupStartIndex = <%= Convert.ToString(ViewData["GroupsCount"]) %> + 1;

        $(document).ready(function() {
            $("#AddGroup").click(function() {
                ++groupStartIndex;

                var newGroup = "<ul class=\"Grouping\" id=\"Group" + groupStartIndex + "\"><b>Группа " + localGroupStartIndex + "</b><br /></ul><br />";
                
                ++localGroupStartIndex;

                $("#GroupsList").append(newGroup);

                var sortableParams = "#Group" + groupStartIndex + ", #Group<%= VLKConstants.FAKE_VALUE %>";

                $(sortableParams).sortable({
                    connectWith: ".Grouping",
                    receive: function(event, ui) {

                        var newGroupIndex = $(this).attr("id").substr(5);
                        var url = '/Editor/<%= Convert.ToString(ViewData["AddToGroupMethod"]) %>/' + ui.item.attr("id") + "/" + newGroupIndex;

                        $.post(url,
                               {}
                              );
                    }
                });
            });

            $(document).find("ul[id^='Group']").each(function(index) {
                if ($(this).attr("id") != "Group<%= VLKConstants.FAKE_VALUE %>") {
                    var sortableParams = "#Group" + $(this).attr("id").substr(5) + ", #Group<%= VLKConstants.FAKE_VALUE %>";

                    $(sortableParams).sortable({
                        connectWith: ".Grouping",
                        receive: function(event, ui) {
                            var newGroupIndex = $(this).attr("id").substr(5);
                            var url = '/Editor/<%= Convert.ToString(ViewData["AddToGroupMethod"]) %>/' + ui.item.attr("id") + "/" + newGroupIndex;

                            $.post(url,
                               {}
                              );
                        }
                    });
                }
            });
        });        

    </script>
    <%
	try
	{ 
        IEnumerable<Question> questionsList  = (IEnumerable<Question>)ViewData["QuestionsList"];
        long razdelId                        = Convert.ToInt64(ViewData["RazdelId"]);
        
        %>
        <h2>Распределение вопросов по группам</h2>
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
	    <br />
	    <div id="WorkField">
	    <%
	    if (questionsList.Count<Question>() == 0)
	    {
	    %>
		    <p>По данному разделу нет ни одного тестового вопроса</p>
	    <%
	    }
	    else
	    {
            switch (Convert.ToString(ViewData["QuestionGroupType"]))
            {
                case VLKConstants.QUESTION_GROUP_DOUBLE:
                    {
                        %>
                        <table>
                            <tr>
                                <td style="width:58%; vertical-align:top; text-align:left;">
                                    <div id="QuestionsList" style="width:100%;">
                                        <ul id="Group<%= VLKConstants.FAKE_VALUE %>" class="Grouping" style="border: none;">
                                        <b>Список тестовых вопросов по разделу</b>
                                        <br />
                                        <%
                                        foreach (Question question in questionsList)
                                        {
                                            if (question.DoubleGroup == VLKConstants.FAKE_VALUE)
                                            {
                                            %>
                                            <li id="<%= question.Id.ToString() %>" class="QuestionInGroup"><%= Html.Encode(question.Title) %></li>
                                            <%
                                            }
                                        } 
                                        %>
                                        </ul>
                                    </div>
                                    <br />
                                    <p><a href="javascript:void(0);" id="AddGroup">Добавить группу вопросов-дублеров</a></p>
                                </td>
                                <td style="width:2%;"></td>
                                <td style="width:40%; vertical-align:top; text-align:left;">
                                    <div id="GroupsList" style="width:100%">
                                        <%
                                        IEnumerable<Question> questions = (IEnumerable<Question>)ViewData["QuestionsListSortedByGroupIndex"];
                                        
                                        if (questions.Count<Question>() != 0)
                                        {
                                            %>
                                            <ul class="Grouping" id="Group<%= questions.First<Question>().DoubleGroup.ToString() %>">
                                            <b>Группа 1</b>
                                            <br />
                                            <%
                                            
                                            int questionGroupIndex = questions.First<Question>().DoubleGroup;
                                            int localGroupsCount   = 1;
                                            
                                            foreach (Question question in questions)
                                            {
                                                if (question.DoubleGroup > questionGroupIndex)
                                                {
                                                    questionGroupIndex = question.DoubleGroup;

                                                    ++localGroupsCount;
                                                    
                                                    %>
                                                    </ul>
                                                    <br />
                                                    <ul class="Grouping" id="Group<%= questionGroupIndex.ToString() %>">
                                                        <b>Группа <%= localGroupsCount.ToString() %></b>
                                                        <br />
                                                        <li id="<%= question.Id.ToString() %>" class="QuestionInGroup"><%= Html.Encode(question.Title) %></li>
                                                    <%
                                                }
                                                else if (question.DoubleGroup == questionGroupIndex)
                                                {
                                                    %>
                                                        <li id="<%= question.Id.ToString() %>" class="QuestionInGroup"><%= Html.Encode(question.Title) %></li>
                                                    <%
                                                }
                                            }
                                            %>
                                            </ul>
                                            <br />
                                        <%
                                        }
                                        %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <%
                        
                        break;
                    }
                case VLKConstants.QUESTION_GROUP_EXCLUSION:
                    {
                        %>
                        <table>
                            <tr>
                                <td style="width:58%; vertical-align:top; text-align:left;">
                                    <div id="QuestionsList" style="width:100%">
                                        <ul id="Group<%= VLKConstants.FAKE_VALUE %>" class="Grouping"  style="border: none;">
                                        <b>Список тестовых вопросов по разделу</b>
                                        <br />
                                        <%
                                        foreach (Question question in questionsList)
                                        {
                                            if (question.ExclusionGroup == VLKConstants.FAKE_VALUE)
                                            {
                                            %>
                                            <li id="<%= question.Id.ToString() %>" class="QuestionInGroup"><%= Html.Encode(question.Title) %></li>
                                            <%
                                            }
                                        } 
                                        %>
                                        </ul>
                                    </div>
                                    <br />
                                    <p><a href="javascript:void(0);" id="AddGroup">Добавить группу вопросов-исключений</a></p>
                                </td>
                                <td style="width:2%;"></td>
                                <td style="width:40%; vertical-align:top; text-align:left;">
                                    <div id="GroupsList" style="width:100%">
                                        <% 
                                        IEnumerable<Question> questions = (IEnumerable<Question>)ViewData["QuestionsListSortedByGroupIndex"];
                                        
                                        if (questions.Count<Question>() != 0)
                                        {
                                            %>
                                            <ul class="Grouping" id="Group<%= questions.First<Question>().ExclusionGroup.ToString() %>">
                                            <%
                                            
                                            int questionGroupIndex = questions.First<Question>().ExclusionGroup;
                                        
                                            foreach (Question question in questions)
                                            {
                                                if (question.ExclusionGroup > questionGroupIndex)
                                                {
                                                    questionGroupIndex = question.ExclusionGroup;
                                                    
                                                    %>
                                                    </ul>
                                                    <br />
                                                    <ul class="Grouping" id="Group<%= questionGroupIndex.ToString() %>">
                                                        <li id="<%= question.Id.ToString() %>" class="QuestionInGroup"><%= Html.Encode(question.Title) %></li>
                                                    <%
                                                }
                                                else if (question.ExclusionGroup == questionGroupIndex)
                                                {
                                                    %>
                                                        <li id="<%= question.Id.ToString() %>" class="QuestionInGroup"><%= Html.Encode(question.Title) %></li>
                                                    <%
                                                }
                                            }
                                            %>
                                            </ul>
                                            <br />
                                        <%
                                        }
                                        %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <%
                        
                        break;
                    }
                
                default: break;                    
            }
        }
        %>
        </div>
        <br />
		<p>
			<%= Html.ActionLink("Перейти к списку вопросов по разделу", "List", new { alias = razdelId }) %>
		</p>
	<%
	}
	catch (Exception exc)
	{
		Utility.RedirectToErrorPage("Editor/Grouping: catch exception", exc);
	}
	%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
