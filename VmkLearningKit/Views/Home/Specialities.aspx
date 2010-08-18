<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Специальности и специализации
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (null != ViewData["SpecialityAlias"] && null != ViewData["SpecialityDisciplines"])
       { %>
    <% if (null == ViewData["EducationPlans"] || 0 == ((IEnumerable<EducationPlan>)ViewData["EducationPlans"]).Count())
       { %>
    <h3>
        Планы подготовки еще не заполнены</h3>
    <% }
       else
       { %>
    <h3>
        План подготовки</h3>
    <%  
        foreach (EducationPlan educationPlan in (IEnumerable<EducationPlan>)ViewData["EducationPlans"])
        {                    
    %>
    <h4 style="margin-top: 10px; margin-bottom: 5px;">
        <%= Html.Encode(educationPlan.Title) %></h4>
    <table width="100%" border="1">
        <tr class="table_header">
            <th rowspan="2">
                №
            </th>
            <th rowspan="2">
                Дисциплина
            </th>
            <th colspan="3">
                Часов в неделю
            </th>
            <th rowspan="2">
                Семестр
            </th>
            <th rowspan="2">
                Отчетность
            </th>
            <th rowspan="2">
                Кафедра
            </th>
            <th rowspan="2">
                Преподаватель
            </th>
        </tr>
        <tr class="table_header">
            <th>
                Л.
            </th>
            <th>
                П.
            </th>
            <th>
                Лаб.
            </th>
        </tr>
        <% 
            int index = 1;
            List<string> prevCategories = new List<string>();
            foreach (SpecialityDiscipline specialityDiscipline in (IEnumerable<SpecialityDiscipline>)ViewData["SpecialityDisciplines"])
            {
                if (educationPlan.Id == specialityDiscipline.EducationPlanId)
                {
        %>
        <%     string[] categories = specialityDiscipline.Category.Split(':');
               string lastContainedCategory = String.Empty;
               foreach (string category in categories)
               {
                   if (prevCategories.Contains(category))
                   {
                       lastContainedCategory = category;
                   }
                   else
                   {
                       if (!lastContainedCategory.Trim().Equals(String.Empty))
                       {
                           int foundIndex = prevCategories.IndexOf(lastContainedCategory);
                           if (-1 != foundIndex)
                           {
                               int categoryIndex = prevCategories.Count - 1;
                               while (categoryIndex > foundIndex)
                               {
                                   prevCategories.RemoveAt(categoryIndex);
                                   categoryIndex--;
                               }
                           }
                       }
                       prevCategories.Add(category);
                       lastContainedCategory = String.Empty;
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
            </td>
            <%
                switch (category)
                {
                    // Список дисциплин направления
                    case "ДН":
            %>
            <td align="left" colspan="8" style="padding: 7px; font-size: 14px; font-weight: bolder;">
                Дисциплины направления
            </td>
            <%
                break;
                    // Список дисциплин федерального направления
                    case "ФК":
            %>
            <td align="left" colspan="8" style="padding: 7px; font-size: 12px; font-weight: bold;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Федеральный компонент
            </td>
            <%
                break;
                // Список дисциплин регионального направления
                case "РК":
            %>
            <td align="left" colspan="8" style="padding: 7px; font-size: 12px; font-weight: bold;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Региональный компонент
            </td>
            <%
                break;
                // Список дисциплин вузовского направления
                case "ВК":
            %>
            <td align="left" colspan="8" style="padding: 7px; font-size: 12px; font-weight: bold;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Вузовский компонент
            </td>
            <%
                break;
                // Список дисциплин по выбору
                case "ДПВ":
            %>
            <td align="left" colspan="8" style="padding: 7px; font-size: 12px; font-weight: bold;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Дисциплины по выбору
            </td>
            <%
                break;
                // Список дисциплин специализации
                case "ДС":
            %>
            <td align="left" colspan="8" style="padding: 7px; font-size: 14px; font-weight: bolder;">
                Дисциплины специализации
            </td>
            <%
                break;
                // Список специальных дисциплин
                case "СПД":
            %>
            <td align="left" colspan="8" style="padding: 7px; font-size: 12px; font-weight: bold;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Специальные дисциплины
            </td>
            <%
                break;
                // Список дисциплин специализации по выбору
                /*
                case "ДСПВ":
                */
            %>
            <!--
                        <td align="left" colspan="8" style="padding: 7px; font-size: 12px; font-weight: bold;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Дисциплины по выбору
                        </td>
                        -->
            <%
                /*
                       break;
                */
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
                <%= Html.Encode(specialization.Title)%>
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
               }
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= index %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(specialityDiscipline.Title) %>
            </td>
            <% 
                string lectureVolume = String.Empty;
                string practiceVolume = String.Empty;
                string labVolume = String.Empty;
                string term = String.Empty;
                string reporting = String.Empty;
                foreach (SpecialityDisciplineTerm specialityDisciplineTerm in (IEnumerable<SpecialityDisciplineTerm>)specialityDiscipline.SpecialityDisciplineTerms)
                {
                    if (0 != specialityDisciplineTerm.LectureVolume)
                    {
                        lectureVolume += specialityDisciplineTerm.Term + " сем. - " + specialityDisciplineTerm.LectureVolume + "<br />";
                    }
                    if (0 != specialityDisciplineTerm.PracticeVolume)
                    {
                        practiceVolume += specialityDisciplineTerm.Term + " сем. - " + specialityDisciplineTerm.PracticeVolume + "<br />";
                    }
                    if (0 != specialityDisciplineTerm.LabVolume)
                    {
                        labVolume += specialityDisciplineTerm.Term + " сем. - " + specialityDisciplineTerm.LabVolume + "<br />";
                    }
                    if (!specialityDisciplineTerm.Reporting.Equals(String.Empty))
                    {
                        reporting += specialityDisciplineTerm.Term + " сем. - " + specialityDisciplineTerm.Reporting + "<br />";
                    }
                    term += specialityDisciplineTerm.Term + ", ";
                }
                if (lectureVolume.Trim().Equals(String.Empty))
                {
                    lectureVolume = "0";
                }
                if (practiceVolume.Trim().Equals(String.Empty))
                {
                    practiceVolume = "0";
                }
                if (labVolume.Trim().Equals(String.Empty))
                {
                    labVolume = "0";
                }
                if (reporting.Trim().Equals(String.Empty))
                {
                    reporting = "Нет";
                }
            %>
            <td style="padding: 7px; width: 75px">
                <%= lectureVolume.Trim(',', ' ', '<', '>', 'b', 'r', '/')%>
            </td>
            <td style="padding: 7px; width: 75px">
                <%= practiceVolume.Trim(',', ' ', '<', '>', 'b', 'r', '/') %>
            </td>
            <td style="padding: 7px; width: 75px">
                <%= labVolume.Trim(',', ' ', '<', '>', 'b', 'r', '/')%>
            </td>
            <td style="padding: 7px; width: 75px">
                <%= term.Trim(',', ' ') %>
            </td>
            <td style="padding: 7px; width: 125px">
                <%= reporting.Trim(',', ' ', '<', '>', 'b', 'r', '/') %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(specialityDiscipline.Chair.Title) %>
            </td>
            <td style="padding: 7px;">
                <%
                    if (!specialityDiscipline.Professor.User.FirstName.Trim().Equals(String.Empty) &&
                       !specialityDiscipline.Professor.User.Patronymic.Trim().Equals(String.Empty))
                    {
                %>
                <%= Html.Encode(specialityDiscipline.Professor.User.SecondName + " " +
                                                      specialityDiscipline.Professor.User.FirstName[0].ToString().ToUpper() + "." + specialityDiscipline.Professor.User.Patronymic[0].ToString().ToUpper() + ".")%>
                <% }
                    else
                    { %>
                <%= Html.Encode(specialityDiscipline.Professor.User.SecondName)%>
                <% } %>
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
                <%= Html.ActionLink("План подготовки", "Specialities", "Home", new { alias = Html.Encode(speciality.Alias) ,additional = Html.Encode(educationPlan.Alias) }, new { @class = ""} )%>
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
