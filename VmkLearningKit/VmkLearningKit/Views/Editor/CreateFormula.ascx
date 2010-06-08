<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VmkLearningKit" %>
    <script src="/Scripts/formula-editor.js" type="text/javascript"></script> 
    <script type="text/javascript">
        $(document).ready(function() {
            $(".formula_input").bind("click", DisplayFormulaEditor);
            document.getElementById('formula_edit').onblur = RunEdit;
            document.getElementById('editor_input').onclick = InputAndHideFormulaEditor;
            document.getElementById('editor_exit').onclick = HideFormulaEditor;
            //GeneratePallete(this);
        });
    </script>
    <table class="Editor" style="width:100%;">
        <tr class="Editor">
            <th class="Editor" colspan="2" rowspan="1" style="width:20%">������</th>
            <th class="Editor" style="width:20%"></th>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:20%">��� �������:</td>
            <td class="Editor" style="width:80%"><%= Html.Encode("�������") %></td>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:20%"><label for="Title">������� ��������:</label></td>
            <td class="Editor" style="width:80%"><div style="width:100%"><%= Html.TextBox("Title", "", new { style = "width:inherit" })%></div></td>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:20%"><label for="Text">����� �������:</label></td>
            <td class="Editor" style="width:80%"><div style="width:100%"><%= Html.TextArea("Text", new { @class = "TextEditor", style = "width:inherit; height: 100px;" }) %></div></td>
        </tr>
        <tr class="Editor">
            <td class="Editor" colspan="2" rowspan="1" style="width:20%">
                <%= Html.CheckBox("CanCommented", false) %>
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
                <input class="formula_input" id="<%= VLKConstants.NEW_VARIANT_ANSWER_TEXT + "0" %>" name="<%= VLKConstants.NEW_VARIANT_ANSWER_TEXT + "0" %>" />
            </td>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:20%"><label for="<%= VLKConstants.NEW_VARIANT_ANSWER_SCORE + "0"%>">���������� ������:</label></td>
            <td class="Editor" style="width:80%"><%= Html.TextBox(VLKConstants.NEW_VARIANT_ANSWER_SCORE + "0") %></td>
        </tr>
    </table>
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
                		
	                    ������� � LaTeX:<br>
	                    <div id="div_formula_edit" ><textarea name="formula_edit" id="formula_edit" rows="3" cols="60" onselect="StoreCaret(this)" onclick="StoreCaret(this)" onkeyup="StoreCaret(this)" ></textarea></div>
	                    <br>
	                    ��������������� ��������:<br>
	                    <div id="formula_display"></div>
                		
	                    <button id="editor_input" onclick=" InputAndHideFormulaEditor(this); return false ">������</button>
	                    <button id="editor_exit" onclick=" HideFormulaEditor(this); return false ">�������</button>
	                    
	                    
	                    
                    </div>
                    
                    
                    
	                    

                <!--  //////////////////////////////////////////////////////////////////////////////////////////////////////-->
                    
     