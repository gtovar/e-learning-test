<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    e��� � ����������� ��� / ����� ������� / ��������� ��������
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>��������� ��������</h3>
    <% 
        if (null != Session["user"])
        {
            VmkLearningKit.Models.Domain.User user = (VmkLearningKit.Models.Domain.User)Session["user"]; 
    %>
    <%
        if (null != ViewData["UserErrorMessage"] && !ViewData["UserErrorMessage"].ToString().Trim().Equals(String.Empty))
        {
    %>
    <div class="errorMessage">
        <%= ViewData["UserErrorMessage"]%>
    </div>
    <%}
        else if (null != ViewData["UserErrorMessage"])
        { %>
    <div class="message">
        ��������� ������������ ������� ���������!
    </div>
    <%} %>
    <%
        if (null != ViewData["PofessorErrorMessage"] && !ViewData["PofessorErrorMessage"].ToString().Trim().Equals(String.Empty))
        {
    %>
    <div class="errorMessage">
        <%= ViewData["PofessorErrorMessage"]%>
    </div>
    <%}
        else if (null != ViewData["PofessorErrorMessage"])
        { %>
    <div class="message">
        ��������� ������������� ������� ���������!
    </div>
    <%} %>
    <% Html.BeginForm(); %>
    <table width="100%" style="margin-top: 10px;">
        <tr>
            <td>
                <div class="label">
                    �������:</div>
            </td>
            <td>
                <input type="text" name="SecondName" id="SecondName" class="input" value="<%= null != ViewData["SecondNameError"] ? ViewData["SecondName"] : user.DbUser.SecondName  %>" />
            </td>
            <% if (null != ViewData["SecondNameError"])
               {%>
            <td>
                <div class="fieldError">
                    <%= ViewData["SecondNameError"] %></div>
            </td>
            <% } %>
        </tr>
        <tr>
            <td>
                <div class="label">
                    ���:</div>
            </td>
            <td>
                <input type="text" name="FirstName" id="FirstName" class="input" value="<%= null != ViewData["FirstNameError"] ? ViewData["FirstName"] : user.DbUser.FirstName  %>" />
            </td>
            <% if (null != ViewData["FirstNameError"])
               {%>
            <td>
                <div class="fieldError">
                    <%= ViewData["FirstNameError"] %></div>
            </td>
            <% } %>
        </tr>
        <tr>
            <td>
                <div class="label">
                    ��������:</div>
            </td>
            <td>
                <input type="text" name="Patronymic" id="Patronymic" class="input" value="<%= null != ViewData["PatronymicError"] ? ViewData["Patronymic"] : user.DbUser.Patronymic  %>" />
            </td>
            <% if (null != ViewData["PatronymicError"])
               {%>
            <td>
                <div class="fieldError">
                    <%= ViewData["PatronymicError"]%></div>
            </td>
            <% } %>
        </tr>
        <tr>
            <td width="200px">
                <div class="label">
                    ����������� �����:</div>
            </td>
            <td>
                <input type="text" name="Email" id="Email" class="input" value="<%= null != ViewData["EmailError"] ? ViewData["Email"] : user.DbUser.Email  %>" />
            </td>
            <% if (null != ViewData["EmailError"])
               {%>
            <td>
                <div class="fieldError">
                    <%= ViewData["EmailError"]%></div>
            </td>
            <% } %>
        </tr>
        <tr>
            <td>
                <div class="label">
                    NickName:
                </div>
            </td>
            <td>
                <input type="text" name="NickName" id="NickName" class="input" value="<%= null != ViewData["NickNameError"] ? ViewData["NickName"] : user.DbUser.NickName  %>" />
                <div class="info">
                    ����������� ������ ��������� �����, ������������ � ��������
                    <br />
                    ������ �������� � �������� ������ �� ���� ��������</div>
            </td>
            <% if (null != ViewData["NickNameError"])
               {%>
            <td>
                <div class="fieldError">
                    <%= ViewData["NickNameError"]%></div>
            </td>
            <% } %>
        </tr>
        <% if (user.IsProfessor)
           {
               Professor professor = RepositoryManager.GetRepositoryManager.GetProfessorRepository.GetById(user.DbUser.Id);
        %>
        <tr>
            <td>
                <div class="label">
                    ������� �������:</div>
            </td>
            <td>
                <input type="text" name="Degree" id="Degree" class="input" value="<%= null != ViewData["DegreeError"] ? ViewData["Degree"] : professor.Degree  %>" />
                <div class="info">
                    ���� �������:
                    <%= professor.Chair.Title %></div>
            </td>
            <% if (null != ViewData["DegreeError"])
               {%>
            <td>
                <div class="fieldError">
                    <%= ViewData["DegreeError"]%></div>
            </td>
            <% } %>
        </tr>
        <tr>
            <td>
                <div class="label">
                    ���������:</div>
            </td>
            <td>
                <input type="text" name="Position" id="Position" class="input" value="<%= null != ViewData["PositionError"] ? ViewData["Position"] : professor.Position  %>" />
                <div class="info">
                    ����������� ���������, ���������� ���� � ������������</div>
            </td>
            <% if (null != ViewData["PositionError"])
               {%>
            <td>
                <div class="fieldError">
                    <%= ViewData["PositionError"]%></div>
            </td>
            <% } %>
        </tr>
        <tr>
            <td>
                <div class="label">
                    � ����:</div>
            </td>
            <td>
                <textarea name="About" id="About" class="text_area"> 
                                    <%= null != ViewData["AboutError"] ? ViewData["About"] : professor.About  %>
                                </textarea>
                <div class="info">
                    ������� ��������� � ���,
                    <br />
                    ������������ �� ����� ������� �� ����� �������</div>
            </td>
            <% if (null != ViewData["AboutError"])
               {%>
            <td>
                <div class="fieldError">
                    <%= ViewData["AboutError"]%></div>
            </td>
            <% } %>
        </tr>
        <% }%>
        <tr>
            <td>
                <input type="submit" class="submit" name="SaveAccountSettings" id="SaveAccountSettings"
                    value="���������" />
            </td>
        </tr>
    </table>
    <% Html.EndForm(); %>
    <% } %>
</asp:Content>
