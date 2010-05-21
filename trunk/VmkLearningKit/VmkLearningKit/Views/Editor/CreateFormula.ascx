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
            <th class="Editor" colspan="2" rowspan="1" style="width:20%">Вопрос</th>
            <th class="Editor" style="width:20%"></th>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:20%">Тип вопроса:</td>
            <td class="Editor" style="width:80%"><%= Html.Encode("формула") %></td>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:20%"><label for="Title">Краткое название:</label></td>
            <td class="Editor" style="width:80%"><div style="width:100%"><%= Html.TextBox("Title", "", new { style = "width:inherit" })%></div></td>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:20%"><label for="Text">Текст вопроса:</label></td>
            <td class="Editor" style="width:80%"><div style="width:100%"><%= Html.TextArea("Text", new { @class = "TextEditor", style = "width:inherit; height: 100px;" }) %></div></td>
        </tr>
        <tr class="Editor">
            <td class="Editor" colspan="2" rowspan="1" style="width:20%">
                <%= Html.CheckBox("CanCommented", false) %>
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
                <input class="formula_input" id="<%= VLKConstants.NEW_VARIANT_ANSWER_TEXT + "0" %>" name="<%= VLKConstants.NEW_VARIANT_ANSWER_TEXT + "0" %>" />
            </td>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:20%"><label for="<%= VLKConstants.NEW_VARIANT_ANSWER_SCORE + "0"%>">Количество баллов:</label></td>
            <td class="Editor" style="width:80%"><%= Html.TextBox(VLKConstants.NEW_VARIANT_ANSWER_SCORE + "0") %></td>
        </tr>
    </table>
    <!--  //////////////////////////////////////////////////////////////////////////////////////////////////////
                  ////////////////////////////// Раздвигающийся редактор //////////////////////////////////////
                  //////////////////////////////////////////////////////////////////////////////////////////////////////-->

                    <div id="formula_editor" style="" >
                        <div id="formula_teacher_palette" style="" >
	                        Полная палитра:<br>
	                        <button class="btn_big_palette" name="\int_{*}^{*}{*}" onclick="addToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\sum_{*}^{*}{*}" onclick="addToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\sin_{*}^{*}{*}" onclick="addToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\exists{*}" onclick="addToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\forall{*}" onclick="addToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\geq{*}" onclick="addToPalette(); return false">  </button>			
	                        <button class="btn_big_palette" name="\in{*}" onclick="addToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\alpha" onclick="addToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\varepsilon" onclick="addToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\varphi" onclick="addToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="\pi" onclick="addToPalette(); return false">  </button>
	                        <button class="btn_big_palette" name="{*}^{*}" onclick="addToPalette(); return false">  </button>
                            <br />
                            Произвольный символ/формула в TeX:<br />
	                        <input id="newPaletteFormula"/>
	                        <button class="" onclick="addNewToPalette($('#newPaletteFormula')[0]); return false"> Ввести </button>
	                        <br />
	                        <br />
	                        <button class="" onclick="clearStudentPalette(); return false"> Очистить палитру студента </button>
                        </div>
	                    Палитра:<br>
	                    <div id="formula_palette">
		                    
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
                    
     