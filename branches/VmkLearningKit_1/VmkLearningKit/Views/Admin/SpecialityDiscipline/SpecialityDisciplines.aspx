<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Администраторская панель / Управление дисциплинами
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Управление дисциплинами</h3>
    <% try
       {
           if (null != ViewData["SpecialityDisciplines"] &&
               null != ViewData["Department"] &&
               null != ViewData["Departments"] &&
               null != ViewData["Specialities"] &&
               null != ViewData["Speciality"] &&
               null != ViewData["EducationPlans"] &&
               null != ViewData["EducationPlan"] &&
               null != ViewData["Chairs"] &&
               null != ViewData["Chair"] &&
               null != ViewData["Professors"] &&
               null != ViewData["Professor"]
              )
           {               
    %>
    <% Html.BeginForm(); %>
    <h4 style="margin-top: 10px">
        <span style="float: left; margin-bottom: 5px;">
            <table>
                <tr>
                    <td style="padding: 3px;">
                        Факультет: &nbsp;&nbsp;&nbsp;
                    </td>
                    <td style="padding: 3px;">
                        <select id="Departments" name="Departments" onchange="SubmitPage('SpecialityDisciplineFilters')">
                            <%
                                foreach (Department department in (IEnumerable<Department>)ViewData["Departments"])
                                { %>
                            <option value="<%=Html.Encode(department.Alias) %>" <% if(department.Alias.Equals(((Department)ViewData["Department"]).Alias)) { %>
                                selected="true" <% } %>>
                                <%=Html.Encode(department.Abbreviation) %>
                            </option>
                            <%} %>
                        </select>
                    </td>
                    <td style="padding: 3px;">
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Кафедра: &nbsp;&nbsp;&nbsp;
                    </td>
                    <td style="padding: 3px;">
                        <select id="Chairs" name="Chairs" onchange="SubmitPage('SpecialityDisciplineFilters')">
                            <%
                                foreach (Chair chair in (IEnumerable<Chair>)ViewData["Chairs"])
                                { %>
                            <option value="<%=Html.Encode(chair.Alias) %>" <% if(chair.Alias.Equals(((Chair)ViewData["Chair"]).Alias)) { %>
                                selected="true" <% } %>>
                                <%=Html.Encode(chair.Abbreviation)%>
                            </option>
                            <%} %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 3px;">
                        Специальность: &nbsp;&nbsp;&nbsp;
                    </td>
                    <td style="padding: 3px;">
                        <select id="Specialities" name="Specialities" onchange="SubmitPage('SpecialityDisciplineFilters')">
                            <%
                                foreach (Speciality speciality in (IEnumerable<Speciality>)ViewData["Specialities"])
                                { %>
                            <option value="<%=Html.Encode(speciality.Alias) %>" <% if(speciality.Alias.Equals(((Speciality)ViewData["Speciality"]).Alias)) { %>
                                selected="true" <% } %>>
                                <%=Html.Encode(speciality.Abbreviation)%>
                            </option>
                            <%} %>
                        </select>
                    </td>
                    <td style="padding: 3px;">
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; План подготовки: &nbsp;&nbsp;&nbsp;
                    </td>
                    <td style="padding: 3px;">
                        <select id="EducationPlans" name="EducationPlans" onchange="SubmitPage('SpecialityDisciplineFilters')">
                            <%
                                foreach (EducationPlan educationPlan in (IEnumerable<EducationPlan>)ViewData["EducationPlans"])
                                { %>
                            <option value="<%=Html.Encode(educationPlan.Alias) %>" <% if(educationPlan.Alias.Equals(((EducationPlan)ViewData["EducationPlan"]).Alias)) { %>
                                selected="true" <% } %>>
                                <%=Html.Encode(educationPlan.Title)%>
                            </option>
                            <%} %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 3px;">
                        Преподаватель: &nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                        <select id="Professors" name="Professors" onchange="SubmitPage('SpecialityDisciplineFilters')">
                            <%
                                foreach (Professor professor in (IEnumerable<Professor>)ViewData["Professors"])
                                { %>
                            <option value="<%=Html.Encode(professor.User.NickName) %>" <% if(professor.User.NickName.Equals(((Professor)ViewData["Professor"]).User.NickName)) { %>
                                selected="true" <% } %>>
                                <% if (!professor.User.FirstName.Trim().Equals(String.Empty) &&
                                       !professor.User.Patronymic.Trim().Equals(String.Empty))
                                   { %>
                                        <%=Html.Encode(professor.User.SecondName + " " +
                                                    professor.User.FirstName[0].ToString().ToUpper() + "." +
                                                    professor.User.Patronymic[0].ToString().ToUpper() + ".")%>
                                <%}
                                   else
                                   { %>
                                        <%=Html.Encode(professor.User.SecondName)%>
                                <%} %>
                            </option>
                            <%} %>
                        </select>
                    </td>
                </tr>
            </table>
        </span><span style="float: right; margin-bottom: 5px; vertical-align: bottom">
            <%=Html.ActionLink("Добавить дисциплину", "SpecialityDisciplines", "Admin", new { alias = "Add" }, new { @class = "" }) %>
        </span>
    </h4>
    <% Html.EndForm(); %>
    <table width="100%" border="1">
        <tr class="table_header">
            <th width="50px" style="padding: 5px;">
                №
            </th>
            <th style="padding: 5px;">
                Название
            </th>
            <th style="padding: 5px;">
                Алиас
            </th>
            <th width="50px" style="padding: 5px;">
            </th>
            <th width="50px" style="padding: 5px;">
            </th>
        </tr>
        <%
            int index = 1;
            foreach (SpecialityDiscipline specialityDiscipline in (IEnumerable<SpecialityDiscipline>)ViewData["SpecialityDisciplines"])
            {    
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= index %>
            </td>
            <td>
                <%=Html.Encode(specialityDiscipline.Title)%>
            </td>
            <td>
                <%=Html.Encode(specialityDiscipline.Alias)%>
            </td>
            <td>
                <a class="transparent_link" href="/Admin/Specializations/Edit/<%=Html.Encode(specialityDiscipline.Alias) %>">
                    <img class="transparent_img" width="28" src="/Content/Images/edit.png" alt="Редактировать" /></a>
            </td>
            <td>
                <a class="transparent_link" href="#">
                    <img onclick="ConfirmDialog('Вы действительно уверены, что хотите удалить специализацию <%=Html.Encode(specialityDiscipline.Title) %>', '/Admin/Specializations/Delete/<%=Html.Encode(specialityDiscipline.Alias) %>')"
                        class="transparent_img" width="28" src="/Content/Images/delete.png" alt="Удалить" />
                </a>
            </td>
        </tr>
        <%
            index++;
            }
        %>
    </table>
    <%
        }
       }
       catch (Exception ex)
       {
           Utility.RedirectToErrorPage("AdminController.SpecialityDisciplines: catch exception", ex);
       } %>
</asp:Content>
