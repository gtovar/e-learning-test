<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<script runat="server">
    
//получить имя студента
        string  GetStudentName(long idStudent)
    {
        string fio = "";
        foreach (VmkLearningKit.Models.Repository.User iuser in (IEnumerable<VmkLearningKit.Models.Repository.User>)ViewData["Students"])
        {
            if (iuser.Id == idStudent)
                return iuser.SecondName.ToString() + " " + iuser.FirstName.ToString();
            else continue;
        }
            return fio;
    }
    
//получить назначенный тест 
    
    IEnumerable<AssignedTestVariant>  GetAssVar(long topicId,long studentId)
    {
        string tmp ="allAssVariantsByTopic_"+topicId.ToString();
       
        if (ViewData[tmp] != null)
        {   List<AssignedTestVariant> res=new List<AssignedTestVariant>();
            foreach (AssignedTestVariant item in (IEnumerable<AssignedTestVariant>)ViewData[tmp])
                {
                    if (item.StudentId == studentId) res.Add(item);
                    else continue;
                }
            return res;
        }
        else return null;
    }
  
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	eВМК – электронный ВМК
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        var flags = new Array();
        var countRow = $("#mainStatementTable tr").length;
        //alert(countRow);
        $("#mainStatementTable tr").hide();
        $("#mainStatementTable tr:lt(12)").show();
        var currentRow = 11;

        $("td.changeble").click(function() {

            var me = $(this).attr('Id');

            flags.push(me);
            if (this.firstChild.nodeType == 3) {
                var tmp = ($("input[id^=changeInput]").val());
                var topic = (me.split("_"))[1];
                var max = $("#hiden_" + topic).val();
                if (parseInt(tmp) > parseInt(max)) {
                    alert("Неверно задан номер варианта! Максимально возможное значение :" + max);
                }
                else if (parseInt(tmp) <= 0)
                { alert("Неверно задан номер варианта! Номер варианта не может быть меньше или равно 0"); }
                else {
                    $("input[id^=changeInput]").replaceWith(tmp);
                    var newElem = $("<input type='text' size='2'/>").attr("id", "changeInput_" + me).val($(this).text());

                    $(this).empty().append(newElem);
                    $("input[id^=changeInput]").focus();
                };

            };
        });

        $("td.unactive").click(function() {
            var me = $(this).attr('Id');
            var topic = (me.split("_"))[1];
            if (confirm("По данной теме нет сгенерированных вариантов! Перейти на страницу создания тестовых вариантов?")) {
                var path = "/Testing/Index/" + topic;
                location.replace(path);
            }
        })


        $("#SetVariants").click(function() {
            var tmpArr = new Array();
            var strStudents = "";
            var strTopics = "";
            var strVariants = "";

            for (var i = 0; i < flags.length; i++) {
                var fl = flags[i];
                tmpArr = ParseTdId(fl);
                var temp;

                if (i == (flags.length - 1)) {
                    temp = $("input[id^=changeInput]").val();
                    if (parseInt(temp) <= 0) {
                        return alert("Неверно задан номер варианта! Номер варианта не может быть меньше или равно 0");
                    }

                    var topic = fl.split("_");

                    var max = $("#hiden_" + topic[1]).val();

                    if (parseInt(temp) > parseInt(max)) {
                        return alert("Неверно задан номер варианта! Максимально возможное значение: " + max);
                    };
                }
                else temp = $('#' + fl).text();

                strStudents = strStudents + tmpArr[0] + "_";
                strTopics = strTopics + tmpArr[1] + "_";
                strVariants = strVariants + temp + "_";

            }

            var _startTime = $("#startTime").val();
            var data = { "students": strStudents,
                "topics": strTopics,
                "variantNums": strVariants,
                "dateYear": $("#yearSelect").val(),
                "dateMonth": $("#monthSelect").val(),
                "dateDay": $("#daySelect").val(),
                "startTime": ($('#startTime').val()),
                "endTime": ($('#finishTime').val())
            };
            $.post("/Statement/SetVariants", data, function(str) {
                var dataTemp = str.split("[");

                for (var i = 1; i < dataTemp.length; i++) {

                    var setVariant = dataTemp[i].split("_");

                    var student = setVariant[0];
                    var topic = setVariant[1];
                    var numVar = setVariant[2];
                    if (parseInt(setVariant[3]) == -1) {
                        tmp = " ";
                        $("td[id^='" + student.toString() + "_" + topic.toString() + "'].changeble").empty().append(tmp);
                    }
                    else {
                        var Help = "/ViewTest/ViewTest/" + '<%=ViewData["DisciplineId"] %>' + '/' + setVariant[3];
                        var tmp = $('<a href=' + Help + '>' + numVar + '</a>');
                        var t = $("td[id^='" + student.toString() + "_" + topic.toString() + "'].changeble").empty().append(tmp);
                    }
                }
                alert(dataTemp[0]);

            }, "json");
            flags = new Array();
        });


        $("#Button4").click(function() {

            if (currentRow - 10 <= countRow) {

                $("#mainStatementTable tr").hide();
                var tmp = currentRow - 10;
                $("#mainStatementTable tr:gt(" + tmp + ")").show();
                $("#mainStatementTable tr:lt(" + tmp + ")").hide();
                $('#mainStatementTable tr:gt(' + currentRow + ')').hide();
                $('#mainStatementTable tr:lt(2)').show();
                currentRow += 10;
            };


        });

        $("#Button3").click(function() {

            if (currentRow > 21) {

                currentRow -= 10;
                $("#mainStatementTable tr").hide();
                var tmp = currentRow - 10;
                var tmp2 = tmp - 10;
                $("#mainStatementTable tr:lt(" + tmp2 + ")").hide();
                $("#mainStatementTable tr:gt(" + tmp2 + ")").show();
                $("#mainStatementTable tr:gt(" + tmp + ")").hide();
                $('#mainStatementTable tr:lt(2)').show();


            };
        })


    });

    //---------------------------------------
    function ParseTdId(str) {
        var arr = str.split("_");
        var studentID = parseInt(arr[0]);
        var topicID = parseInt(arr[1]);
        return arr;
    }

      //удаление начальных и конечных пробелов строки
    function _trim(str) {
        if (str == null) return "";
        var tmp = str.replace(/^\s*/g, "");
        return tmp.replace(/\s*$/g, "");
    }

    
   
</script>

<%using (Html.BeginForm("Statement", "Statement", new { additional = ViewData["DisciplineId"], alias = ViewData["ProfessorId"] }, FormMethod.Get, new { id = "groupFilter" }))%>
   <%  { %>
    
    <table >
        <tr>
           <td style="padding: 3px;">Дисциплина:&nbsp;&nbsp; </td>
           <td> <b> <%=ViewData["Discipline"]%> </b> </td>
           <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
           <td> Факультет: &nbsp;&nbsp; </td>
           <td><b><%=ViewData["Department"]%></b></td>
        </tr>
        <tr>
           <td>Преподаватель: &nbsp;&nbsp;</td>
           <td> <b><%=ViewData["ProfessorName"]%></b> </td>
           <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
           <td style="padding: 3px;">Группа: &nbsp;&nbsp;</td>
           <td><select id="param1" name="param1" onchange='SubmitPage("GroupFilter")' >
                <%foreach (VmkLearningKit.Models.Repository.Group grItem in (IEnumerable<VmkLearningKit.Models.Repository.Group>)ViewData["groups"])
                  {%>
                  <option value='<%=grItem.Alias%>' <%if(grItem.Alias==ViewData["IdGroup"]){%> selected=selected<%} %> >
                  <%=grItem.Title%>
                  </option>
                  <%} %>
           </select>
           </td>
        </tr>
    </table>
    <br/>  
<div    style=" width:1000px; height:500px;">
<table id="mainStatementTable" border="1"  width="10%" style=" width:100%; " >

        <tr id='head1' align="center"  style="background-color: Silver; color: Black; font-weight: bold;" >
			<td rowspan="2">№</td>
			<td rowspan="2">ФИО</td>
              <%int topicCount = 0;
                foreach (SpecialityDisciplineTopic topicItem in (IEnumerable<SpecialityDisciplineTopic>)ViewData["Topics"])
                {%>
            <input type="hidden" id="hiden_<%=topicItem.Id %>"  value=<%=((List<long>)ViewData["CountVariants"])[topicCount]%>  />
			<td id="<%=topicItem.Id %>" name="<%=topicItem.Title %>" colspan="6" style="font-size:x-small;"> <%=topicItem.Title %>(
                    <%=((List<long>)ViewData["CountVariants"])[topicCount]%>)
			</td>
                <% topicCount++;
                 } %>
        </tr>
        
        
        
        <tr id="head2" align="center"  style="background-color: Silver; color: Black; font-weight: bold;   font-size:xx-small;">
            <% for (int i=0;i<topicCount;i++)
                 for(int j=0;j<3;j++)
                {%>
			<td >Вар </td>    
			<td >Балл</td>
                <%} %>
        </tr>
    
            <%int studentCount = 1;
            foreach (VmkLearningKit.Models.Repository.User studentItem in (IEnumerable<VmkLearningKit.Models.Repository.User>)ViewData["Students"])
            {%>
        <tr id="student_<%=studentItem.Id%>"  style=" height:10px">
			<td><%=Html.Encode(studentCount)%></td>
			<td><%=Html.Encode(GetStudentName(studentItem.Id))%></td>
                <%int topicCounter2 = 0; %>			
              <%  foreach (SpecialityDisciplineTopic topicItem in (IEnumerable<SpecialityDisciplineTopic>)ViewData["Topics"])
                {%> 
                   <% 
                      IEnumerable<AssignedTestVariant> asTestVar = GetAssVar(topicItem.Id, studentItem.Id);
                      int i = 0;
                     foreach (AssignedTestVariant atvItem in asTestVar)
                     {
                         if (atvItem != null)
                         {
                             i++;%>
                        <%if (atvItem.State == VLKConstants.TEST_VARIANT_STATE_DONE || atvItem.State == VLKConstants.TEST_VARIANT_STATE_CHECKED)
                          {%>
			<td id="fake_<%=topicItem.Id%>_<%=i%>_var"><%=Html.ActionLink(Html.Encode(ViewData[topicItem.Id.ToString() + "_" + atvItem.GeneratedTestVariantId.ToString()]), "ViewTest", "ViewTest", new { alias = ViewData["DisciplineId"], additional = atvItem.Id }, new { @class = " " })%>
			</td>  
			<td id="fake_<%=topicItem.Id%>_<%=i%>_score"><%=Html.ActionLink(Html.Encode(atvItem.Score), "ViewTest", "ViewTest", new { alias = ViewData["DisciplineId"], additional = atvItem.Id }, new { @class = " " })%>
			</td>
                      <%;}
                             else  { %>
                                            
			                <td colspan=2><%=Html.ActionLink(Html.Encode(ViewData[topicItem.Id.ToString() + "_" + atvItem.GeneratedTestVariantId.ToString()]), "ViewTest", "ViewTest", new  { alias = ViewData["DisciplineId"], additional = atvItem.Id }, new { @class = " " })%>
			                </td>  
                             <%} %>
                        <%}%>
                         
                   <%}
                     for (int j=i+1; j <= 3; j++)
                     {%>
			<td id="<%=studentItem.Id%>_<%=topicItem.Id%>_<%=j%>" colspan="2"  
			<%if( ((List<long>)ViewData["CountVariants"])[topicCounter2]!=0 ){%>
			<%if(j==i+1) {%> class="changeble"<%;}else{%>class="secondAssignement"<% } %>
			<%;}%> 
			<% else {%>class="unactive" <%;}%>  align=center > &nbsp;
			</td>
               
                   <%} %>
                <% topicCounter2++ ;%>
               <%} %>
        </tr>
          
             <% studentCount++; 
            } %>
  
     </table>
          </div> 
    <br />
     
    <table  border="0">
        <tr>
            <td>Время начала:</td>
            <td> 
                <select id="startTime">
                    <option value="8:00" selected="selected">8:00</option>   
                    <option value="9:40">9:40</option>
                    <option value="11:20">11:20</option>
                    <option value="13:00">13:00</option>
                    <option value="14:40">14:40</option>
                    <option value="16:20">16:20</option>
                    <option value="18:00">18:00</option>
                </select>
            </td>
        </tr>
        <tr></tr>
        <tr>
            <td>Время окончания:</td>
            <td>
                <select id="finishTime">
                    <option value="9.30" selected="selected">9.30</option>   
                    <option value="11:10">11:10</option>
                    <option value="12:50">12:50</option>
                    <option value="14:30">14:30</option>
                    <option value="16:10">16:10</option>
                    <option value="17:50">17:50</option>
                    <option value="19:30">19:30</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Дата:</td>
            <td><select id="yearSelect" name="year">
                    <option value='2010' selected="selected">2010</option>
                    <option value='2011'>2011</option>
                </select></td>
            <td>
                <select id="monthSelect" name="month">
                    <option value='1' selected="selected">январь</option>
                    <option value='2'>февраль</option>
                    <option value='3'>март</option>
                    <option value='4'>апрель</option>
                    <option value='5'>май</option>
                    <option value='6'>июнь</option>
                    <option value='9'>сентябрь</option>
                    <option value='10'>октябрь</option>
                    <option value='11'>ноябрь</option>
                    <option value='12'>декабрь</option>
                </select>
            </td>    
            <td>
                <select id="daySelect" name="day">
                <%for (int i = 1; i<32; i++)
                  {%>
                <option value='<%=i%>' selected="selected"><%=i %></option>
                <%} %>
                </select>
            </td>
        </tr>
    </table >
    <p>  
    <input id="SetVariants" type="button" value="Назначить тесты" />
    </p>
    
    <input id="setRandomVariant" type="button" value="Назначить тесты автоматически" />
   
     
   <%} %> 
    <input id="Button1" type="button" value=">   " />
    <input id="Button2" type="button" value="<   " />
     <input id="Button3" type="button" value="^   " />
    <input id="Button4" type="button" value="!^   " />
 <%=Html.ActionLink("К списку дисциплин","Professor","Cabinet",new{alias=ViewData["ProfessorId"]},new{@class=""}) %>
 <%Html.EndForm();%>

</asp:Content>

