<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<VmkLearningKit.Models.Repository.Department>" %>

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
                           string alias = Html.Encode(((Department)ViewData.Model).Alias);
                        %>
                        <%= Html.TextBox("departmentAlias", alias , new { @class = "text_box" })%>                  
                        
                    </td>
                    <td style="padding: 5px; color:Red; font-style:italic">
                        <%= Html.ValidationMessageFor(model => model.Alias) %>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 5px;">
                        <label for="abbreviation">
                            Аббревиатура *:</label>
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
                            Описание*:</label>
                    </td>
                    <td style="padding: 5px;">
                        <%= Html.TextAreaFor(model => model.Description, new { @class = "text_area" })%>
                    </td>
                    <td style="padding: 5px;">
                        <%= Html.ValidationMessageFor(model => model.Description) %>
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

  


