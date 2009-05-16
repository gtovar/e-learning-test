<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unn Learning Kit - Восстановление пароля</title>
</head>
<body>
<form id="forgotPassword" runat="server">
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
<div align="center" style="vertical-align:middle">
<asp:PasswordRecovery ID="passwordRecovery" runat="server" BackColor="#EDF5FF" 
        BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
        Font-Names="Verdana" Font-Size="1.0em">
    <MailDefinition From="noreply@ulk.unn.ru" IsBodyHtml="True" Priority="High" 
        Subject="Ваш новый временный пароль!">
    </MailDefinition>
        <QuestionTemplate>
            <table border="0" cellpadding="4" cellspacing="0" 
                style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table border="0" cellpadding="0">
                            <tr>
                                <td align="center" colspan="2">
                                    <b>Чтобы получить пароль, ответьте на следующий вопрос</b></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Имя пользователя:</td>
                                <td>
                                    <asp:Literal ID="UserName" runat="server"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Вопрос:</td>
                                <td>
                                    <asp:Literal ID="Question" runat="server"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Ответ:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Answer" runat="server" Font-Size="0.8em"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                        ControlToValidate="Answer" ErrorMessage="Требуется ответ." 
                                        ToolTip="Требуется ответ." ValidationGroup="passwordRecovery">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="SubmitButton" runat="server" BackColor="White" 
                                        BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" 
                                        CommandName="Submit" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" 
                                        Text="Далее" ValidationGroup="passwordRecovery" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </QuestionTemplate>
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <SuccessTextStyle Font-Bold="True" ForeColor="#1C5E55" />
        <TextBoxStyle Font-Size="0.8em" />
        <UserNameTemplate>
            <table border="0" cellpadding="1" cellspacing="0" 
                style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table border="0" cellpadding="0">
                            <tr>
                                <td align="center" colspan="2">
                                <div class="title">
                                    Восстановление пароля
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Логин:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" 
                                        ErrorMessage="Поле &quot;Имя пользователя&quot; является обязательным." 
                                        ToolTip="Поле &quot;Имя пользователя&quot; является обязательным." 
                                        ValidationGroup="passwordRecovery">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" 
                                        Text="Далее" ValidationGroup="passwordRecovery" 
                                        CssClass="button" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </UserNameTemplate>
        <TitleTextStyle CssClass="title"/>
        <SubmitButtonStyle CssClass="button"/>
</asp:PasswordRecovery>
</div>
</form>
</body>
</html>
