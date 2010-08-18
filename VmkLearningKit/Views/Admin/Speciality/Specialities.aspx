<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	eВМК – электронный ВМК / Администраторская панель / Управление специальностями
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Управление специальностями</h3>
    <% try
       {
           if (null != ViewData["Specialities"] && null != ViewData["Department"] && null != ViewData["Departments"])
           {               
    %>
    <% Html.BeginForm(); %>
    <h4 style="margin-top: 10px">
        <span style="float: left; margin-bottom: 5px;">Факультет: &nbsp;&nbsp;&nbsp;
            <select id="Departments" name="Departments" onchange="SubmitPage('SpecialityFilters')">
                <%
                    foreach (Department department in (IEnumerable<Department>)ViewData["Departments"])
                    { %>
                <option value="<%=Html.Encode(department.Alias) %>" <% if(department.Alias.Equals(((Department)ViewData["Department"]).Alias)) { %>
                    selected="true" <% } %>>
                    <%=Html.Encode(department.Abbreviation) %>
                </option>
                <%} %>
            </select>
        </span><span style="float: right; margin-bottom: 5px;">
            <%=Html.ActionLink("Добавить специальность", "Specialities", "Admin", new { alias = "Add" }, new { @class = "" })%>
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
                Абривиатура
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
            foreach (Speciality speciality in (IEnumerable<Speciality>)ViewData["Specialities"])
            {    
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= index %>
            </td>
            <td>
                <%=Html.Encode(speciality.Title)%>
            </td>
            <td>
                <%=Html.Encode(speciality.Abbreviation)%>
            </td>
            <td>
                <%=Html.Encode(speciality.Alias)%>
            </td>
            <td>
                <a class="transparent_link" href="/Admin/Specialities/Edit/<%=Html.Encode(speciality.Alias) %>">
                    <img class="transparent_img" width="28" src="/Content/Images/edit.png" alt="Редактировать" /></a>
            </td>
            <td>
                <a class="transparent_link" href="#">
                    <img onclick="ConfirmDialog('Вы действительно уверены, что хотите удалить специальность <%=Html.Encode(speciality.Abbreviation) %>', '/Admin/Specialities/Delete/<%=Html.Encode(speciality.Alias) %>')"
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
           Utility.RedirectToErrorPage("AdminController.Specialities: catch exception", ex);
       } %>
</asp:Content>
