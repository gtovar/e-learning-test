<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="DeleteStudent.aspx.cs" Inherits="UnnLearningKit.Admin.Students.DeleteStudents" %>

<asp:Content ID="DeleteStudentPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <div class="notice">
        Вы уверены, что хотите удалить студента?<br /><br />
        Его регистрационная информация будет польностью удалена.
        <br />
        <br />
        <asp:Button ID="deleteStudentConfirm" runat="server" Text="Да, удалить" 
            CssClass="button" onclick="deleteStudentConfirm_Click" />
    </div>
</asp:Content>