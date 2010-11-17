<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	e��� � ����������� ��� / ����������������� ������
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="SuperLink">
        <h3 class="SuperLink">��������� ��������</h3>
        <h4 class="SuperLink"><%= Html.ActionLink("���������� ������������", "Departments", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("���������� ���������", "Chairs", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("���������� ����������� ����������", "EducationPlans", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("���������� ���������������", "Specialities", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("���������� ���������������", "Specializations", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("���������� ������������", "SpecialityDisciplines", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("�������� ��������������� ����������", "XmlParse", "Admin")%></h4>
        <h4 class="SuperLink"><%= Html.ActionLink("��������� ��������������� ����������", "Index", "Document")%></h4>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
