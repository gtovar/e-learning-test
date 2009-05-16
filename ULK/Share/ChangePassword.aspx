<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Share_ChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unn Learning Kit - Смена пароля</title>
</head>
<body>
<form runat="server" id="changePassword">
<br /><br /><br /><br /><br /><br /><br />
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
