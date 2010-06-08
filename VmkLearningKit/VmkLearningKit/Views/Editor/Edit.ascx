<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VmkLearningKit" %>    
    <% 
    Question question = (Question)ViewData["QuestionData"];

    using (Html.BeginForm("Edit", "Editor", new { alias = question.Id }, FormMethod.Post, new { id = "QuestionForm", name = "QuestionForm" }))
    {
    %>
        <table class="Editor" style="width:100%;">
        <tr class="Editor">
            <th class="Editor" colspan="2" rowspan="1" style="width:20%">������</th>
            <th class="Editor" style="width:80%"></th>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:20%">��� �������:</td>
            <td class="Editor" style="width:80%"><%= Html.Encode(ViewData["QuestionTypeString"]) %></td>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:20%">
            <label for="Title">������� ��������:</label>
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
                        <label for="Text">����� �������:</label>
                        </td>
                        <td class="Editor" style="width:80%">
                        <div style="width:100%"><%= Html.TextArea("Text", question.Text, new { @class = "TextEditor", style = "width:inherit; height: 100px;" })%></div>
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" colspan="2" rowspan="1" style="width:20%">
                        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
                        �������� ����������� ��������������� ������� ����������
                        </td>
                        <td class="Editor" style="width:80%"></td>
                    </tr>
                    <tr class="Editor">
                        <th class="Editor" colspan="2" rowspan="1" style="width:20%">�����</th>
                        <th class="Editor" style="width:80%"></th>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" style="width:20%">����� ������:</td>
                        <td class="Editor" style="width:80%">
                        <div style="width:100%"><%= Html.TextArea(VLKConstants.VARIANT_ANSWER_TEXT + answer.Id.ToString(), answer.Text, new { @class = "TextEditor", style = "width:inherit; height: 100px;" })%></div>
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" style="width:20%">
                        <label for="<%= VLKConstants.VARIANT_ANSWER_SCORE  + answer.Id.ToString() %>">���������� ������:</label>
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
			                $(".formula_input").bind("click", DisplayFormulaEditor);
			                document.getElementById('formula_edit').onblur = RunEdit;
			                document.getElementById('editor_input').onclick = InputAndHideFormulaEditor;
			                document.getElementById('editor_exit').onclick = HideFormulaEditor;
			                //GeneratePallete(this);
		                });
	                </script>
                    <tr class="Editor">
                        <td class="Editor" style="width:20%">
                        <label for="Text">����� �������:</label>
                        </td>
                        <td class="Editor" style="width:80%">
                        <div style="width:100%"><%= Html.TextArea("Text", question.Text, new { @class = "TextEditor", style = "width:inherit; height: 100px;" })%></div>
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" colspan="2" rowspan="1" style="width:20%">
                        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
                        �������� ����������� ��������������� ������� ����������
                        </td>
                        <td class="Editor" style="width:80%"></td>
                    </tr>
                    <tr class="Editor">
                        <th class="Editor" colspan="2" rowspan="1" style="width:20%">�����</th>
                        <th class="Editor" style="width:80%"></th>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" style="width:20%">����� ������:</td>
                        <td class="Editor" style="width:80%">
                            <input class="formula_input" id="<%= VLKConstants.VARIANT_ANSWER_TEXT + answer.Id.ToString() %>" name="<%= VLKConstants.VARIANT_ANSWER_TEXT + answer.Id.ToString()%>" value="<%= answer.Text%>" />
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" style="width:20%">
                        <label for="<%= VLKConstants.VARIANT_ANSWER_SCORE  + answer.Id.ToString() %>">���������� ������:</label>
                        </td>
                        <td class="Editor" style="width:80%">
                        <div style="width:100%"><%= Html.TextBox(VLKConstants.VARIANT_ANSWER_SCORE + answer.Id.ToString(), answer.Score)%></div>
                        </td>
                    </tr>    
                    
		<!--  //////////////////////////////////////////////////////////////////////////////////////////////////////
                  ////////////////////////////// �������������� �������� //////////////////////////////////////
                  //////////////////////////////////////////////////////////////////////////////////////////////////////-->

                    <div id="formula_editor" style="" >
                        <div id="formula_teacher_palette" style="" >
	                        ������ �������:<br>
	                        <button class="btn_big_palette" name="\int_{*}^{*}{*}" onclick="AddToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\sum_{*}^{*}{*}" onclick="AddToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\sqrt{*}" onclick="AddToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\sin_{*}^{*}{*}" onclick="AddToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\cos_{*}^{*}{*}" onclick="AddToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="{*}^{*}" onclick="AddToPalette(); return false">  </button>			
	                        <button class="btn_big_palette" name="\in{*}" onclick="AddToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\exists{*}" onclick="AddToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\forall{*}" onclick="AddToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\geq{*}" onclick="AddToPalette(); return false">  </button>			
	                        <button class="btn_big_palette" name="\leq{*}" onclick="AddToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\varepsilon" onclick="AddToPalette(); return false">  </button>
                            <br />
                            ������������ ������/������� � TeX:<br />
	                        <input id="newPaletteFormula"/>
	                        <button class="" onclick="AddNewToPalette($('#newPaletteFormula')[0]); return false"> ������ </button>
	                        <br />
	                        <br />
	                        <button class="" onclick="ClearStudentPalette(); return false"> �������� ������� �������� </button>
                        </div>
	                    �������:<br>
	                    <div id="formula_palette">
		                    
	                    </div>
                		
	                    ������� � LaTex:<br>
	                    <div id="div_formula_edit" ><textarea name="formula_edit" id="formula_edit" rows="3" cols="60" onselect="StoreCaret(this)" onclick="StoreCaret(this)" onkeyup="StoreCaret(this)" ></textarea></div>
	                    <br>
	                    ��������������� ��������:<br>
	                    <div id="formula_display"></div>
                		
	                    <button id="editor_input" onclick=" InputAndHideFormulaEditor(this); return false ">������</button>
	                    <button id="editor_exit" onclick=" HideFormulaEditor(this); return false ">�������</button>
	                    
	                    
	                    
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
                        <label for="Text">����� �������:</label>
                        </td>
                        <td class="Editor" style="width:80%">
                        <div style="width:100%"><%= Html.TextArea("Text", question.Text, new { @class = "TextEditor", style = "width:inherit; height: 100px;" })%></div>
                        </td>
                    </tr>
                    <tr class="Editor">
                        <td class="Editor" colspan="2" rowspan="1" style="width:20%">
                        <%= Html.CheckBox("CanCommented", (question.CanCommented == VLKConstants.QUESTION_CAN_COMMENTED ? true : false))%>
                        �������� ����������� ��������������� ������� ����������
                        </td>
                        <td class="Editor" style="width:80%"></td>
                    </tr>
                    <tr class="Editor">
                        <th class="Editor" colspan="2" rowspan="1" style="width:20%">�������� ������</th>
                        <th class="Editor" style="width:80%"></th>
                    </tr>
    <%
                    long answersCount = 1;
                    foreach (var variantAnswer in answersList)
                    {
    %>
                        <tr class="Editor">
                            <td class="Editor" style="width:20%">����� ������:</td>
                            <td class="Editor" style="width:80%">
                            <div style="width:100%"><%= Html.TextArea(VLKConstants.VARIANT_ANSWER_TEXT + variantAnswer.Id.ToString(), variantAnswer.Text, new { @class = "TextEditor", style = "width:inherit; height: 100px;" })%></div>
                            </td>
                        </tr>
                        <tr class="Editor">
                            <td class="Editor" style="width:20%">
                            <label for="<%= VLKConstants.VARIANT_ANSWER_SCORE + variantAnswer.Id.ToString() %>">���������� ������:</label>
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
                                <img class="AnswerRemove" src="/Content/Images/remove.png" title="������� ������� ������" alt="�������" width="20" height="20" />
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
    