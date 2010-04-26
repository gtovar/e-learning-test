<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="VmkLearningKit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	�������� �������� �������� / �������� ��������� �������
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/Scripts/Plugins/FCKeditor/fckeditor.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#QuestionTypeList').change(function(){
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
                                        
                           // ���������� FCKeditor 
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
    <h2>�������� ��������� �������</h2>
    <table class="Editor" style="width:100%;">
        <tr class="Editor">
            <td class="Editor" style="width:10%"><b>����������:</b></td>
            <td class="Editor" style="width:60%"><%= Html.Encode(Convert.ToString(ViewData["DisciplineTitle"])) %></td>
            <td class="Editor" style="width:30%"><%= Html.ActionLink("������� � ������ ���������", "Professor", "Cabinet", new { alias = Convert.ToString(ViewData["ProfessorNickName"])}, new { @class = "" })%></td>
        </tr>
         <tr class="Editor">
            <td class="Editor" style="width:10%"><b>����:</b></td>
            <td class="Editor" style="width:60%"><%= Html.Encode(Convert.ToString(ViewData["TopicTitle"])) %></td>
            <td class="Editor" style="width:30%"><%= Html.ActionLink("������� � ������ ���", "Professor", "Cabinet", new { alias = Convert.ToString(ViewData["ProfessorNickName"]), additional = Convert.ToString(ViewData["DisciplineAlias"])}, new { @class = "" })%></td>
        </tr>
        <tr class="Editor">
            <td class="Editor" style="width:10%"><b>������:</b></td>
            <td class="Editor" style="width:60%"><%= Html.Encode(Convert.ToString(ViewData["RazdelTitle"])) %></td>
            <td class="Editor" style="width:30%"><%= Html.ActionLink("������� � ������ ��������", "Index", "Testing", new { alias = Convert.ToInt64(ViewData["TopicId"]) }, new { @class = "" })%></td>
        </tr>
	</table>
    <br />
    <%
        long                        razdelId         = Convert.ToInt64(ViewData["RazdelId"]);
        IEnumerable<SelectListItem> QuestionTypeList = (IEnumerable<SelectListItem>)ViewData["QuestionTypeList"];

        using (Html.BeginForm("Create", "Editor", new { alias = razdelId }, FormMethod.Post, new { id = "QuestionForm" }))
        {
            %>
            <p>�������� ��� �������: <%= Html.DropDownList("QuestionTypeList", QuestionTypeList) %></p>
            <div class="QuestionsList">
                <div class="Question">
                    <div class="QuestionEditBlock"></div>
                    <div class="QuestionFooter">
                        <img src="/Content/Images/save.png" class="QuestionSave" alt="���������" width="20" height="20" />
                    </div>
                </div>
            </div>
            <%
        } 
    %>
    <br />
    <p>
        <%= Html.ActionLink("��������� � ������ �������� �� �������", "List", new { alias = razdelId }) %>
    </p>
</asp:Content>
