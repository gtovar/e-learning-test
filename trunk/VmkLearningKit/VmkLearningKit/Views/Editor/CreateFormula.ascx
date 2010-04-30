<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VmkLearningKit" %>
    <script src="/Scripts/formula-editor.js" type="text/javascript"></script>   
    <script type="text/javascript">
        $(document).ready(function() {
            $(".formula_input").bind("click", display_formula_editor);
            document.getElementById('formula_edit').onblur = RunEdit;
            document.getElementById('editor_input').onclick = input_and_hide_formula_editor;
            document.getElementById('editor_exit').onclick = hide_formula_editor;
            generate_pallete(this);
        });
    </script>
    <table class="Editor" style="width:100%;">
        <tr class="Editor">
            <th class="Editor" colspan="2" rowspan="1">Вопрос</th>
            <th class="Editor"></th>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:15%">Тип вопроса:</td>
            <td class="Editor" style="width:85%"><%= Html.Encode("формула") %></td>
        </tr>
        <tr class="Editor">
            <td class="Editor"><label for="Title">Краткое название:</label></td>
            <td class="Editor"><%= Html.TextBox("Title", "", new { style = "width:100%" })%></td>
        </tr>
        <tr class="Editor">
            <td class="Editor"><label for="Text">Текст вопроса:</label></td>
            <td class="Editor"><%= Html.TextArea("Text", new { @class = "TextEditor", style = "width:100%; height: 100px;" }) %></td>
        </tr>
        <tr class="Editor">
            <td class="Editor" colspan="2" rowspan="1">
                <%= Html.CheckBox("CanCommented", false) %>
                Включить возможность комментирования вопроса студентами
            </td>
            <td class="Editor"></td>
        </tr>
        <tr class="Editor">
            <th class="Editor" colspan="2" rowspan="1">Ответ</th>
            <th class="Editor"></th>
        </tr>
        <tr class="Editor">
            <td class="Editor">Текст ответа:</td>
            <td class="Editor">
                <input class="formula_input" id="<%= VLKConstants.NEW_VARIANT_ANSWER_TEXT + "0" %>" name="<%= VLKConstants.NEW_VARIANT_ANSWER_TEXT + "0" %>" />
            </td>
        </tr>
        <tr class="Editor">
            <td class="Editor"><label for="<%= VLKConstants.NEW_VARIANT_ANSWER_SCORE + "0"%>">Количество баллов:</label></td>
            <td class="Editor"><%= Html.TextBox(VLKConstants.NEW_VARIANT_ANSWER_SCORE + "0") %></td>
        </tr>
    </table>
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
                		
	                    <button id="editor_input" onclick=" input_and_hide_formula_editor(this); return false ">Ввести</button>
	                    <button id="editor_exit" onclick=" hide_formula_editor(this); return false ">Закрыть</button>
                    </div>

                <!--  //////////////////////////////////////////////////////////////////////////////////////////////////////-->
