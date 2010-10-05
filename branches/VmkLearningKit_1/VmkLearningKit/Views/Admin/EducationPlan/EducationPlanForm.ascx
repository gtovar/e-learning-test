<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<VmkLearningKit.Models.Repository.EducationPlan>" %>

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
                            string alias = Html.Encode(((EducationPlan)ViewData.Model).Alias);
                        %>
                        <%= Html.TextBox("educationPlanAlias", alias, new { @class = "text_box" })%>                  
                        
                    </td>
                    <td style="padding: 5px; color:Red; font-style:italic">
                        <%= Html.ValidationMessageFor(model => model.Alias) %>
                    </td>
                </tr>
            
                <tr>
                    <td style="padding: 5px;">
                        <input type="submit" class="submit" value="Сохранить" size="20px" />
                    </td>
                </tr>
            </table>
               
        <%}%>
<% } %>

  


