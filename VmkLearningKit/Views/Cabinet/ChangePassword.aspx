<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    e��� � ����������� ��� / ����� ������� / ����� ������ 
 </asp:Content>

<asp:Content ID="changePasswordContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>����� ������</h3>
    <% if(null != ViewData["ChangePasswordResult"] && !((Boolean)ViewData["ChangePasswordResult"]))
       { %>
    <div style="margin-top: 10px; margin-bottom: 10px; margin-left: 5px; color:Red; font-size: 15px">
       ��������� ������������ ���������� �����
    </div>
     <%}
       else if(null != ViewData["ChangePasswordResult"] && ((Boolean)ViewData["ChangePasswordResult"]))
       {%>
    <div style="margin-top: 10px; margin-bottom: 10px; margin-left: 5px; color:Green; font-size: 15px">
       ������ ������� �������!
    </div>
     <%} %>
    <div style="margin-top: 10px; margin-bottom: 10px; margin-left: 5px">
       ����� ������ ������ ���� �� ����� <%=Html.Encode(ViewData["PasswordLength"])%> ��������.
    </div>

    <% using (Html.BeginForm()) { %>
            <table width="100%">
                <tr>
                    <td style="padding: 7px; width: 150px">������� ������:</td>
                    <td style="padding: 7px"><%= Html.Password("currentPassword") %></td>
                    <td style="color:Red; padding: 7px"><%= Html.Encode(ViewData["currentPasswordError"]) %></td>
                </tr>
                <tr>
                    <td style="padding: 7px">����� ������:</td>
                    <td style="padding: 7px"><%= Html.Password("newPassword") %></td>
                    <td style="color:Red; padding: 7px"><%= Html.Encode(ViewData["newPasswordError"]) %></td>
                </tr>
                <tr>
                    <td style="padding: 7px">����������� ������:</td>
                    <td style="padding: 7px"><%= Html.Password("confirmPassword") %></td>
                    <td style="color:Red; padding: 7px"><%= Html.Encode(ViewData["confirmPasswordError"]) %></td>
                </tr>
                <tr>
                <td>
                    <input type="submit" name="ChangePassword" id="ChangePassword" value="��������" style="width:80px; height: 25px" />
                </td>
                </tr>
            </table>
    <% } %>
</asp:Content>
