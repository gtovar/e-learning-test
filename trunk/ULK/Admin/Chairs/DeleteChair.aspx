<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DeleteChair.aspx.cs" Inherits="Admin_Chairs_DeleteChair" %>

<asp:Content ID="headDeleteChairPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentDeleteChairPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="deleteChairLabel" runat="server" CssClass="title" 
        Text="Удаление кафедры"></asp:Label>
    <br />
    <br />
    <br />
    <div style="text-align: center; font-size: medium">
        Вы действительно хотите удалить кафедру, все дисциплины этой кафедру будут также удалены!!!
        Если вы точно уверены, то нажмите продолжить.
        <br />
        <br />
        <asp:Button ID="deleteChair" runat="server" Text="Продолжить" 
            CssClass="button" onclick="deleteChair_Click" />
    </div>
</asp:Content>

