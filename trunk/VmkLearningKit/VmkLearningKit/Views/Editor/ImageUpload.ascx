<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<% using (Html.BeginForm("ImageUpload", "Editor", FormMethod.Post, new { enctype = "multipart/form-data" }))
   { %>
        <p>
            <input type="file" id="ImageUpload" name="ImageUpload" value="Обзор" class="Button" />
            <input type="submit" value="Добавить" class="Button" />
        </p>
<% } %>
