<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DeleteDepartment.aspx.cs" Inherits="Admin_Departments_DeleteDepartment" %>

<asp:Content ID="headDeleteDepartmentPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentDeleteDepartmentPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="deleteDepartmentLabel" runat="server" CssClass="title" 
        Text="Удаление факультета"></asp:Label>
    <br />
    <br />
    <br />
    <div style="text-align: center; font-size: medium">
        Вы действительно хотите удалить факультет!!!
        <br />
        Будет удалена только запись самого факультета, а группы, кафедры остануться!!!
        <br />
        Если вы точно уверены, то нажмите продолжить.
        <br />
        <br />
        <asp:Button ID="deleteDepartment" runat="server" Text="Продолжить" 
            CssClass="button" onclick="deleteDepartment_Click" />
    </div>
</asp:Content>

