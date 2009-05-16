<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unn Learning Kit</title>
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
</head>
<body>
<form id="authForm" runat="server">
    <table align="center">

    <tr><td colspan="2">
    <div align="center">
        <br />
        <asp:LoginView ID="loginView" runat="server" 
            onviewchanged="loginView_ViewChanged">
            <LoggedInTemplate>
            </LoggedInTemplate>
            <AnonymousTemplate>
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
                    <b>Пожалуйста авторизуйтесь перед началом работы! </b>
                </div>
                <br />
                <asp:Login ID="loginForm" runat="server" BackColor="#EDF5FF" BorderColor="#B5C7DE"
                    BorderPadding="0" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana"
                    Font-Size="0.8em" ForeColor="#333333" Height="148px" Width="327px">
                    <TextBoxStyle Font-Size="1.0em" />
                    <LoginButtonStyle CssClass="button"/>
                    <LayoutTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" style="height: 148px; width: 327px;">
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Font-Size="Small">Имя пользователя:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserName" runat="server" Font-Size="Small" Width="110px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                    ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="ctl00$loginForm">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Font-Size="Small">Пароль:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Password" runat="server" Font-Size="Small" TextMode="Password" Width="110px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ctl00$loginForm">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="RememberMe" runat="server" Text="Запомнить меня" 
                                                    Font-Size="X-Small" />
                                            </td>
                                            <td class="style1"><a href="ForgotPassword.aspx">Забыли пароль?</a></td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color: Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#507CD1"
                                                    BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana"
                                                    Font-Size="Small" ForeColor="#284E98" Height="20px" Text="Войти" ValidationGroup="ctl00$loginForm"
                                                    Width="100px" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <TitleTextStyle CssClass="title"/>
                </asp:Login>
            </AnonymousTemplate>
        </asp:LoginView>
        <br />
    </div>
    <asp:SqlDataSource ID="usersInRolesSqlDataSource" runat="server"></asp:SqlDataSource>
    </td></tr>
    </table>
    </form>
</body>
</html>
