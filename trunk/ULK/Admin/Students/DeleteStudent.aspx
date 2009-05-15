<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DeleteStudent.aspx.cs" Inherits="Admin_Students_DeleteStudent" %>

<asp:Content ID="headDeleteStudentPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentDeleteStudentPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="deleteStudentLabel" runat="server" CssClass="title" 
        Text="Исключение студента"></asp:Label>
    <br />
    <br />
    <br />
    <div style="text-align: center; font-size: medium">
        Вы действительно хотите исключить студента!!!
        Если вы точно уверены, то нажмите продолжить.
        <br />
        <br />
        <asp:Button ID="deleteStudent" runat="server" Text="Продолжить" 
            CssClass="button" onclick="deleteStudent_Click" />
    </div>
</asp:Content>

