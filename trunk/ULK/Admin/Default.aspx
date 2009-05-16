<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/AdminMasterPage.master"
    CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="DefaultAdminPage" ContentPlaceHolderID="adminContentPlaceHolder"
    runat="server">
    <div align="center">
        <br />
        <br />
        <div class="title">
            Панель администратора</div>
        <br />
        <asp:Label ID="HelloLabel" runat="server" Text="Здравствуйте!" Font-Size="Medium"
            Font-Bold="True"></asp:Label>
            <br />
                    <asp:Label ID="AdminInfoLabel" runat="server" Text="В каждом разделе вы можете управлять соответствующими сущностями." Font-Size="Medium"></asp:Label>
    </div>
</asp:Content>
