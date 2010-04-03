<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ������������� � �������������
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (null != ViewData["SpecialityAlias"] && null != ViewData["SpecialityDisciplines"])
       { %>
    <% if (null == ViewData["EducationPlans"] || 0 == ((IEnumerable<EducationPlan>)ViewData["EducationPlans"]).Count())
       { %>
    <h3>
        ����� ���������� ��� �� ���������</h3>
    <% }
       else
       { %>
    <h3>
        ���� ����������</h3>
    <%  foreach (EducationPlan educationPlan in (IEnumerable<EducationPlan>)ViewData["EducationPlans"])
        {                    
    %>
    <h4 style="margin-top: 10px; margin-bottom: 5px;">
        <%= Html.Encode(educationPlan.Title) %></h4>
    <table width="100%" border="1">
        <tr class="table_header">
            <th rowspan="2">
                �
            </th>
            <th rowspan="2">
                ����������
            </th>
            <th colspan="3">
                ����� � ������
            </th>
            <th rowspan="2">
                �������
            </th>
            <th rowspan="2">
                ����������
            </th>
            <th rowspan="2">
                �������
            </th>
            <th rowspan="2">
                �������������
            </th>
        </tr>
        <tr class="table_header">
            <th>
                �.
            </th>
            <th>
                �.
            </th>
            <th>
                ���.
            </th>
        </tr>
        <% 
            int index = 1;
            foreach (SpecialityDiscipline specialityDiscipline in (IEnumerable<SpecialityDiscipline>)ViewData["SpecialityDisciplines"])
            {
                if (educationPlan.Id == specialityDiscipline.EducationPlanId)
                {
        %>
        <% string[] categories = specialityDiscipline.Category.Split(':');
           foreach (string category in categories)
           {
               %>
               <tr class="table_row">
                <td style="padding: 7px;">
                </td>
               <%
               switch(category)
               {
                   // ������ ��������� �����������
                   case "��":
                       %>
                        <td align="left" colspan="8" style="padding: 7px; font-size: 14px; font-weight: bolder;">
                            ���������� �����������
                        </td>
                       <%
                       break;
                   // ������ ��������� ������������ �����������
                   case "��":
                       %>
                        <td align="left" colspan="8" style="padding: 7px; font-size: 12px; font-weight: bold;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����������� ���������
                        </td>
                       <%
                       break;
                   // ������ ��������� ������������� �����������
                   case "��":
                       %>
                       <td align="left" colspan="8" style="padding: 7px; font-size: 12px; font-weight: bold;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������������ ���������
                       </td>
                       <%
                       break;
                   // ������ ��������� �� ������
                   case "���":
                       %>
                        <td align="left" colspan="8" style="padding: 7px; font-size: 12px; font-weight: bold;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���������� �� ������
                        </td>
                       <%
                       break;
                   // ������ ��������� �������������
                   case "��":
                       %>
                        <td align="left" colspan="8" style="padding: 7px; font-size: 14px; font-weight: bolder;">
                            ���������� �������������
                        </td>
                       <%
                       break;
                   // ������ ����������� ���������
                   case "���":
                       %>
                        <td align="left" colspan="8" style="padding: 7px; font-size: 12px; font-weight: bold;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            ����������� ����������
                        </td>
                       <%
                       break;
                   // ������ ��������� ������������� �� ������
                   case "����":
                       %>
                        <td align="left" colspan="8" style="padding: 7px; font-size: 12px; font-weight: bold;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            ���������� �� ������
                        </td>
                       <%
                       break;
                   default:
                       try
                       {
                           long specializationId = Convert.ToInt64(category);
                           Specialization specialization = RepositoryManager.GetRepositoryManager.GetSpecializationRepository.GetById(specializationId);
                           if (null != specialization)
                           {
                               %>
                                <td align="left" colspan="8" style="padding: 7px; font-size: 12px; font-weight: bold;">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <%= Html.Encode(specialization.Title) %>
                                </td>
                               <%
                           }
                       }
                       catch (Exception ex)
                       {
                           Utility.RedirectToErrorPage("Specialities.aspx: catch exception", ex);
                       }
                       break;
               
        %>
        </tr>
        <%
            }
           }
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= index %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(specialityDiscipline.Title) %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(specialityDiscipline.LectureVolume)%>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(specialityDiscipline.PracticeVolume) %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(specialityDiscipline.LabVolume)%>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(specialityDiscipline.Term) %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(specialityDiscipline.Reporting) %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(specialityDiscipline.Chair.Title) %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(specialityDiscipline.Professor.User.SecondName + " " +
                                                               specialityDiscipline.Professor.User.FirstName + " " + specialityDiscipline.Professor.User.Patronymic)%>
            </td>
        </tr>
        <% index++;
                } %>
        <% } %>
    </table>
    <br />
    <% } %>
    <% } %>
    <% }
       else
       { %>
    <table width="100%">
        <% 
            try
            {
                if (null != ViewData["Specialities"])
                {
                    int i = 0;
                    foreach (Speciality speciality in (IEnumerable<Speciality>)ViewData["Specialities"])
                    {
        %>
        <tr>
            <% if (0 != i)
               {%>
            <td style="padding-top: 15px;">
                <% }
               else { i++; } %>
                <h3>
                    <%= Html.Encode(speciality.Title)%></h3>
            </td>
        </tr>
        <% if (null != ViewData["EducationPlans"])
           {
        %>
        <% 
            foreach (EducationPlan educationPlan in (IEnumerable<EducationPlan>)ViewData["EducationPlans"])
            {
        %>
        <tr>
            <td style="padding-bottom: 3px; padding-top: 7px;">
                <span id="h4">
                    <%= Html.Encode(educationPlan.Title)%>
                </span>
            </td>
            <td style="padding-bottom: 3px;">
                <%= Html.ActionLink("���� ����������", "Specialities", "Home", new { alias = Html.Encode(speciality.Alias) ,additional = Html.Encode(educationPlan.Alias) }, new { @class = ""} )%>
            </td>
        </tr>
        <% 
            foreach (Specialization specialization in (IEnumerable<Specialization>)speciality.Specializations)
            {
        %>
        <% if (educationPlan.Id == specialization.EducationPlanId)
           { %>
        <tr>
            <td>
                <span style="margin-left: 20px;">
                    <%= Html.Encode(specialization.Chair.Title)%>
                    &nbsp;&nbsp;-&nbsp;&nbsp;
                    <%= Html.Encode(specialization.Title)%>
                </span>
            </td>
        </tr>
        <% } %>
        <% } %>
        <% } %>
        <% } %>
        <% } %>
        <% }
            }
            catch (Exception ex)
            {
                Utility.RedirectToErrorPage("Specialities.aspx: catch exception", ex);
            }
        %>
    </table>
    <% } %>
</asp:Content>
