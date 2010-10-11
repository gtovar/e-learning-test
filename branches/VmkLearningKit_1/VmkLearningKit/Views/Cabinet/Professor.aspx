<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    e��� � ����������� ��� / ����� ������� / ������� �������������
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% try
       {
           if (null != ViewData["ProfessorSpecialityDisciplines"] && null != ViewData["Professor"])
           {
               Professor professor = (Professor)ViewData["Professor"];
    %>
    <h2 style="margin-top: 5px; margin-bottom: 10px;">
        ������������� ����������
    </h2>
    <table width="100%" border="1">
        <tr class="table_header">
            <th style="padding: 7px; width: 30px;">
                �
            </th>
            <th style="padding: 7px;">
                ����������
            </th>
            <th style="padding: 7px; width: 100px">
                �������
            </th>
            <th style="padding: 7px; width: 100px">
                ���������
            </th>
        </tr>
        <% int index = 1;
           foreach (SpecialityDiscipline specialityDiscipline in (IEnumerable<SpecialityDiscipline>)ViewData["ProfessorSpecialityDisciplines"])
           {                    
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= index%>
            </td>
            <td style="padding: 7px;  text-align: left; font-size: 15px">
                <%= Html.ActionLink(Html.Encode(specialityDiscipline.Title), "Professor", "Cabinet", new { alias = professor.User.NickName, additional = specialityDiscipline.Alias}, new { @class = "" })%>
            </td>
            <% string term = String.Empty;
               foreach (SpecialityDisciplineTerm specialityDisciplineTerm in (IEnumerable<SpecialityDisciplineTerm>)specialityDiscipline.SpecialityDisciplineTerms)
               {
                   term += specialityDisciplineTerm.Term + ", ";
               }
            %>
            <td style="padding: 7px;">
                <%= term.Trim(',', ' ')%>
            </td>
            <td style="padding: 7px;">
                <%= Html.ActionLink("���������", "Professor", "Cabinet", new { alias = "Detailed", additional = specialityDiscipline.Alias }, new { @class = "" } ) %>
            </td>
        </tr>
        <% index++;
           } %>
    </table>          
    <% }
           else if (null != ViewData["SpecialityDiscipline"] && null != ViewData["Professor"])
           {
               Professor professor = (Professor)ViewData["Professor"];
               SpecialityDiscipline specialityDiscipline = (SpecialityDiscipline)ViewData["SpecialityDiscipline"];
               if (null != ViewData["SpecialityDisciplineTopics"] && null != ViewData["LecturePlans"])
               {
    %>
    <table width='100%'>
        <tr>
            <td>
                <h2 style="margin-top: 5px; margin-bottom: 10px;">
                <%= Html.Encode(specialityDiscipline.Title) %>
                </h2>
            </td>
            <td style="text-align:right">
            <p style="margin-top: 5px; margin-bottom: 10px; font-size:medium">
            <%=Html.ActionLink("�������� ��������� ����������", "GetDisciplineProgramDocument", "Document", new { specialityDisciplineId = ((SpecialityDiscipline)ViewData["SpecialityDiscipline"]).Id }, new {@class="" })%>
      </p>
      </td>
            <td style="text-align:center; width:150px">
               <p style="margin-top: 5px; margin-bottom: 10px; font-size:medium">
               <%=Html.ActionLink("� ���������", "Statement", "Statement", new { alias = ((Professor)ViewData["Professor"]).User.NickName, additional = ((SpecialityDiscipline)ViewData["SpecialityDiscipline"]).Alias}, new { @class = "" })%>
                </p>
            </td>
        </tr>
    </table>
   
    <% if (null != ViewData["LecturePlanSavingHasErrors"] && ((Boolean)ViewData["LecturePlanSavingHasErrors"]))
       { %>
        <div style="text-align: center; color:Red; font-size: 16px; margin: 10px">
            <%= ViewData["LecturePlanErrorMessage"]%>
        </div>
    <% }
       else if (null != ViewData["LecturePlanSavingHasErrors"] && !((Boolean)ViewData["LecturePlanSavingHasErrors"]))
       { %>
            <div style="text-align: center; color:Green; font-size: 16px; margin: 10px">
                ���������� ���� �������� �������!
            </div>
     <%} %>
    <% Html.BeginForm("Professor", "Cabinet", FormMethod.Post, new { @name = "LectionPlanForm", @id="LectionPlanForm" } ); %>
     
    <table width="100%" border="1">
        <tr class="table_header">
            <th style="padding: 7px; width: 30px">
                �
            </th>
            <th style="padding: 7px;">
                ����
            </th>
            <th style="padding: 7px;">
                ����
            </th>
            <th style="padding: 7px;">
                �����
            </th>
            <th style="padding: 7px;">
                ���������
            </th>
            <th style="padding: 7px; width: 150px">
                ������������
            </th>
        </tr>
        <% 
            string time = String.Empty;
            string room = String.Empty;
            string building = String.Empty;
            IEnumerable<SelectListItem> lectureDates = (IEnumerable<SelectListItem>)ViewData["LectureDatesList"];
            Dictionary<long, string> existedDates = (Dictionary<long, string>)ViewData["ExistedDates"];
            foreach (LectureTimetable timetable in specialityDiscipline.LectureTimetables)
            {
                if (timetable.SpecialityDisciplineId == specialityDiscipline.Id &&
                    professor.UserId == timetable.ProfessorId)
                {
                    time = timetable.Time;
                    room = timetable.Room.ToString();
                    building = timetable.Building.ToString();
                    break;
                }
            }
                   
           int index = 1;
           string lectionPlanIds = String.Empty;
           foreach (LecturePlan plan in (IEnumerable<LecturePlan>)ViewData["LecturePlans"])
           {
               lectionPlanIds += plan.Id + ",";
        %>
        <tr class="table_row">
            <td style="padding: 7px; width:40px">
                <%= index%>
            </td>
            <td style="padding: 7px;">
                <div style="color: Red; font-size: 13px; text-align: left"><%= ViewData["LectionPlan" + plan.Id + "Error"] %></div>
                <input type="text" style="width:100%; height:20px; font-size: 15px" name="LectionPlanId_<%= plan.Id %>" id="LectionPlanId_<%= plan.Id %>" value="<%= null != ViewData["LecturePlanSavingHasErrors"] && ((Boolean)ViewData["LecturePlanSavingHasErrors"]) ? Html.Encode(ViewData["LectionPlanId_" + plan.Id]) : Html.Encode(plan.SpecialityDisciplineTopic.Title)%>" />
            </td>
            <td id="LectureDateTD<%=plan.SpecialityDisciplineTopicId.ToString() %>" style="padding: 7px; width:60px;">
                <%= Html.DropDownList("LectureDate" + plan.SpecialityDisciplineTopicId.ToString(), lectureDates, new { id = "LectureDate" + plan.SpecialityDisciplineTopicId.ToString(), @class = "LectureDate"}) %>
                <%= existedDates[plan.SpecialityDisciplineTopicId] %>
            </td>
            <td style="padding: 7px; width:60px">
                <%= time %>
            </td>
            <td style="padding: 7px; width:60px">
                <%= room %>&nbsp;(<%= building%>)
            </td>
            <td style="padding: 7px; width:100px">
                <%= Html.ActionLink("������������", "Index", "Testing", new { alias = plan.SpecialityDisciplineTopic.Id }, new { @class = "" })%>
            </td>
        </tr>
        <% index++;
           }
           lectionPlanIds = lectionPlanIds.Trim(',', ' '); 
           %>
    </table>
    <input type="submit" style="width: 100px; height: 30px; margin-top: 15px; float: right" name="SaveLecturePlans" id="SaveLecturePlans" value="���������" />
    <input type="hidden" value="<%= lectionPlanIds %>" name="LectionPlanIds" id="LectionPlanIds" />
       
    <% Html.EndForm(); %>
    
    <%
        }
               if (null != ViewData["Detailed"])
               {
    %>
    <h2 style="margin-top: 5px; margin-bottom: 10px;">
        <%= Html.Encode(specialityDiscipline.Title) %>
    </h2>
    <table width="100%" border="1">
        <tr class="table_header">
            <th style="padding: 7px;" rowspan="2">
                �������
            </th>
            <th style="padding: 7px;" colspan="3">
                ���������� ����� � ������
            </th>
            <th style="padding: 7px;" rowspan="2">
                ����������
            </th>
        </tr>
        <tr class="table_header">
            <th style="padding: 7px;">
                ���������� �������
            </th>
            <th style="padding: 7px;">
                ������������ �������
            </th>
            <th style="padding: 7px;">
                ������������ �������
            </th>
        </tr>
        <% int index = 1;
           foreach (SpecialityDisciplineTerm specialityDisciplineTerm in (IEnumerable<SpecialityDisciplineTerm>)specialityDiscipline.SpecialityDisciplineTerms)
           {                    
        %>
        <tr class="table_row">
            <td style="padding: 7px;">
                <%= specialityDisciplineTerm.Term %>
            </td>
            <td style="padding: 7px;">
                <%= specialityDisciplineTerm.LectureVolume %>
            </td>
            <td style="padding: 7px;">
                <%= specialityDisciplineTerm.PracticeVolume %>
            </td>
            <td style="padding: 7px;">
                <%= specialityDisciplineTerm.LabVolume %>
            </td>
            <td style="padding: 7px;">
                <%= Html.Encode(specialityDisciplineTerm.Reporting) %>
            </td>
        </tr>
        <% index++;
           } %>
    </table>
    <br />
      <%= Html.ActionLink("��������� ����������", "Index", "SpecialityDisciplineProgram", new { alias = specialityDiscipline.Alias }, new { @class = "" })%>
    <%
        }
           }
       %>
          
       <%
       }
       catch (Exception ex)
       {
           Utility.RedirectToErrorPage("Cabinet.Professor: catch exception", ex);
       } %>       
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript">
        function replaceAll(txt, replace, with_this) {
            return txt.replace(new RegExp(replace, 'g'), with_this);
        }

        $(document).ready(function () {

            $(".LectureDate").change(function () {
                if ($(this).attr("value") != "����...") {
                    var topicId = $(this).attr("name").substr(11);
                    var urlPost = "/Cabinet/SetLectureDate/" + topicId + "/" + $(this).attr("value");

                    $.post(urlPost,
                           {},
                           function (response) {
                               if (response == "1") {
                                   var td = "#LectureDateTD" + topicId;
                                   var ld = "#LectureDate" + topicId;
                                   $(td).append("<div class=\"DeleteLecturePlanDiv\">" + $(ld).attr("value") + " <img class=\"DeleteLecturePlan\" title=\"�������\" src=\"/Content/Images/delete.png\" width=\"10\" height=\"10\" id=\"Cabinet_DeleteLecturePlan_" + topicId + "_" + $(ld).attr("value") + "\"/></div>");

                                   $(".DeleteLecturePlan").click(function () {
                                       var urlPost1 = "/" + replaceAll($(this).attr("id"), "_", "/");
                                       var divParent = $(this).parent("div[class=DeleteLecturePlanDiv]");
                                       $.post(urlPost1,
                                              {},
                                              function (response) {
                                                  if (response == "1") {
                                                      $(divParent).hide("slow").remove();
                                                  };
                                              });
                                   });
                               };
                           });
                }
            });

            $(".DeleteLecturePlan").click(function () {
                var urlPost = "/" + replaceAll($(this).attr("id"), "_", "/");
                var divParent = $(this).parent("div[class=DeleteLecturePlanDiv]");
                $.post(urlPost,
                       {},
                       function (response) {
                           if (response == "1") {
                               $(divParent).hide("slow").remove();
                           };
                       });
            });

        });
    </script>
</asp:Content>