<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DeleteDisciplinePart.aspx.cs" Inherits="Admin_DisciplineParts_DeleteDisciplinePart" %>

<asp:Content ID="headDeleteDisciplinePartPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentDeleteDisciplinePartPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="deleteDisciplinePartLabel" runat="server" CssClass="title" 
        Text="Удаление раздела дисциплины"></asp:Label>
    <br />
    <br />
    <br />
    <div style="text-align: center; font-size: medium">
        Вы действительно хотите удалить раздел дисциплины!!!
        Если вы точно уверены, то нажмите продолжить.
        <br />
        <br />
        <asp:Button ID="deleteDisciplinePart" runat="server" Text="Продолжить" 
            CssClass="button" onclick="deleteDisciplinePart_Click" />
    </div>
</asp:Content>

