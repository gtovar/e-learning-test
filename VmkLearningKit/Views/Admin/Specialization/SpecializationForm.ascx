<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<VmkLearningKit.Models.Repository.Specialization>" %>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>
 <%if (null != ViewData.Model)
        {%>
             <table style="margin: 15px;">
                <tr>
                    <td style="padding: 5px;">
                        <label for="title">
                            Название*:</label>
                    </td>
                    <td style="padding: 5px;">
                         <%= Html.TextBoxFor(model => model.Title, new { @class = "text_box" })%>
                    </td>
                    <td style="padding: 5px;  color:Red; font-style:italic">
                         <%= Html.ValidationMessageFor(model => model.Title) %>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 5px;">
                        <label for="alias">
                            Алиас*:</label>
                    </td>
                    <td style="padding: 5px;">
                        <%
                            string alias = Html.Encode(((Specialization)ViewData.Model).Alias);
                        %>
                        <%= Html.TextBox("specializationAlias", alias, new { @class = "text_box" })%>                  
                        
                    </td>
                    <td style="padding: 5px; color:Red; font-style:italic">
                        <%= Html.ValidationMessageFor(model => model.Alias) %>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 5px;">
                        <label for="abbreviation">
                            Аббревиатура*:</label>
                    </td>
                    <td style="padding: 5px;">
                        <%= Html.TextBoxFor(model => model.Abbreviation, new { @class = "text_box" })%>                
                    </td>
                    <td style="padding: 5px; color:Red ; font-style:italic">
                        <%= Html.ValidationMessageFor(model => model.Abbreviation) %>
                    </td>
                </tr>
               
                <tr>
                    <td style="padding: 5px;">
                        <label for="description">
                            Код*:</label>
                    </td>
                    <td style="padding: 5px;">
                        <%= Html.TextBoxFor(model => model.Code, new { @class = "text_box" })%>
                    </td>
                    <td style="padding: 5px; color:Red ; font-style:italic;">
                        <%= Html.ValidationMessageFor(model => model.Code) %>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 5px;">
                        <label for="speciality">
                            Специальность:</label>
                    </td>
                    <td style="padding: 5px;">
                      <select id="specialityId" name="specialityId" >
                            <%
                                foreach (Speciality speciality in (IEnumerable<Speciality>)ViewData["Specialities"])
                                { %>
                            <option value="<%=Html.Encode(speciality.Id) %>" <% if(speciality.Id.Equals(((Speciality)ViewData["Speciality"]).Id)) { %>
                                selected="true" <% } %>>
                                <%=Html.Encode(speciality.Abbreviation)%>
                            </option>
                            <%} %>
                        </select>
                    </td>
                    <td style="padding: 5px; color:Red ; font-style:italic;">
                        <%= Html.ValidationMessageFor(model => model.SpecialityId) %>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 5px;">
                        <label for="speciality">
                            Кафедра:</label>
                    </td>
                    <td style="padding: 5px;">
                      <select id="chairId" name="chairId" >
                            <%
                                foreach (Chair chair in (IEnumerable<Chair>)ViewData["Chairs"])
                                { %>
                            <option value="<%=Html.Encode(chair.Id) %>" <% if(chair.Id.Equals(((Chair)ViewData["Chair"]).Id)) { %>
                                selected="true" <% } %>>
                                <%=Html.Encode(chair.Abbreviation)%>
                            </option>
                            <%} %>
                        </select>
                    </td>
                    <td style="padding: 5px; color:Red ; font-style:italic;">
                        <%= Html.ValidationMessageFor(model => model.ChairId) %>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 5px;">
                        <label for="speciality">
                            Программа подготовки:</label>
                    </td>
                    <td style="padding: 5px;">
                      <select id="educationPlanId" name="educationPlanId" >
                            <%
                                foreach (EducationPlan educationPl in (IEnumerable<EducationPlan>)ViewData["EducationPlans"])
                                { %>
                            <option value="<%=Html.Encode(educationPl.Id) %>" <% if(educationPl.Id.Equals(((EducationPlan)ViewData["EducationPlan"]).Id)) { %>
                                selected="true" <% } %>>
                                <%=Html.Encode(educationPl.Title)%>
                            </option>
                            <%} %>
                        </select>
                    </td>
                    <td style="padding: 5px; color:Red ; font-style:italic;">
                        <%= Html.ValidationMessageFor(model => model.EducationPlan) %>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 5px;">
                        <input type="submit" class="submit" value="Сохранить" size="20px" />
                    </td>
                </tr>
            </table>
    
        <%}%>

    <%} %>


