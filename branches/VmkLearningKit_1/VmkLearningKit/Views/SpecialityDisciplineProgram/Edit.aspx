<%@ Page  Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VmkLearningKit.Models.Repository.SpecialityDisciplineProgram>"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/Scripts/Plugins/JHtmlArea/scripts/jHtmlArea-0.7.0.js"></script>
    <link rel="stylesheet" type="text/css" href="/Scripts/Plugins/JHtmlArea/style/jHtmlArea.css" />
    <link rel="stylesheet" type="text/css" href="/Content/SpecialityDisciplineProgram.css" />
    <script type="text/javascript">
        $(document).ready(function () {
            // Заменяем все элементы textarea с аттрибутом class="TextEditor"
            // на wysiwyg-редакторы (jHtmlArea)
            $("textarea[class=TextEditor]").htmlarea({
                toolbar: ["forecolor", "|",
													"bold", "italic", "underline", "strikethrough", "|",
													"subscript", "superscript", "|",
													"increasefontsize", "decreasefontsize", "|",
													"orderedlist", "unorderedlist", "|",
													"indent", "outdent", "|",
													"link", "unlink", "image", "horizontalrule", "|",
													"cut", "copy", "paste", "|",
													"html"
													]
            });

            // Добавляем обработчик для загрузки изображений
            $("a[class=image]").click(function () {
                var associatedFrame = $(this).parents("div[class=ToolBar]").next("div").children("iframe")[0];
                $.fancybox({
                    "href": "#ImageUploadContainer",
                    "titleShow": false,
                    "modal": true,
                    "onClosed": function () {
                        if ($("#ImageLink").html().substring(0, 4) == "http") {
                            associatedFrame.contentWindow.focus();
                            associatedFrame.contentWindow.document.execCommand("insertimage", false, $("#ImageLink").html());
                            $("#ImageLink").empty();
                        }
                        else {
                            $("#ImageLink").empty();
                        }
                    }
                });
            });

        });
    
    </script>


    <h2>Редактирование</h2>
<%
    if (null != ViewData["discipline"] && null != ViewData["disciplineProgram"])
    {
        //.Replace("Редактрировать", String.Format(@"<img src='/Content/Images/edit2.png' alt='Редактировать'/>Редактрировать"))
        SpecialityDiscipline discipline = (SpecialityDiscipline)ViewData["discipline"];
        SpecialityDisciplineProgram disciplineProgram = (SpecialityDisciplineProgram)ViewData["disciplineProgram"]; %>

        <% using (Html.BeginForm())
           {%>
            <%= Html.ValidationSummary(true)%>

        <div class="programText"> 


                
                <h2>Программа дисциплины "<% = Html.Encode(discipline.Title)%>"</h2>

            <br />
                <div class="editor-label">
                    <br />
                   <h3>1. Область применения</h3>
                </div>
                <div class="editor-field">
                    <%= Html.TextArea("ApplicationDomain", disciplineProgram.ApplicationDomain, new { @class = "TextEditor", style = "width:90%; height: 150px;" })%>
                </div>
            
                <div class="editor-label">
                    <br />
                    <h3>2. Цели и задачи дисциплины</h3>
                </div>
                <div class="editor-field">
                    <%= Html.TextArea("Purposes", disciplineProgram.Purposes, new { @class = "TextEditor", style = "width:90%; height: 150px;" })%>
                </div>
            
                <div class="editor-label">
                    <br />
                    <h3>3. Требования к уровню освоения содержания дисциплины</h3>
                </div>
                <div class="editor-field">
                      <%= Html.TextArea("Requirements", disciplineProgram.Requirements, new { @class = "TextEditor", style = "width:90%; height: 150px;" })%>
                </div>
            
                <div class="editor-label">
                    <br />
                 <h3>4.Объем дисциплины и виды учебной работы</h3>
                </div>
                <div class="editor-field">
                    <%= Html.TextArea("Volume", disciplineProgram.Volume, new { @class = "TextEditor", style = "width:90%; height: 150px;" })%>
                </div>
            
                <div class="editor-label">
                    <br />
                    <h3>5. Содержание дисциплины</h3>
                           <br />
                    <h4>5.1. Разделы дисциплины и виды занятий</h4>
                </div>
                <div class="editor-field">
                    <%= Html.TextArea("Razdels", disciplineProgram.Razdels, new { @class = "TextEditor", style = "width:90%; height: 150px;" })%>
                </div>
            
                <div class="editor-label">
                    <br />
                   <h4>5.2. Содержание разделов дисциплины</h4>
                </div>
                <div class="editor-field">
                    <%= Html.TextArea("RazdelsContent", disciplineProgram.RazdelsContent, new { @class = "TextEditor", style = "width:90%; height: 150px;" })%>
                </div>
            
                <div class="editor-label">
                    <br />
                   <h3>6. Лабораторный практикум.</h3>
                </div>
                <div class="editor-field">
                    <%= Html.TextArea("LabPractice", disciplineProgram.LabPractice, new { @class = "TextEditor", style = "width:90%; height: 150px;" })%>
                </div>
            
                <div class="editor-label">
                    <br />
                    <h3>7. Учебно-методическое обеспечение дисциплины</h3>
                </div>
                <div class="editor-field">
                    <%= Html.TextArea("Literature", disciplineProgram.Literature, new { @class = "TextEditor", style = "width:90%; height: 150px;" })%>
                </div>
            
                <div class="editor-label">
                    <br />
                    <h3>8. Вопросы для контроля</h3>
                </div>
                <div class="editor-field">
                    <%= Html.TextArea("Questions", disciplineProgram.Questions, new { @class = "TextEditor", style = "width:90%; height: 150px;" })%>
                </div>
            
                <div class="editor-label">
                    <br />
                    <h3>9. Критерии оценок</h3>
                </div>
                <div class="editor-field">
                    <%= Html.TextArea("MarkCriterias", disciplineProgram.MarkCriterias, new { @class = "TextEditor", style = "width:90%; height: 150px;" })%>
                </div>
            
                <div class="editor-label">
                    <br />
                    <h3>10. Примерная тематика курсовых работ и критерии их оценки </h3>
                </div>
                <div class="editor-field">
                    <%= Html.TextArea("Reporting", disciplineProgram.Reporting, new { @class = "TextEditor", style = "width:90%; height: 150px;" })%>
                </div>
            
                <div class="editor-label">
                    <br />
                    Дополнительно:
                </div>
                <div class="editor-field">
                    <%= Html.TextArea("Additional", disciplineProgram.Additional, new { @class = "TextEditor", style = "width:90%; height: 150px;" })%>
                </div>
            
                <div class="hidden">
                    <%= Html.TextBox("SpecialityDisciplineId", discipline.Id)%>
                    <%= Html.TextBox("Alias", discipline.Alias)%>
                </div>
                <br />
                <p>
                    <input type="submit" value="Сохранить" />
                </p>

       </div>

    <% }
        %>

    <div>
        <%= Html.ActionLink("Назад", "Index", "SpecialityDisciplineProgram", new { alias = discipline.Alias }, new { @class = "" })%>
    </div>
    <%} %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>

