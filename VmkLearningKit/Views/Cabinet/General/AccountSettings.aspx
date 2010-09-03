<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Линый кабинет / Настройки аккаунта
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Настройки аккаунта</h3>
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
        Настройки пользователя успешно обновлены!
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
        Настройки преподавателя успешно обновлены!
    </div>
    <%} %>
    <% Html.BeginForm(); %>
    <table width="100%" style="margin-top: 10px;">
        <tr>
            <td>
                <div class="label">
                    Фамилия:</div>
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
                    Имя:</div>
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
                    Отчество:</div>
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
                    Электронная почта:</div>
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
                    Используйте только латинские буквы, используется в адресной
                    <br />
                    строке браузера в качестве ссылки на вашу страницу</div>
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
                    Научная степень:</div>
            </td>
            <td>
                <input type="text" name="Degree" id="Degree" class="input" value="<%= null != ViewData["DegreeError"] ? ViewData["Degree"] : professor.Degree  %>" />
                <div class="info">
                    Ваша кафедра:
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
                    Должность:</div>
            </td>
            <td>
                <input type="text" name="Position" id="Position" class="input" value="<%= null != ViewData["PositionError"] ? ViewData["Position"] : professor.Position  %>" />
                <div class="info">
                    Официальная должность, занимаемая вами в университете</div>
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
                    О себе:</div>
            </td>
            <td>
                <textarea name="About" id="About" class="text_area"> 
                                    <%= null != ViewData["AboutError"] ? ViewData["About"] : professor.About  %>
                                </textarea>
                <div class="info">
                    Краткая иформация о вас,
                    <br />
                    отображаемая на вашей странце на сайте кафедры</div>
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
                    value="Сохранить" />
            </td>
        </tr>
    </table>
    <% Html.EndForm(); %>
    <% } %>
</asp:Content>
