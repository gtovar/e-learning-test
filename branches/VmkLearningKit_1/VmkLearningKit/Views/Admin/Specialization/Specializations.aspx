<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Администраторская панель / Управление специализациями
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Управление специализациями</h3>
    <% try
       {
           if (null != ViewData["Specializations"] &&
               null != ViewData["Department"] &&
               null != ViewData["Departments"] &&
               null != ViewData["Specialities"] &&
               null != ViewData["Speciality"] &&
               null != ViewData["EducationPlans"] &&
               null != ViewData["EducationPlan"] &&
               null != ViewData["Chairs"] &&
               null != ViewData["Chair"]
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
                        <select id="Departments" name="Departments" onchange="SubmitPage('SpecializationFilters')">
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
                        <select id="Chairs" name="Chairs" onchange="SubmitPage('SpecializationFilters')">
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
                        <select id="Specialities" name="Specialities" onchange="SubmitPage('SpecializationFilters')">
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
                        <select id="EducationPlans" name="EducationPlans" onchange="SubmitPage('SpecializationFilters')">
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
            </table>
        </span><span style="float: right; margin-bottom: 5px; vertical-align:bottom">
            <%=Html.ActionLink("Добавить специализацию", "Specializations", "Admin", new { alias = "Add" }, new { @class = "" }) %>
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
            foreach (Specialization specialization in (IEnumerable<Specialization>)ViewData["Specializations"])
            {    
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= index %>
            </td>
            <td>
                <%=Html.Encode(specialization.Title)%>
            </td>
            <td>
                <%=Html.Encode(specialization.Alias)%>
            </td>
            <td>
                <a class="transparent_link" href="/Admin/Specializations/Edit/<%=Html.Encode(specialization.Alias) %>">
                    <img class="transparent_img" width="28" src="/Content/Images/edit.png" alt="Редактировать" /></a>
            </td>
            <td>
                <a class="transparent_link" href="#">
                    <img onclick="ConfirmDialog('Вы действительно уверены, что хотите удалить специализацию <%=Html.Encode(specialization.Title) %>', '/Admin/Specializations/Delete/<%=Html.Encode(specialization.Alias) %>')"
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
           Utility.RedirectToErrorPage("AdminController.Specializations: catch exception", ex);
       } %>
</asp:Content>
