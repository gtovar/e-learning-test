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
                
                var typeString = '<%= (Convert.ToString(ViewData["QuestionGroupType"]) == VLKConstants.QUESTION_GROUP_DOUBLE ? "Группа вопросов-дублеров " : "Группа вопросов-исключений ") %>';
                
                var newGroup = "<ul class=\"Grouping\" id=\"Group" + groupStartIndex + "\">" + typeString + localGroupStartIndex + "<br /></ul><br />";
                
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
	    <p>
	        <%= Html.ActionLink("Группы вопросов-дублеров", "Grouping", new { alias = VLKConstants.QUESTION_GROUP_DOUBLE , additional = razdelId }) %> | 
	        <%= Html.ActionLink("Группы вопросов-исключений", "Grouping", new { alias = VLKConstants.QUESTION_GROUP_EXCLUSION , additional = razdelId }) %>
	    </p>
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
                        <p style="text-align:center; background-color: #E2EFFF;"><b>Группы вопросов-дублеров</b></p>
                        <table border="0">
                            <tr>
                                <td style="width:58%; vertical-align:top; text-align:left;">
                                    <div id="QuestionsList" style="width:100%;">
                                        <p style="text-align:center;"><b>Список тестовых вопросов по разделу</b></p>
                                        <ul id="Group<%= VLKConstants.FAKE_VALUE %>" class="Grouping" style="border: solid 3px #c4c4c4;">
                                        <br />
                                        <%
                                        foreach (Question question in questionsList)
                                        {
                                            if (question.DoubleGroup == VLKConstants.FAKE_VALUE)
                                            {
                                            %>
                                            <li id="<%= question.Id.ToString() %>" class="QuestionInGroup"><%= Html.ActionLink(Html.Encode(question.Title), "Question", new { alias = question.Id }) %></li>
                                            <%
                                            }
                                        } 
                                        %>
                                        </ul>
                                    </div>
                                </td>
                                <td style="width:2%;"></td>
                                <td style="width:40%; vertical-align:top; text-align:left;">
                                    <div id="GroupsList" style="width:100%">
                                        <p style="text-align:center;"><a href="javascript:void(0);" id="AddGroup">Добавить группу вопросов-дублеров</a></p>
                                        <%
                                        IEnumerable<Question> questions = (IEnumerable<Question>)ViewData["QuestionsListSortedByGroupIndex"];
                                        
                                        if (questions.Count<Question>() != 0)
                                        {
                                            %>
                                            <ul class="Grouping" id="Group<%= questions.First<Question>().DoubleGroup.ToString() %>">
                                            Группа вопросов-дублеров 1
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
                                                        Группа вопросов-дублеров <%= localGroupsCount.ToString() %>
                                                        <br />
                                                        <li id="<%= question.Id.ToString() %>" class="QuestionInGroup"><%= Html.ActionLink(Html.Encode(question.Title), "Question", new { alias = question.Id }) %></li>
                                                    <%
                                                }
                                                else if (question.DoubleGroup == questionGroupIndex)
                                                {
                                                    %>
                                                        <li id="<%= question.Id.ToString() %>" class="QuestionInGroup"><%= Html.ActionLink(Html.Encode(question.Title), "Question", new { alias = question.Id }) %></li>
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
                        <p style="text-align:center; background-color: #E2EFFF;"><b>Группы вопросов-исключений</b></p>
                        <table>
                            <tr>
                                <td style="width:58%; vertical-align:top; text-align:left;">
                                    <div id="QuestionsList" style="width:100%">
                                        <p style="text-align:center;"><b>Список тестовых вопросов по разделу</b></p>
                                        <ul id="Group<%= VLKConstants.FAKE_VALUE %>" class="Grouping" style="border: solid 3px #c4c4c4;">
                                        <br />
                                        <%
                                        foreach (Question question in questionsList)
                                        {
                                            if (question.ExclusionGroup == VLKConstants.FAKE_VALUE)
                                            {
                                            %>
                                            <li id="<%= question.Id.ToString() %>" class="QuestionInGroup"><%= Html.ActionLink(Html.Encode(question.Title), "Question", new { alias = question.Id }) %></li>
                                            <%
                                            }
                                        } 
                                        %>
                                        </ul>
                                    </div>
                                </td>
                                <td style="width:2%;"></td>
                                <td style="width:40%; vertical-align:top; text-align:left;">
                                    <div id="GroupsList" style="width:100%">
                                        <p style="text-align:center;"><a href="javascript:void(0);" id="AddGroup">Добавить группу вопросов-исключений</a></p>
                                        <% 
                                        IEnumerable<Question> questions = (IEnumerable<Question>)ViewData["QuestionsListSortedByGroupIndex"];
                                        
                                        if (questions.Count<Question>() != 0)
                                        {
                                            %>
                                            <ul class="Grouping" id="Group<%= questions.First<Question>().ExclusionGroup.ToString() %>">
                                            Группа вопросов-исключений 1
                                            <br />
                                            <%
                                            
                                            int questionGroupIndex = questions.First<Question>().ExclusionGroup;
                                            int localGroupsCount   = 1;
                                            
                                            foreach (Question question in questions)
                                            {
                                                if (question.ExclusionGroup > questionGroupIndex)
                                                {
                                                    questionGroupIndex = question.ExclusionGroup;

                                                    ++localGroupsCount;
                                                    
                                                    %>
                                                    </ul>
                                                    <br />
                                                    <ul class="Grouping" id="Group<%= questionGroupIndex.ToString() %>">
                                                        Группа вопросов-исключений <%= localGroupsCount.ToString() %>
                                                        <br />
                                                        <li id="<%= question.Id.ToString() %>" class="QuestionInGroup"><%= Html.ActionLink(Html.Encode(question.Title), "Question", new { alias = question.Id }) %></li>
                                                    <%
                                                }
                                                else if (question.ExclusionGroup == questionGroupIndex)
                                                {
                                                    %>
                                                        <li id="<%= question.Id.ToString() %>" class="QuestionInGroup"><%= Html.ActionLink(Html.Encode(question.Title), "Question", new { alias = question.Id }) %></li>
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
        <p style="text-align:center; color: #c4c4c4; font-size:x-small; ">Для добавления вопроса в группу вопросов-дублеров перетащите его в эту группу. Изменения сохранятся автоматически.</p>
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
