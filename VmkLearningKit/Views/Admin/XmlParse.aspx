<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Администраторская панель / Загрузка образовательных документов
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/Scripts/Plugins/FancyBox/scripts/jquery.fancybox-1.3.1.js"></script>
	<link rel="stylesheet" type="text/css" href="/Scripts/Plugins/FancyBox/style/jquery.fancybox-1.3.1.css" media="screen" />
    <script type="text/javascript">

        $(document).ready(function () {
            $("#UploadAndParse_Chairs").fancybox({
                "titleShow": false,
                "modal": true,
                "onComplete": function () { document.forms["UploadChairsForm"].submit(); }
            });

            $("#UploadAndParse_Teachers").fancybox({
                "titleShow": false,
                "modal": true,
                "onComplete": function () { document.forms["UploadTeachersForm"].submit(); }
            });

            $("#UploadAndParse_Students").fancybox({
                "titleShow": false,
                "modal": true,
                "onComplete": function () { document.forms["UploadStudentsForm"].submit(); }
            });

            $("#UploadAndParse_Groups").fancybox({
                "titleShow": false,
                "modal": true,
                "onComplete": function () { document.forms["UploadGroupsForm"].submit(); }
            });

            $("#UploadAndParse_Specialities").fancybox({
                "titleShow": false,
                "modal": true,
                "onComplete": function () { document.forms["UploadSpecialitiesForm"].submit(); }
            });

            $("#UploadAndParse_EducationPlan").fancybox({
                "titleShow": false,
                "modal": true,
                "onComplete": function () { document.forms["UploadEducationPlanForm"].submit(); }
            });

            $("#UploadAndParse_Shedule").fancybox({
                "titleShow": false,
                "modal": true,
                "onComplete": function () { document.forms["UploadSheduleForm"].submit(); }
            });

            $("#UploadAndParse_DisciplineProgram").fancybox({
                "titleShow": false,
                "modal": true,
                "onComplete": function () { document.forms["UploadDisciplineProgramForm"].submit(); }
            });

            //$(".uploaders h3").eq(0).addClass("active");
            //$(".uploaders.UploadVisibleContainer").eq(0).show();

            $(".uploaders h3").click(function () {
                $(this).next(".UploadVisibleContainer").slideToggle("slow").siblings("div:visible").slideUp("slow");
                $(this).toggleClass("active");
                $(this).siblings("h3").removeClass("active");
            });
        });    

    </script>

    <div class="XmlParseOk">
    <%
        if (ViewData["XmlParseOk"] != null && Convert.ToBoolean(ViewData["XmlParseOk"]))
        {
            %><h3>Данные были успешно добавлены</h3><%
        }
    %>                                                       
    </div>

    <div class="XmlParseErrors">
    <%
        IEnumerable<VmkLearningKit.Core.XmlConverter.LogRecord> logStructureErrors = 
            (IEnumerable<VmkLearningKit.Core.XmlConverter.LogRecord>)ViewData["XmlParseStructureErrors"];
            
        IEnumerable<VmkLearningKit.Core.XmlConverter.LogRecord> logDataErrors = 
            (IEnumerable<VmkLearningKit.Core.XmlConverter.LogRecord>)ViewData["XmlParseDataErrors"];

        if (logStructureErrors != null)
        {
            %>
            
                <h3>Ошибки в структуре</h3>
                <div class="ErrorsContainer">
                <ul>  
            <%    
                foreach (VmkLearningKit.Core.XmlConverter.LogRecord logRecord in logStructureErrors)
                {
                %>
                <li>
                    Строка: <%= Html.Encode(logRecord.LineNumber)%>
                    Позиция: <%= Html.Encode(logRecord.LinePosition)%>
                    Ошибка: <%= Html.Encode(logRecord.Message)%>
                </li>    
                <% 
                }
            %>
                </ul>
                </div>  
            <%
        }
        
        if (logDataErrors != null)
        {
            %>
                <h3>Ошибки в данных</h3>
                <div class="ErrorsContainer">
                <ul>  
            <%    
                foreach (VmkLearningKit.Core.XmlConverter.LogRecord logRecord in logDataErrors)
                {
                %>
                <li>
                    Строка: <%= Html.Encode(logRecord.LineNumber)%>
                    Позиция: <%= Html.Encode(logRecord.LinePosition)%>
                    Ошибка: <%= Html.Encode(logRecord.Message)%>
                </li>    
                <% 
                }
            %>
                </ul>
               </div>
            <%
        }
    %>
    </div> 
    <div class="uploaders">
        <h3><a href="#">Загрузка кафедр</a></h3>
        <div class="UploadVisibleContainer">
            <p>Пожалуйста, выберите XML-документ, содержащий список кафедр, и нажмите "Добавить". С шаблоном соответствующего документа можно ознакомиться <%= Html.ActionLink("здесь", "Templates", "Admin", new { alias = "Xml", additional = "Chairs" }, new { id = "chairsLink" }) %>.</p>
            <% using (Html.BeginForm("XmlParse", "Admin", new { alias = VLKConstants.XML_UPLOAD_ALIAS_CHAIRS }, FormMethod.Post, new { enctype = "multipart/form-data", id = "UploadChairsForm", name = "UploadChairsForm" }))
               { %>
                   <p align="center">
                       <input type="file" id="FileUpload_Chairs" name="FileUpload_Chairs" value="Обзор" class="XmlFileUpload" /> 
                   </p>
                   <p align="center">    
                       <a href="#UploadAndParseContainer" id="UploadAndParse_Chairs">Добавить</a>
                   </p>
            <% } %>
        </div>
        <h3><a href="#">Загрузка преподавателей</a></h3>
        <div class="UploadVisibleContainer">
            <p>Пожалуйста, выберите XML-документ, содержащий список преподавателей, и нажмите "Добавить". С шаблоном соответствующего документа можно ознакомиться <%= Html.ActionLink("здесь", "Templates", "Admin", new { alias = "Xml", additional = "Teachers" }, new { id = "teachersLink" }) %>.</p>
            <% using (Html.BeginForm("XmlParse", "Admin", new { alias = VLKConstants.XML_UPLOAD_ALIAS_TEACHERS }, FormMethod.Post, new { enctype = "multipart/form-data", id = "UploadTeachersForm", name = "UploadTeachersForm" }))
               { %>
                   <p align="center">
                       <input type="file" id="FileUpload_Teachers" name="FileUpload_Teachers" value="Обзор" class="XmlFileUpload" /> 
                   </p>
                   <p align="center">    
                       <a href="#UploadAndParseContainer" id="UploadAndParse_Teachers">Добавить</a>
                   </p>
            <% } %>
        </div>
        <h3><a href="#">Загрузка специальностей</a></h3>
        <div class="UploadVisibleContainer">
            <p>Пожалуйста, выберите XML-документ, содержащий список специальностей, и нажмите "Добавить". С шаблоном соответствующего документа можно ознакомиться <%= Html.ActionLink("здесь", "Templates", "Admin", new { alias = "Xml", additional = "Specialities" }, new { id = "specialitiesLink" })%>.</p>
            <% using (Html.BeginForm("XmlParse", "Admin", new { alias = VLKConstants.XML_UPLOAD_ALIAS_SPECIALITIES }, FormMethod.Post, new { enctype = "multipart/form-data", id = "UploadSpecialitiesForm", name = "UploadSpecialitiesForm" }))
               { %>
                   <p align="center">
                       <input type="file" id="FileUpload_Specialities" name="FileUpload_Specialities" value="Обзор" class="XmlFileUpload" /> 
                   </p>
                   <p align="center">    
                       <a href="#UploadAndParseContainer" id="UploadAndParse_Specialities">Добавить</a>
                   </p>
            <% } %>
        </div>
        <h3><a href="#">Загрузка групп</a></h3>
        <div class="UploadVisibleContainer">
            <p>Пожалуйста, выберите XML-документ, содержащий список групп, и нажмите "Добавить". С шаблоном соответствующего документа можно ознакомиться <%= Html.ActionLink("здесь", "Templates", "Admin", new { alias = "Xml", additional = "Groups" }, new { id = "groupsLink" }) %>.</p>
            <% using (Html.BeginForm("XmlParse", "Admin", new { alias = VLKConstants.XML_UPLOAD_ALIAS_GROUPS }, FormMethod.Post, new { enctype = "multipart/form-data", id = "UploadGroupsForm", name = "UploadGroupsForm" }))
               { %>
                   <p align="center">
                       <input type="file" id="FileUpload_Groups" name="FileUpload_Groups" value="Обзор" class="XmlFileUpload" /> 
                   </p>
                   <p align="center">    
                       <a href="#UploadAndParseContainer" id="UploadAndParse_Groups">Добавить</a>
                   </p>
            <% } %>
        </div>
        <h3><a href="#">Загрузка студентов</a></h3>
        <div class="UploadVisibleContainer">
            <p>Пожалуйста, выберите XML-документ, содержащий список студентов, и нажмите "Добавить". С шаблоном соответствующего документа можно ознакомиться <%= Html.ActionLink("здесь", "Templates", "Admin", new { alias = "Xml", additional = "Students" }, new { id = "studentsLink" })%>.</p>
            <% using (Html.BeginForm("XmlParse", "Admin", new { alias = VLKConstants.XML_UPLOAD_ALIAS_STUDENTS }, FormMethod.Post, new { enctype = "multipart/form-data", id = "UploadStudentsForm", name = "UploadStudentsForm" }))
               { %>
                   <p align="center">
                       <input type="file" id="FileUpload_Students" name="FileUpload_Students" value="Обзор" class="XmlFileUpload" /> 
                   </p>
                   <p align="center">    
                       <a href="#UploadAndParseContainer" id="UploadAndParse_Students">Добавить</a>
                   </p>
            <% } %>
        </div>
        <h3><a href="#">Загрузка образовательного плана</a></h3>
        <div class="UploadVisibleContainer">
            <p>Пожалуйста, выберите XML-документ, содержащий образовательный план, и нажмите "Добавить". С шаблоном соответствующего документа можно ознакомиться <%= Html.ActionLink("здесь", "Templates", "Admin", new { alias = "Xml", additional = "EducationPlan" }, new { id = "educationPlanLink" })%>.</p>
            <% using (Html.BeginForm("XmlParse", "Admin", new { alias = VLKConstants.XML_UPLOAD_ALIAS_EDUCATION_PLAN }, FormMethod.Post, new { enctype = "multipart/form-data", id = "UploadEducationPlanForm", name = "UploadEducationPlanForm" }))
               { %>
                   <p align="center">
                       <input type="file" id="FileUpload_EducationPlan" name="FileUpload_EducationPlan" value="Обзор" class="XmlFileUpload" /> 
                   </p>
                   <p align="center">    
                       <a href="#UploadAndParseContainer" id="UploadAndParse_EducationPlan">Добавить</a>
                   </p>
            <% } %>
        </div>
        <h3><a href="#">Загрузка расписания</a></h3>
        <div class="UploadVisibleContainer">
            <p>Пожалуйста, выберите XML-документ, содержащий расписание, и нажмите "Добавить". С шаблоном соответствующего документа можно ознакомиться <%= Html.ActionLink("здесь", "Templates", "Admin", new { alias = "Xml", additional = "Shedule" }, new { id = "sheduleLink" }) %>.</p>
            <% using (Html.BeginForm("XmlParse", "Admin", new { alias = VLKConstants.XML_UPLOAD_ALIAS_SHEDULE }, FormMethod.Post, new { enctype = "multipart/form-data", id = "UploadSheduleForm", name = "UploadSheduleForm" }))
               { %>
                   <p align="center">
                       <input type="file" id="FileUpload_Shedule" name="FileUpload_Shedule" value="Обзор" class="XmlFileUpload" /> 
                   </p>
                   <p align="center">    
                       <a href="#UploadAndParseContainer" id="UploadAndParse_Shedule">Добавить</a>
                   </p>
            <% } %>
        </div>
        <h3><a href="#">Загрузка программы дисциплины</a></h3>
        <div class="UploadVisibleContainer">
            <p>Пожалуйста, выберите XML-документ, содержащий программу дисциплины, и нажмите "Добавить". С шаблоном соответствующего документа можно ознакомиться <%= Html.ActionLink("здесь", "Templates", "Admin", new { alias = "Xml", additional = "DisciplineProgram" }, new { id = "disciplineProgramLink" })%>.</p>
            <% using (Html.BeginForm("XmlParse", "Admin", new { alias = VLKConstants.XML_UPLOAD_ALIAS_DISCIPLINE_PROGRAM }, FormMethod.Post, new { enctype = "multipart/form-data", id = "UploadDisciplineProgramForm", name = "UploadDisciplineProgramForm" }))
               { %>
                   <p align="center">
                       <input type="file" id="FileUpload_DisciplineProgram" name="FileUpload_DisciplineProgram" value="Обзор" class="XmlFileUpload" /> 
                   </p>
                   <p align="center">    
                       <a href="#UploadAndParseContainer" id="UploadAndParse_DisciplineProgram">Добавить</a>
                   </p>
            <% } %>
        </div>
    </div>
    <br />
    <p align="center"><%= Html.ActionLink("Вернуться в личный кабинет", "Admin", "Cabinet", new { alias = Convert.ToString(ViewData["Nickname"]) }, new { @class = "" } )%></p>        
    <div style="display:none;">
		<div id="UploadAndParseContainer">
			<p align="center">
				Выполняется разбор xml...
			</p>
			<p align="center">
			    <img src="/Content/Images/progress.gif" alt="Идет загрузка" />
			</p>
			<p align="center">Пожалуйста, подождите</p>
		</div>
	</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
