<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    e��� � ����������� ��� / ����������������� ������ / ���������� ������������
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        ���������� ������������</h3>
    <% try
       {
           if (null != ViewData["Departments"])
           {
    %>
    <h4 style="margin-top: 10px">
        <span style="float: left;margin-bottom:5px;">��� ����������</span> <span style="float: right; margin-bottom:5px;">
            <%=Html.ActionLink("�������� ���������", "Departments", "Admin", new { alias = "Add" }, new { @class = "" }) %></span>
    </h4>
    <table width="100%" border="1">
        <tr class="table_header">
            <th width="50px" style="padding: 5px;">
                �
            </th>
            <th style="padding: 5px;">
                ��������
            </th>
            <th style="padding: 5px;">
                ������������ 
            </th>
            <th style="padding: 5px;">
                �����
            </th>
            <th width="50px" style="padding: 5px;">
                
            </th>
            <th width="50px" style="padding: 5px;">
                
            </th>
        </tr>
        <%
            int index = 1;
            foreach (Department department in (IEnumerable<Department>)ViewData["Departments"])
            {    
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= index %>
            </td>
            <td>
                <%=Html.Encode(department.Title) %>
            </td>
            <td>
                <%=Html.Encode(department.Abbreviation) %>
            </td>
            <td>
                <%=Html.Encode(department.Alias) %>
            </td>
            <td>
                <a class="transparent_link" href="/Admin/Departments/Edit/<%=Html.Encode(department.Alias) %>">
                    <img class="transparent_img" width="28" src="/Content/Images/edit.png" alt="�������������" /></a>
            </td>
            <td>
                <a class="transparent_link" href="#">
                    <img onclick="ConfirmDialog('�� ������������� �������, ��� ������ ������� ��������� <%=Html.Encode(department.Abbreviation) %>', '/Admin/Departments/Delete/<%=Html.Encode(department.Alias) %>')"
                        class="transparent_img" width="28" src="/Content/Images/delete.png" alt="�������" />
                </a>
            </td>
        </tr>
        <%
            index++;
            }
        %>
    </table>
    <%
        }
       }
       catch (Exception ex)
       {
           Utility.RedirectToErrorPage("AdminController.Departments: catch exception", ex);
       } %>
</asp:Content>
