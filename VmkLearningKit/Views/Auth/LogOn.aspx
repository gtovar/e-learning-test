<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК: Авторизация
</asp:Content>
<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <table align="center">
        <tr>
            <td>
                <h2 align="center">
                    Представьтесь, пожалуйста:</h2>
                <div id="helpMessage">
                    Введите свой логин и пароль.
                </div>
                <div id="error"><%= ViewData["message"] %></div>
                <% using (Html.BeginForm())
                   { %>
                <table id="logon" align="center">
                    <tr>
                        <td>
                            <label for="login">
                                Ваш логин:</label>
                        </td>
                        <td>
                            <%= Html.TextBox("Login")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="password">
                                Ваш пароль:</label>
                        </td>
                        <td>
                            <%= Html.Password("Password")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" id="SubmitLogOn" value="Войти" />
                        </td>
                    </tr>
                </table>
    <% } %>
    </td> </tr> </table>
</asp:Content>
