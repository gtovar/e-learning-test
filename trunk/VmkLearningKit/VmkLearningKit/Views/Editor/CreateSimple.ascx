<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VmkLearningKit" %>
    <table class="Editor" style="width:100%;">
        <tr class="Editor">
            <th class="Editor" colspan="2" rowspan="1">Вопрос</th>
            <th class="Editor"></th>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:15%">Тип вопроса:</td>
            <td class="Editor" style="width:85%"><%= Html.Encode("простой") %></td>
        </tr>
        <tr class="Editor">
            <td class="Editor"><label for="Title">Краткое название:</label></td>
            <td class="Editor"><%= Html.TextBox("Title", "", new { style = "width:100%" })%></td>
        </tr>
        <tr class="Editor">
            <td class="Editor"><label for="Text">Текст вопроса:</label></td>
            <td class="Editor"><%= Html.TextArea("Text", new { @class = "TextAreaNicEditor" }) %></td>
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
            <td class="Editor"><%= Html.TextArea(VLKConstants.NEW_VARIANT_ANSWER_TEXT + "0", new { @class = "TextAreaNicEditor" }) %></td>
        </tr>
        <tr class="Editor">
            <td class="Editor"><label for="<%= VLKConstants.NEW_VARIANT_ANSWER_SCORE + "0"%>">Количество баллов:</label></td>
            <td class="Editor"><%= Html.TextBox(VLKConstants.NEW_VARIANT_ANSWER_SCORE + "0") %></td>
        </tr>
    </table>