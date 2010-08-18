<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<% using (Html.BeginForm())
   { %>
<table style="margin: 15px;">
    <tr>
        <td style="padding: 5px;">
            <label for="title">
                Название*:</label>
        </td>
        <td style="padding: 5px;">
            <%
                string title = "";
                if (null != ViewData.Model)
                {
                    title = Html.Encode(((Department)ViewData.Model).Title);
                }
            %>
            <%= Html.TextBox("departmentTitle", title, new { @class = "text_box" } )%>
        </td>
        <td style="padding: 5px;">
            <%= Html.ValidationMessage("departmentTitle")%>
        </td>
    </tr>
    <tr>
        <td style="padding: 5px;">
            <label for="alias">
                Алиас*:</label>
        </td>
        <td style="padding: 5px;">
            <%
                string alias = "";
                if (null != ViewData.Model)
                {
                    alias = Html.Encode(((Department)ViewData.Model).Alias);
                }
            %>
            <%= Html.TextBox("departmentAlias", alias, new { @class = "text_box" } )%>
        </td>
        <td style="padding: 5px;">
            <%= Html.ValidationMessage("departmentAlias")%>
        </td>
    </tr>
    <tr>
        <td style="padding: 5px;">
            <label for="abbreviation">
                Абривиатура*:</label>
        </td>
        <td style="padding: 5px;">
            <%
                string abbreviation = "";
                if (null != ViewData.Model)
                {
                    abbreviation = Html.Encode(((Department)ViewData.Model).Abbreviation);
                }
            %>
            <%= Html.TextBox("departmentAbbreviation", abbreviation, new { @class = "text_box" } )%>
        </td>
        <td style="padding: 5px;">
            <%= Html.ValidationMessage("departmentAbbreviation")%>
        </td>
    </tr>
    <tr>
        <td style="padding: 5px;">
            <label for="description">
                Описание*:</label>
        </td>
        <td style="padding: 5px;">
            <%
                string description = "";
                if (null != ViewData.Model)
                {
                    description = Html.Encode(((Department)ViewData.Model).Description);
                }
            %>
            <%= Html.TextArea("departmentDescription", description, new { @class = "text_area" })%>
        </td>
        <td style="padding: 5px;">
            <%= Html.ValidationMessage("departmentDescription")%>
        </td>
    </tr>
    <tr>
        <td style="padding: 5px;">
            <input type="submit" class="submit" value="Сохранить" size="20px" />
        </td>
    </tr>
</table>
<% } %>