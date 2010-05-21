<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VmkLearningKit" %>    
    <% 
    Question question = (Question)ViewData["QuestionData"];

    using (Html.BeginForm("Edit", "Editor", new { alias = question.Id }, FormMethod.Post, new { id = "QuestionForm", name = "QuestionForm" }))
    {
    %>
        <table class="Editor" style="width:100%;">
        <tr class="Editor">
            <th class="Editor" colspan="2" rowspan="1" style="width:20%">Вопрос</th>
            <th class="Editor" style="width:80%"></th>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:20%">Тип вопроса:</td>
            <td class="Editor" style="width:80%"><%= Html.Encode(ViewData["QuestionTypeString"]) %></td>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:20%">
            <label for="Title">Краткое название:</label>
            </td>
            <td class="Editor" style="width:80%">
            <div style="width:100%"><%= Html.TextBox("Title", question.Title, new { style = "width:inherit" })%></div>
            </td>
        </tr>
    <%
        switch (Convert.ToInt32(ViewData["QuestionType"]))
        {
            case VLKConstants.QUESTION_TYPE_SIMPLE:
                {
                    Answer answer = (Answer)ViewData["AnswerData"];
    %>
                    <tr class="Editor">
                        <td class="Editor" style="width:20%">
                        <label for="Text">Текст вопроса:</label>
                        </td>
                        <td class="Editor" style="width:80%">
                        <div style="width:100%"><%= Html.TextArea("Text", question.Text, new { @class = "TextEditor", style = "width:inherit; height: 100px;" })%></div>
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" colspan="2" rowspan="1" style="width:20%">
                        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
                        Включить возможность комментирования вопроса студентами
                        </td>
                        <td class="Editor" style="width:80%"></td>
                    </tr>
                    <tr class="Editor">
                        <th class="Editor" colspan="2" rowspan="1" style="width:20%">Ответ</th>
                        <th class="Editor" style="width:80%"></th>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" style="width:20%">Текст ответа:</td>
                        <td class="Editor" style="width:80%">
                        <div style="width:100%"><%= Html.TextArea(VLKConstants.VARIANT_ANSWER_TEXT + answer.Id.ToString(), answer.Text, new { @class = "TextEditor", style = "width:inherit; height: 100px;" })%></div>
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" style="width:20%">
                        <label for="<%= VLKConstants.VARIANT_ANSWER_SCORE  + answer.Id.ToString() %>">Количество баллов:</label>
                        </td>
                        <td class="Editor" style="width:80%">
                        <div style="width:100%"><%= Html.TextBox(VLKConstants.VARIANT_ANSWER_SCORE + answer.Id.ToString(), answer.Score)%></div>
                        </td>
                    </tr>
    
    <%
                    break;
                }
            case VLKConstants.QUESTION_TYPE_FORMULA:
                {
                    Answer answer = (Answer)ViewData["AnswerData"];
    %>
                    <script src="/Scripts/formula-editor.js" type="text/javascript"></script>   
                    <script type="text/javascript">
                      $(document).ready(function(){
			                $(".formula_input").bind("click", display_formula_editor);
			                document.getElementById('formula_edit').onblur = RunEdit;
			                document.getElementById('editor_input').onclick = input_and_hide_formula_editor;
			                document.getElementById('editor_exit').onclick = hide_formula_editor;
			                generate_pallete(this);
		                });
	                </script>
                    <tr class="Editor">
                        <td class="Editor" style="width:20%">
                        <label for="Text">Текст вопроса:</label>
                        </td>
                        <td class="Editor" style="width:80%">
                        <div style="width:100%"><%= Html.TextArea("Text", question.Text, new { @class = "TextEditor", style = "width:inherit; height: 100px;" })%></div>
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" colspan="2" rowspan="1" style="width:20%">
                        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
                        Включить возможность комментирования вопроса студентами
                        </td>
                        <td class="Editor" style="width:80%"></td>
                    </tr>
                    <tr class="Editor">
                        <th class="Editor" colspan="2" rowspan="1" style="width:20%">Ответ</th>
                        <th class="Editor" style="width:80%"></th>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" style="width:20%">Текст ответа:</td>
                        <td class="Editor" style="width:80%">
                            <input class="formula_input" id="<%= VLKConstants.VARIANT_ANSWER_TEXT + answer.Id.ToString() %>" name="<%= VLKConstants.VARIANT_ANSWER_TEXT + answer.Id.ToString()%>" value="<%= answer.Text%>" />
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" style="width:20%">
                        <label for="<%= VLKConstants.VARIANT_ANSWER_SCORE  + answer.Id.ToString() %>">Количество баллов:</label>
                        </td>
                        <td class="Editor" style="width:80%">
                        <div style="width:100%"><%= Html.TextBox(VLKConstants.VARIANT_ANSWER_SCORE + answer.Id.ToString(), answer.Score)%></div>
                        </td>
                    </tr>    
                    <!--  //////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////// Раздвигающийся редактор //////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////-->

	<div id="formula_editor" style="" >
		Палитра:<br>
		<div id="formula_palette">
			<button class="btn_pallete" name="\int_{*}^{*}{*}" onclick="insertTextFormul(); return false">  </button>
			<button class="btn_pallete" name="\sum_{*}^{*}{*}" onclick="insertTextFormul(); return false">  </button>
			<button class="btn_pallete" name="\sin_{*}^{*}{*}" onclick="insertTextFormul(); return false">  </button>
			<button class="btn_pallete" name="\exists{*}" onclick="insertTextFormul(); return false">  </button>
			<button class="btn_pallete" name="\forall{*}" onclick="insertTextFormul(); return false">  </button>
			<button class="btn_pallete" name="\geq{*}" onclick="insertTextFormul(); return false">  </button>			
			<button class="btn_pallete" name="\in{*}" onclick="insertTextFormul(); return false">  </button>
		</div>
		
		Формула в LaTex:<br>
		<div id="div_formula_edit" ><textarea name="formula_edit" id="formula_edit" rows="3" cols="60" onselect="storeCaret(this)" onclick="storeCaret(this)" onkeyup="storeCaret(this)" ></textarea></div>
		<br>
		Предварительный просмотр:<br>
		<div id="formula_display"></div>
		
		<button id="editor_input"  onclick=" input_and_hide_formula_editor(this); return false ">Ввести</button>
		<button id="editor_exit" onclick=" hide_formula_editor(this); return false ">Закрыть</button>
	</div>

<!--  //////////////////////////////////////////////////////////////////////////////////////////////////////-->

    <%
                    break;
                }
            case VLKConstants.QUESTION_TYPE_ALTERNATIVE:
            case VLKConstants.QUESTION_TYPE_DISTRIBUTIVE:
                {
                    IEnumerable<Answer> answersList = (IEnumerable<Answer>)ViewData["AnswerData"];
    %>
                    <tr class="Editor">
                        <td class="Editor" style="width:20%">
                        <label for="Text">Текст вопроса:</label>
                        </td>
                        <td class="Editor" style="width:80%">
                        <div style="width:100%"><%= Html.TextArea("Text", question.Text, new { @class = "TextEditor", style = "width:inherit; height: 100px;" })%></div>
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" colspan="2" rowspan="1" style="width:20%">
                        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
                        Включить возможность комментирования вопроса студентами
                        </td>
                        <td class="Editor" style="width:80%"></td>
                    </tr>
                    <tr class="Editor">
                        <th class="Editor" colspan="2" rowspan="1" style="width:20%">Варианты ответа</th>
                        <th class="Editor" style="width:80%"></th>
                    </tr>
    <%
                    long answersCount = 1;
                    foreach (var variantAnswer in answersList)
                    {
    %>
                        <tr class="Editor">
                            <td class="Editor" style="width:20%">Текст ответа:</td>
                            <td class="Editor" style="width:80%">
                            <div style="width:100%"><%= Html.TextArea(VLKConstants.VARIANT_ANSWER_TEXT + variantAnswer.Id.ToString(), variantAnswer.Text, new { @class = "TextEditor", style = "width:inherit; height: 100px;" })%></div>
                            </td>
                        </tr>
                        <tr class="Editor">
                            <td class="Editor" style="width:20%">
                            <label for="<%= VLKConstants.VARIANT_ANSWER_SCORE + variantAnswer.Id.ToString() %>">Количество баллов:</label>
                            </td>
                            <td class="Editor" style="width:80%">
                            <div style="width:100%"><%= Html.TextBox(VLKConstants.VARIANT_ANSWER_SCORE + variantAnswer.Id.ToString(), variantAnswer.Score)%></div>
                            </td>                
                        </tr>
                        <tr class="Editor">
                            <td class="Editor" colspan="2" rowspan="1" style="width:20%"></td>
                            <td class="Editor" style="width:80%">
    <%
                            if (answersCount > VLKConstants.MINIMNUM_ANSWERS_NUMBER)
                            {
    %>
                                <img class="AnswerRemove" src="/Content/Images/remove.png" title="Удалить вариант ответа" alt="Удалить" width="20" height="20" />
    <%
                            }
    %>                     
                            </td>
                        </tr>
    <%
                        ++answersCount;
                    }
                    break;
                }
        }
    %>
        </table>
    <%
    }
    %>   
    