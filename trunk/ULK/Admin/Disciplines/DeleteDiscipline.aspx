<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DeleteDiscipline.aspx.cs" Inherits="Admin_Disciplines_DeleteDiscipline" %>

<asp:Content ID="headDeleteDisciplinePage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentDeleteDisciplinePage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="deleteDisciplineLabel" runat="server" CssClass="title" 
        Text="Удаление дисциплины"></asp:Label>
    <br />
    <br />
    <br />
    <div style="text-align: center; font-size: medium">
        Вы действительно хотите удалить дисциплину, все ее разделы будут также удалены!!!
        Если вы точно уверены, то нажмите продолжить.
        <br />
        <br />
        <asp:Button ID="deleteDiscipline" runat="server" Text="Продолжить" 
            CssClass="button" onclick="deleteDiscipline_Click" />
    </div>
</asp:Content>

