<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Создание тестового вопроса
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/Scripts/Plugins/FCKeditor/fckeditor.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#QuestionTypeList option').click(function(){
                var url;
		        switch ($(this).attr('value')) {
                    case '0' : url = '/Editor/CreateSimple';       break;
                    case '1' : url = '/Editor/CreateAlternative';  break;
                    case '2' : url = '/Editor/CreateDistributive'; break;
                    case '3' : url = '/Editor/CreateFormula';      break;
                    default  : url = '#';                          break;
                }
		        
		        $.post(url,
		               {},
                       function(response) {
                           $('div[class=QuestionFooter]').hide('slow');
                           $('div[class=QuestionEditBlock]').hide('slow').empty();
                           $('div[class=QuestionEditBlock]').append(response).show('slow');
                           $('div[class=QuestionFooter]').show('slow');
                                        
                           // Подключаем FCKeditor 
                           var textAreas = document.getElementsByTagName("textarea");
                           for (var i = 0; i < textAreas.length; i++)
                           {
                               var fCKeditor                          = new FCKeditor(textAreas[i].id);
                               fCKeditor.Config.Enabled               = true;
                               fCKeditor.Config.UserFilesPath         = "/Uploads/Images/";
                               fCKeditor.Config.UserFilesAbsolutePath = "/Uploads/Images/";
                                          
                               fCKeditor.Height   = "150";
                               fCKeditor.BasePath = "/Scripts/Plugins/FCKeditor/";
                               fCKeditor.ReplaceTextarea();  
                           } 
                       }
                      )
            });
            
            $("img[class=QuestionSave]").click(function(){
                document.forms["QuestionForm"].submit();
            });
        });
    </script>
    <h2>Создание тестового вопроса</h2>
    <br />
    <%
        long                        razdelId         = Convert.ToInt64(ViewData["RazdelId"]);
        IEnumerable<SelectListItem> QuestionTypeList = (IEnumerable<SelectListItem>)ViewData["QuestionTypeList"];

        using (Html.BeginForm("Create", "Editor", new { alias = razdelId }, FormMethod.Post, new { id = "QuestionForm" }))
        {
            %>
            <p>Выберите тип вопроса: <%= Html.DropDownList("QuestionTypeList", QuestionTypeList) %></p>
            <div class="QuestionsList">
                <div class="Question">
                    <div class="QuestionEditBlock"></div>
                    <div class="QuestionFooter">
                        <img src="/Content/Images/save.png" class="QuestionSave" alt="Сохранить" width="20" height="20" />
                    </div>
                </div>
            </div>
            <%
        } 
    %>
    <br />
    <p>
        <%= Html.ActionLink("Вернуться к списку вопросов по разделу", "List", new { alias = razdelId }) %>
    </p>
</asp:Content>
