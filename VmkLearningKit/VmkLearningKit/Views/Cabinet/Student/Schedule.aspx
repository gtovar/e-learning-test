<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	e��� � ����������� ��� / ����� ������� / ������� ��������
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="float: left">
        <h2 style="margin-bottom: 10px">����������</h2>
    </div>
    <div style="float: right; margin-top: 8px">
        <%= Html.ActionLink("������������", "Testing") %>
        &nbsp;
        <%= Html.ActionLink("������ �������", "Timetable", new { alias = String.Empty, additional = String.Empty } )%>
    </div>
    <% if (null != ViewData["SpecialityDisciplines"])
       { 
           IEnumerable<SpecialityDiscipline> specialityDisciplines = ((IEnumerable<SpecialityDiscipline>)ViewData["SpecialityDisciplines"]);
           if (null != specialityDisciplines && specialityDisciplines.Count() > 0)
           {
           %>
    <table width="100%" border="1">
        <tr class="table_header">
            <th class="table_th">
            </th>
            <th class="table_th">
                �����������
            </th>
            <th class="table_th">
                �������
            </th>
            <th class="table_th">
                �����
            </th>
            <th class="table_th">
                �������
            </th>
            <th class="table_th">
                �������
            </th>
            <th class="table_th">
                �������
            </th>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% string time = "8:00"; %>
                08<sup>00</sup>
            </td>
            <!-- ����������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ����� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% time = "9:40"; %>
                09<sup>40</sup>
            </td>
            <!-- ����������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ����� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% time = "11:20"; %>
                11<sup>20</sup>
            </td>
            <!-- ����������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ����� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% time = "13:00"; %>
                13<sup>00</sup>
            </td>
            <!-- ����������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ����� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% time = "14:40"; %>
                14<sup>40</sup>
            </td>
            <!-- ����������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ����� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
        </tr>
         <tr class="table_row">
            <td class="table_td">
                <% time = "16:20"; %>
                16<sup>20</sup>
            </td>
            <!-- ����������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ����� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% time = "18:00"; %>
                18<sup>00</sup>
            </td>
            <!-- ����������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ����� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
        </tr>
        <tr class="table_row">
            <td class="table_td">
                <% time = "19:40"; %>
                19<sup>40</sup>
            </td>
            <!-- ����������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ����� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�����", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
            <!-- ������� -->
            <td class="table_td">
                <%= Utility.FindSchedule(specialityDisciplines, "�������", time)%>
            </td>
        </tr>
    </table>
    <%
           }
       } %>
</asp:Content>