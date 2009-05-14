<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DeleteGroup.aspx.cs" Inherits="Admin_Groups_DeleteGroups" %>

<asp:Content ID="headDeleteGroupsPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentDeleteGroupsPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="deleteGroupLabel" runat="server" CssClass="title" 
        Text="Удаление группы"></asp:Label>
    <br />
    <br />
    <br />
    <div style="text-align: center; font-size: medium">
        Вы действительно хотите удалить группу, все студенты этой группы будут также удалены!!!
        Если вы точно уверены, то нажмите продолжить.
        <br />
        <br />
        <asp:Button ID="deleteGroup" runat="server" Text="Продолжить" 
            CssClass="button" onclick="deleteGroup_Click" />
    </div>
</asp:Content>

