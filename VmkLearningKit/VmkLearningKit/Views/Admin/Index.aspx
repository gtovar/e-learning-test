<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	e��� � ����������� ��� / ����������������� ������
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<p align="center" style="font-size:medium">
    ������ ���� <b><% if (Session["UserName"] != null)
                   {%><%= Session["UserName"]%><% } %>,</b><br /><br />
    �� ���������� � ����������������� ������.<br /><br />
    ��� ���������� �������� �������������� ������������� ���� ������ ��������.
</p>
</asp:Content>
