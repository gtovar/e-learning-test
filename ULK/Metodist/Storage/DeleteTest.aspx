<%@ Page Title="" Language="C#" MasterPageFile="~/Metodist/MetodistMasterPage.master" AutoEventWireup="true" CodeFile="DeleteTest.aspx.cs" Inherits="Metodist_DeleteTest" %>

<asp:Content ID="contentDeleteDisciplinePartTestPage" ContentPlaceHolderID="metodistContentPlaceHolder" Runat="Server">
    <asp:Label ID="deleteDisciplinePartLabel" runat="server" CssClass="title" 
        Text="Удаление теста"></asp:Label>
    <br />
    <br />
    <br />
    <div style="text-align: center; font-size: medium">
        Вы действительно хотите удалить этот тест?
        Если вы точно уверены, то нажмите продолжить.
        <br />
        <br />
        <asp:Button ID="deleteDisciplinePartTest" runat="server" Text="Продолжить" 
            CssClass="button" onclick="deleteDisciplinePartTest_Click" />
    </div>
</asp:Content>