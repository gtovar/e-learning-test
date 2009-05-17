<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Share_ChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unn Learning Kit - Смена пароля</title>
        <link rel="stylesheet" type="text/css" href="../Styles.css" />
    <style type="text/css">
        #changePassword
        {
            text-align: center;
        }
    </style>
</head>
<body>
<form runat="server" id="changePassword">
<div>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <b>Для смены пароля заполните все поля формы</b>
                </div>
                <br />
<div align="center" style="vertical-align:middle">
    <asp:ChangePassword ID="changePasswd" runat="server" 
        CancelDestinationPageUrl="~/Default.aspx" BackColor="#EDF5FF" 
        BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
        Font-Names="Verdana" Font-Size="1.0em" 
        ChangePasswordTitleText="Сменить пароль">
        <CancelButtonStyle CssClass="button"/>
        <PasswordHintStyle Font-Italic="True" ForeColor="#1C5E55" />
        <ContinueButtonStyle CssClass="button"/>
        <ChangePasswordButtonStyle CssClass="button"/>
        <TitleTextStyle CssClass="title"/>
        <ChangePasswordTemplate>
            <table border="0" cellpadding="4" cellspacing="0" 
                style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table border="0" cellpadding="0">
                            <tr>
                                <td align="right">
                                    <asp:Label ID="CurrentPasswordLabel" runat="server" 
                                        AssociatedControlID="CurrentPassword">Текущий пароль:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="CurrentPassword" runat="server" Font-Size="0.8em" 
                                        TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                                        ControlToValidate="CurrentPassword" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="changePasswd">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="NewPasswordLabel" runat="server" 
                                        AssociatedControlID="NewPassword">Новый пароль:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="NewPassword" runat="server" Font-Size="0.8em" 
                                        TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                        ControlToValidate="NewPassword" ErrorMessage="New Password is required." 
                                        ToolTip="New Password is required." ValidationGroup="changePasswd">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                        AssociatedControlID="ConfirmNewPassword">Подтверждение:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" Font-Size="0.8em" 
                                        TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                        ControlToValidate="ConfirmNewPassword" 
                                        ErrorMessage="Confirm New Password is required." 
                                        ToolTip="Confirm New Password is required." ValidationGroup="changePasswd">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                        ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                        Display="Dynamic" 
                                        ErrorMessage="The Confirm New Password must match the New Password entry." 
                                        ValidationGroup="changePasswd"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="ChangePasswordPushButton" runat="server" 
                                        CommandName="ChangePassword" CssClass="button" Text="Сменить пароль" 
                                        ValidationGroup="changePasswd" />
                                </td>
                                <td>
                                    <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" CssClass="button" Text="Отмена" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ChangePasswordTemplate>
        <SuccessTemplate>
            <table border="0" cellpadding="4" cellspacing="0" 
                style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table border="0" cellpadding="0">
                            <tr>
                                <td align="center" colspan="2" 
                                    style="color:White;background-color:#1C5E55;font-size:0.9em;font-weight:bold;">
                                    Смена пароля завершена</td>
                            </tr>
                            <tr>
                                <td>
                                    Пароль был изменен!</td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="ContinuePushButton" runat="server" BackColor="White" 
                                        BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" 
                                        CausesValidation="False" CommandName="Continue" Font-Names="Verdana" 
                                        Font-Size="0.8em" ForeColor="#1C5E55" PostBackUrl="~/Default.aspx" 
                                        Text="На главную" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </SuccessTemplate>
        <TextBoxStyle Font-Size="0.8em" />
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
    </asp:ChangePassword>
    </div>
    </form>
</body>
</html>
