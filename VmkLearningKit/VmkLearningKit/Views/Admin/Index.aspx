<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    e��� � ����������� ��� / ����������������� ������
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (null != ViewData["IsFileLoadOk"] && (Boolean)ViewData["IsFileLoadOk"])
       {%>
    <p align="center" style="font-size: medium; color: Green">
        ���� �������� �������!</p>
    <% }
       else if (null != ViewData["IsFileLoadOk"])
       { %>
    <p align="center" style="font-size: medium; color: Red">
        ��� ��������� ����� ��������� ������!</p>
    <% } %>
    <p align="left" style="font-size: 16px; margin-top: 10px">
        �������� ���������� ������:
        <% using (Html.BeginForm("Index", "Admin", FormMethod.Post, new { enctype = "multipart/form-data", id = "LectureTimetableStructure" }))
           { %>
        <input type="file" id="uploadLectureTimetableStructureFile" name="uploadLectureTimetableStructureFile"
            style="width: 300px; height: 20px; margin-right: 20px;" />
        <input type="submit" id="LectureTimetableStructure" name="LectureTimetableStructure" value="���������" style="width: 100px; height: 30px" />
        <% } %>
    </p>
    <p align="left" style="font-size: 16px; margin-top: 10px">
        �������� ������������� �����:
        <% using (Html.BeginForm("Index", "Admin", FormMethod.Post, new { enctype = "multipart/form-data", id = "GroupStructure" }))
           { %>
        <input type="file" id="uploadGroupStructureFile" name="uploadGroupStructureFile"
            style="width: 300px; height: 20px; margin-right: 20px;" />
        <input type="submit" id="GroupStructure" name="GroupStructure" value="���������"
            style="width: 100px; height: 30px;" />
        <% } %>
    </p>
    <p align="left" style="font-size: 16px; margin-top: 10px">
        �������� ��������� ���������:
        <% using (Html.BeginForm("Index", "Admin", FormMethod.Post, new { enctype = "multipart/form-data", id = "SpecialityDisciplineTopicStructure" }))
           { %>
        <input type="file" id="uploadSpecialityDisciplineTopicStructureFile" name="uploadSpecialityDisciplineTopicStructureFile"
            style="width: 300px; height: 20px; margin-right: 20px;" />
        <input type="submit" id="SpecialityDisciplineTopicStructure" name="SpecialityDisciplineTopicStructure"
            value="���������" style="width: 100px; height: 30px;" />
        <% } %>
    </p>
    <p align="left" style="font-size: 16px; margin-top: 10px">
        �������� ���������:
        <% using (Html.BeginForm("Index", "Admin", FormMethod.Post, new { enctype = "multipart/form-data", id = "SpecialityDisciplineStructure" }))
           { %>
        <input type="file" id="uploadSpecialityDisciplineStructureFile" name="uploadSpecialityDisciplineStructureFile"
            style="width: 300px; height: 20px; margin-right: 20px;" />
        <input type="submit" id="SpecialityDisciplineStructure" name="SpecialityDisciplineStructure"
            value="���������" style="width: 100px; height: 30px;" />
        <% } %>
    </p>
    <p align="left" style="font-size: 16px">
        �������� ��������� ����������:
        <% using (Html.BeginForm("Index", "Admin", FormMethod.Post, new { enctype = "multipart/form-data", id = "DepartmentStructure" }))
           { %>
        <input type="file" id="uploadDepartmentStructureFile" name="uploadDepartmentStructureFile"
            style="width: 300px; height: 20px; margin-right: 20px;" />
        <input type="submit" id="submitUploadDepartmentStructureFile" name="DepartmentStructure"
            value="���������" style="width: 100px; height: 30px;" />
        <% } %>
    </p>
</asp:Content>
