<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Линый кабинет / Смена пароля 
 </asp:Content>

<asp:Content ID="changePasswordContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Смена пароля</h3>
    <% if(null != ViewData["ChangePasswordResult"] && !((Boolean)ViewData["ChangePasswordResult"]))
       { %>
    <div style="margin-top: 10px; margin-bottom: 10px; margin-left: 5px; color:Red; font-size: 15px">
       Проверьте правильность заполнения полей
    </div>
     <%}
       else if(null != ViewData["ChangePasswordResult"] && ((Boolean)ViewData["ChangePasswordResult"]))
       {%>
    <div style="margin-top: 10px; margin-bottom: 10px; margin-left: 5px; color:Green; font-size: 15px">
       Пароль изменен успешно!
    </div>
     <%} %>
    <div style="margin-top: 10px; margin-bottom: 10px; margin-left: 5px">
       Длина пароля должна быть не менее <%=Html.Encode(ViewData["PasswordLength"])%> символов.
    </div>

    <% using (Html.BeginForm()) { %>
            <table width="100%">
                <tr>
                    <td style="padding: 7px; width: 150px">Текущий пароль:</td>
                    <td style="padding: 7px"><%= Html.Password("currentPassword") %></td>
                    <td style="color:Red; padding: 7px"><%= Html.Encode(ViewData["currentPasswordError"]) %></td>
                </tr>
                <tr>
                    <td style="padding: 7px">Новый пароль:</td>
                    <td style="padding: 7px"><%= Html.Password("newPassword") %></td>
                    <td style="color:Red; padding: 7px"><%= Html.Encode(ViewData["newPasswordError"]) %></td>
                </tr>
                <tr>
                    <td style="padding: 7px">Подтвердите пароль:</td>
                    <td style="padding: 7px"><%= Html.Password("confirmPassword") %></td>
                    <td style="color:Red; padding: 7px"><%= Html.Encode(ViewData["confirmPasswordError"]) %></td>
                </tr>
                <tr>
                <td>
                    <input type="submit" name="ChangePassword" id="ChangePassword" value="Изменить" style="width:80px; height: 25px" />
                </td>
                </tr>
            </table>
    <% } %>
</asp:Content>
