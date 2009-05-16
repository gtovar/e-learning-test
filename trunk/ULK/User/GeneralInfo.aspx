<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User/UserMasterPage.master" CodeFile="GeneralInfo.aspx.cs" Inherits="User_GeneralInfo" %>

<asp:Content ID="GeneralUserPage"  ContentPlaceHolderID="userContentPlaceHolder" runat="server">
<asp:Label ID="studentsLabel" runat="server" Text="Общая информация" CssClass="title"></asp:Label>
    <div align="center">
        <br />
        <br />
        <table style="width: 100%;">
        <tr>
            <td align="right" class="style4">
                <b>Имя</b>
            </td>
            <td align="left" class="style5"> 
                </td>
            <td align="left" class="style4"> 
                <asp:Label ID="StudentName" runat="server" Text="*"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                <b>Логин</b>
            </td>
            <td align="left" class="style5">
                &nbsp;</td>
            <td align="left" class="style4">
                <asp:Label ID="StudentLogin" runat="server" Text="*"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                <b>Email</b>
            </td>
            <td align="left" class="style5">
                &nbsp;</td>
            <td align="left" class="style4">
                <asp:Label ID="StudentEmail" runat="server" Text="*"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                <b>Факультет</b>
            </td>
            <td align="left" class="style5">
                &nbsp;</td>
            <td align="left" class="style4">
                <asp:Label ID="StudentDepartment" runat="server" Text="*"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                <b>Группа</b>
            </td>
            <td align="left" class="style5">
                &nbsp;</td>
            <td align="left" class="style4">
                <asp:Label ID="StudentGroup" runat="server" Text="*"></asp:Label>
           </td>
        </tr>
    </table>
        
    </div>

</asp:Content>

<asp:Content ID="Content1" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style1
        {
            width: 45%;
        }
        .style2
        {
            width: 2%;
        }
        .style3
        {
            width: 45%;
        }
        .style4
        {
            width: 45%;
            height: 41px;
        }
        .style5
        {
            width: 2%;
            height: 41px;
        }
    </style>

</asp:Content>


