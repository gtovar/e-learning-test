<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    e��� � ����������� ��� / ����������������� ������ / ���������� ������������
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        ���������� ������������ / �������� ���������</h3>
    <% Html.RenderPartial("Department/DepartmentForm"); %>
</asp:Content>
