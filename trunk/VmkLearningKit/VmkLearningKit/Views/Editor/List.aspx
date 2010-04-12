<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Список тестовых вопросов
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/Scripts/Plugins/FCKeditor/fckeditor.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("img[class=QuestionEdit]").click(function(){
                var editBlock = $(this).parent().nextAll("div[class=QuestionEditBlock]").attr("id");
                var url       = "/Editor/Edit/" + editBlock.substr(9);
                
                if ($("#" + editBlock).is(":hidden")) {
                    $.get(url,
		                  {},
                          function(response) {
                              $("div[class=QuestionEditBlock]").slideUp("slow").empty();
                              $("div[class=QuestionFooter]").slideUp("slow");
                              $("#" + editBlock).append(response).slideDown("slow");
                              $("#" + editBlock).nextAll("div[class=QuestionFooter]").slideDown("slow");
                              
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
                         );
                }
                else {
                    $("div[class=QuestionEditBlock]").slideUp("slow").empty();
                    $("div[class=QuestionFooter]").slideUp("slow");
                }
            });
		    
            $("img[class=QuestionDelete]").click(function(){
                var editBlock = $(this).parent().nextAll("div[class=QuestionEditBlock]").attr("id");
                var url       = "/Editor/Delete/" + editBlock.substr(9);
                $.post(url,
		               {}
                      );
                $(this).parents(".Question").animate({ opacity: "hide" }, "slow");
		    });
		    
		    $("img[class=QuestionCancel]").click(function(){
                var editBlock = $(this).parent().prevAll("div[class=QuestionEditBlock]").attr("id");
                
                $("#" + editBlock).slideUp("slow").empty();
                $(this).parent("div[class=QuestionFooter]").slideUp("slow");
		    });
		    
		    $("img[class=QuestionSave]").click(function(){
                document.forms["QuestionForm"].submit();
            });
		});
    </script>
    
    <h2>Список тестовых вопросов</h2>
    <br />
        <% 
            IEnumerable<Question> questionsList  = (IEnumerable<Question>)ViewData["QuestionsList"];
            long razdelId                        = Convert.ToInt64(ViewData["RazdelId"]);

            long questionNumber = 1;
        %>
        <div class="QuestionsList">
            <div class="MainQuestionHeader">
                <div class="QuestionNumber">№</div>   
                <div class="QuestionTitle">Краткое название</div> 
                <div class="QuestionType">Тип вопроса</div> 
            </div>
        <%
           
            foreach (var question in questionsList)
            { 
        %>
            <div class="Question">
                <div class="QuestionHeader">
                    <div class="QuestionNumber"><%= Html.Encode(questionNumber) %></div>
                    <div class="QuestionTitle"><%= Html.Encode(question.Title) %></div>
                    <div class="QuestionType">
                    <%
                        switch (question.Type)
                        {
                            case VLKConstants.QUESTION_TYPE_SIMPLE:
                                {
                                    %>
                                    <%= Html.Encode("Простой") %>
                                    <%
                                    
                                    break;
                                }
                            case VLKConstants.QUESTION_TYPE_ALTERNATIVE:
                                {
                                    %>
                                    <%= Html.Encode("Альтернативный") %>
                                    <%
                                    
                                    break;
                                }
                            case VLKConstants.QUESTION_TYPE_DISTRIBUTIVE:
                                {
                                    %>
                                    <%= Html.Encode("Дистрибутивный") %>
                                    <%
                                    
                                    break;
                                }
                            case VLKConstants.QUESTION_TYPE_FORMULA:
                                {
                                    %>
                                    <%= Html.Encode("Формула") %>
                                    <%
                                    
                                    break;
                                }                            
                        }
                    %>
                    </div>
                    <img src="/Content/Images/edit.png" class="QuestionEdit" alt="Редактировать" width="20" height="20" />
                    <img src="/Content/Images/delete.png" class="QuestionDelete" alt="Удалить" width="20" height="20" />
                </div>
                <div id="<%= Html.Encode("EditBlock" + question.Id.ToString()) %>" class="QuestionEditBlock"></div>
                <div class="QuestionFooter">
                    <% 
                       if (question.Type == VLKConstants.QUESTION_TYPE_DISTRIBUTIVE || question.Type == VLKConstants.QUESTION_TYPE_ALTERNATIVE)
                       {
                           %>
                            <img src="/Content/Images/add.png" class="AnswerAdd" alt="Добавить вариант ответа" width="20" height="20" />
                           <%
                       }
                    %>
                    <img src="/Content/Images/save.png" class="QuestionSave" alt="Сохранить" width="20" height="20" />
                    <img src="/Content/Images/cancel.png" class="QuestionCancel" alt="Отменить" width="20" height="20" />
                </div>
            </div>
        <% 
            ++questionNumber;
                
            } 
        %>
        </div>
        <br />
        <p>
            <%= Html.ActionLink("Создать новый вопрос", "Create", new { alias = razdelId }, new { id = "CreateNew" })%>
        </p>
        

</asp:Content>
