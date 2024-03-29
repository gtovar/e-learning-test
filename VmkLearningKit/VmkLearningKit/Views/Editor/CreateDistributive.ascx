<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VmkLearningKit" %>
    <table class="Editor" style="width:100%;">
        <tr class="Editor">
            <th class="Editor" colspan="2" rowspan="1" style="width:20%">������</th>
            <th class="Editor" style="width:80%"></th>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:20%">��� �������:</td>
            <td class="Editor" style="width:80%"><%= Html.Encode("��������������") %></td>
        </tr>
        <tr class="Editor">
            <td class="Editor"><label for="Title">������� ��������:</label></td>
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
            <th class="Editor" colspan="2" rowspan="1" style="width:20%">�������� ������</th>
            <th class="Editor" style="width:80%"></th>
        </tr>
        <%
            for (int i = 0; i < VLKConstants.MINIMNUM_ANSWERS_NUMBER; i++)
            {
                %>
                <tr class="Editor">
                    <td class="Editor" style="width:20%">����� ������:</td>
                    <td class="Editor" style="width:80%"><div style="width:100%"><%= Html.TextArea(VLKConstants.NEW_VARIANT_ANSWER_TEXT + i.ToString(), new { @class = "TextEditor", style = "width:inherit; height: 100px;" }) %></div></td>
                </tr>
                <tr class="Editor">
                    <td class="Editor" style="width:20%"><label for="<%= VLKConstants.NEW_VARIANT_ANSWER_SCORE + i.ToString()%>">���������� ������:</label></td>
                    <td class="Editor" style="width:80%"><div style="width:100%"><%= Html.TextBox(VLKConstants.NEW_VARIANT_ANSWER_SCORE + i.ToString()) %></div></td>
                </tr>
                <%
            }
        %>
    </table>
    