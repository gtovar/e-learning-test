<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master"CodeBehind="ManageAccounts.aspx.cs" Inherits="UnnLearningKit.Admin.ManageAccounts" %>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

<asp:Content ID="ManageAccountsPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:GridView ID="viewAccounts" runat="server">
    </asp:GridView>
    <br />
    <div>
    </div>
</asp:Content>
