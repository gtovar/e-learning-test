<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VmkLearningKit" %>
    <table class="Editor" style="width:100%;">
        <tr class="Editor">
            <th class="Editor" colspan="2" rowspan="1">������</th>
            <th class="Editor"></th>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:15%">��� �������:</td>
            <td class="Editor" style="width:85%"><%= Html.Encode("��������������") %></td>
        </tr>
        <tr class="Editor">
            <td class="Editor"><label for="Title">������� ��������:</label></td>
            <td class="Editor"><%= Html.TextBox("Title", "", new { style = "width:100%" })%></td>
        </tr>
        <tr class="Editor">
            <td class="Editor"><label for="Text">����� �������:</label></td>
            <td class="Editor"><%= Html.TextArea("Text") %></td>
        </tr>
        <tr class="Editor">
            <td class="Editor" colspan="2" rowspan="1">
                <%= Html.CheckBox("CanCommented", false) %>
                �������� ����������� ��������������� ������� ����������
            </td>
            <td class="Editor"></td>
        </tr>
        <tr class="Editor">
            <th class="Editor" colspan="2" rowspan="1">�������� ������</th>
            <th class="Editor"></th>
        </tr>
        <%
            for (int i = 0; i < VLKConstants.MINIMNUM_ANSWERS_NUMBER; i++)
            {
                %>
                <tr class="Editor">
                    <td class="Editor">����� ������:</td>
                    <td class="Editor"><%= Html.TextArea(VLKConstants.NEW_VARIANT_ANSWER_TEXT + i.ToString()) %></td>
                </tr>
                <tr class="Editor">
                    <td class="Editor"><label for="<%= VLKConstants.NEW_VARIANT_ANSWER_SCORE + i.ToString()%>">���������� ������:</label></td>
                    <td class="Editor"><%= Html.TextBox(VLKConstants.NEW_VARIANT_ANSWER_SCORE + i.ToString()) %></td>
                </tr>
                <%
            }
        %>
    </table>
    