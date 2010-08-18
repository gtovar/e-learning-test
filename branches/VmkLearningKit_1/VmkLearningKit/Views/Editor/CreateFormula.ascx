<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VmkLearningKit" %>
    <script src="/Scripts/formula-editor.js" type="text/javascript"></script> 
    
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
    