<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VmkLearningKit" %>
    <table style="width:100%;">
        <tr>
            <th colspan="2" rowspan="1">������</th>
            <th></th>
        </tr>
        <tr>
            <td style="width:15%">��� �������:</td>
            <td style="width:85%"><%= Html.Encode("�������") %></td>
        </tr>
        <tr>
            <td><label for="Title">������� ��������:</label></td>
            <td><%= Html.TextBox("Title", "", new { style = "width:100%" })%></td>
        </tr>
        <tr>
            <td><label for="Text">����� �������:</label></td>
            <td><%= Html.TextArea("Text") %></td>
        </tr>
        <tr>
            <td colspan="2" rowspan="1">
                <%= Html.CheckBox("CanCommented", false) %>
                �������� ����������� ��������������� ������� ����������
            </td>
            <td></td>
        </tr>
        <tr>
            <th colspan="2" rowspan="1">�����</th>
            <th></th>
        </tr>
        <tr>
            <td>����� ������:</td>
            <td><%= Html.TextArea(VLKConstants.NEW_VARIANT_ANSWER_TEXT + "0") %></td>
        </tr>
        <tr>
            <td><label for="<%= VLKConstants.NEW_VARIANT_ANSWER_SCORE + "0"%>">���������� ������:</label></td>
            <td><%= Html.TextBox(VLKConstants.NEW_VARIANT_ANSWER_SCORE + "0") %></td>
        </tr>
    </table>