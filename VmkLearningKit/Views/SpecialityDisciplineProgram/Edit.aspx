<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VmkLearningKit.Models.Repository.SpecialityDisciplineProgram>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/Scripts/Plugins/JHtmlArea/scripts/jHtmlArea-0.7.0.js"></script>
    <link rel="stylesheet" type="text/css" href="/Scripts/Plugins/JHtmlArea/style/jHtmlArea.css" />
    <link rel="stylesheet" type="text/css" href="/Content/SpecialityDisciplineProgram.css" />
    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.SpecialityDisciplineId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.SpecialityDisciplineId) %>
                <%= Html.ValidationMessageFor(model => model.SpecialityDisciplineId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ApplicationDomain) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ApplicationDomain) %>
                <%= Html.ValidationMessageFor(model => model.ApplicationDomain) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Purposes) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Purposes) %>
                <%= Html.ValidationMessageFor(model => model.Purposes) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Requirements) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Requirements) %>
                <%= Html.ValidationMessageFor(model => model.Requirements) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Volume) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Volume) %>
                <%= Html.ValidationMessageFor(model => model.Volume) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Razdels) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Razdels) %>
                <%= Html.ValidationMessageFor(model => model.Razdels) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.RazdelsContent) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.RazdelsContent) %>
                <%= Html.ValidationMessageFor(model => model.RazdelsContent) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.LabPractice) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.LabPractice) %>
                <%= Html.ValidationMessageFor(model => model.LabPractice) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Literature) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Literature) %>
                <%= Html.ValidationMessageFor(model => model.Literature) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Questions) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Questions) %>
                <%= Html.ValidationMessageFor(model => model.Questions) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.MarkCriterias) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.MarkCriterias) %>
                <%= Html.ValidationMessageFor(model => model.MarkCriterias) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Reporting) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Reporting) %>
                <%= Html.ValidationMessageFor(model => model.Reporting) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Additional) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Additional) %>
                <%= Html.ValidationMessageFor(model => model.Additional) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>

