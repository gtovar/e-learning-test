<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="Register.aspx.cs" Inherits="UnnLearningKit.Register" %>

<asp:Content ID="RegisterPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" />
            <asp:CompleteWizardStep runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>
&nbsp;
</asp:Content>