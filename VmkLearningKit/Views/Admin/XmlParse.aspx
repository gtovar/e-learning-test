<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Администраторская панель / Загрузка XML
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
        });    

    </script>

    <%
        IEnumerable<VmkLearningKit.Core.XmlConverter.LogRecord> logStructureErrors = 
            (IEnumerable<VmkLearningKit.Core.XmlConverter.LogRecord>)ViewData["XmlParseStructureErrors"];
            
        IEnumerable<VmkLearningKit.Core.XmlConverter.LogRecord> logDataErrors = 
            (IEnumerable<VmkLearningKit.Core.XmlConverter.LogRecord>)ViewData["XmlParseDataErrors"];
    %>
        
    <div class="XmlParseStructureErrors">
        <p>Ошибки в структуре</p>
        <ul>
        <%           
            if (logStructureErrors != null)
                foreach (VmkLearningKit.Core.XmlConverter.LogRecord logRecord in logStructureErrors)
                {
                    %>
                    <li>
                        Строка: <%= Html.Encode(logRecord.LineNumber) %>
                        Позиция: <%= Html.Encode(logRecord.LinePosition) %>
                        Ошибка: <%= Html.Encode(logRecord.Message) %>
                    </li>    
                    <% 
                }
        %>
        </ul>
    </div>
    <div class="XmlParseDataErrors">
        <p>Ошибки в данных</p>
        <ul>
        <%           
            if (logDataErrors != null)
                foreach (VmkLearningKit.Core.XmlConverter.LogRecord logRecord in logDataErrors)
                {
                    %>
                    <li>
                        Строка: <%= Html.Encode(logRecord.LineNumber) %>
                        Позиция: <%= Html.Encode(logRecord.LinePosition) %>
                        Ошибка: <%= Html.Encode(logRecord.Message) %>
                    </li>    
                    <% 
                }
        %>
        </ul>
    </div>
    <div class="UploadVisibleContainer">
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
    <div class="UploadVisibleContainer">
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
    <div style="display:none;">
		<div id="UploadAndParseContainer">
			<p align="center">
				Выполняется разбор xml.
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
