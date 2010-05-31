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
<link type="text/css" href="/Scripts/Plugins/DatePicker/jquery-ui-1.7.3.custom.css" rel="stylesheet" />	
<script type="text/javascript" src="/Scripts/Plugins/DatePicker/jquery-ui-1.7.3.custom.min.js"></script>
<script type="text/javascript" src="/Scripts/Plugins/DatePicker/ui.datepicker-ru.js"></script>
<style>

td.changeble {
 background-color:#F5f9ff;
 text-align:center;
}
td.unactive,
td.secondAssignement {
 
 text-align:center;
}

</style>
<script type="text/javascript">
    $(document).ready(function() {



        $.datepicker.setDefaults($.extend
        ($.datepicker.regional["ru"])
        );
        $('#datepicker').datepicker({
            inline: true,
            minDate: "0"
        });

        var countRow = $("#mainStatementTable tr").length;
        //alert(countRow);
        $("#mainStatementTable tr").hide();
        $("#mainStatementTable tr:lt(12)").show();
        var currentRow = 21;
        var flags = new Array();

        var flagMap = [];



       /* $("#setRandomVariant").click(function() {

            $.post("/Statement/RandomVariants", { topicId: $("#SelectTopic").val(), groupId: $("#param1").val() },
        function(str) {
            alert(str);
            var mas = str.split("]");
            for(var i=0;i<mas.length;i++)
            
        }, "json");

        });
*/

        $("input[id^='changeInput_']").blur(function() {
            var tmp = this.val();
            this.replaceWith(tmp);

        });

        $("td.unactive").click(function() {
            var me = $(this).attr('Id');
            var topic = (me.split("_"))[1];
            /*if (confirm("По данной теме нет сгенерированных вариантов! Перейти на страницу создания тестовых вариантов?")) {
            var path = "/Testing/Index/" + topic;
            location.replace(path);
            };
            */
            alert("По данной теме нет сгенерированных вариантов!");

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
                "date": $("#datepicker").val()
            };
            $.post("/Statement/SetVariants", data, function(str) {
                var dataTemp = str.split("[");
                for (var i = 1; i < dataTemp.length; i++) {
                    var setVariant = dataTemp[i].split("_");
                    var student = setVariant[0];
                    var topic = setVariant[1];
                    var numVar = setVariant[2];
                    if (setVariant[3] != -1) {
                        var Help = "/ViewTest/ViewTest/" + '<%=ViewData["DisciplineId"] %>' + '/' + setVariant[3];
                        var tmp = $('<a href=' + Help + '>' + numVar + '</a>');
                        var t = $("td[id^='" + student.toString() + "_" + topic.toString() + "'].changeble").empty().append(tmp);
                        flags = new Array();
                    }
                }
                alert(dataTemp[0]);

            }, "json");

        });

        var colFlag = 0;
        var hiddens = $("input[id^='hiden_']");
        HideCol(5, hiddens.length - 5, hiddens);


        $("#Button1").click(function() {
            if (colFlag + 5 < hiddens.length) {

                HideCol(colFlag, 5, hiddens);
                colFlag += 5;
                var showCount = 5;
                if (hiddens.length - colFlag < 5) showCount = hiddens.length - colFlag;
                ShowCol(colFlag, showCount, hiddens);

            }
        });

        $("#Button2").click(function() {
            if (colFlag - 5 >= 0) {
                var hideCount = 5;
                if (hiddens.length - colFlag < 5) hideCount = hiddens.length - colFlag;
                HideCol(colFlag, hideCount, hiddens)
                colFlag -= 5;
                ShowCol(colFlag, 5, hiddens);
            }
        });

        $("#Button4").click(function() {

            if (currentRow - 10 <= countRow) {

                $("#mainStatementTable tr").hide();
                var tmp = currentRow - 10;
                //var tmp=currentRow;
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


        $("td.changeble").click(function() {

            var me = $(this).attr('Id');
            var meArr = (me.split("_"));
            var student = meArr[0];
            var topic = meArr[1];
            var existFlag = 0;

            for (var i = 0; i < flagMap.length; i++) {
                if (parseInt(student) * 100 + parseInt(topic) == flagMap[i]) {
                    existFlag = 1;
                    break;
                };
            };


            if (existFlag == 0) {
                flags.push(me);
                flagMap.push(parseInt(student) * 100 + parseInt(topic));
            };


            if (this.firstChild.nodeType == 3) {
                var tmp = ($("input[id^=changeInput]").val());

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
    //спрятать столбцы от сolRow 5 штук
    function HideCol(currentColRow, count, hiddens) {
        var topicItem;
        var topicId;
        var str = "";
        for (var i = currentColRow; i < currentColRow + count; i++) {
            topicItem = hiddens[i];
            topicId = topicItem.id.split("_")[1];
            str = "td[id *= _" + topicId + "_]";
            $(str).hide();
            $("td #" + topicId).hide();
        };
    }

    //показать столбцы от сolRow 5 штук
    function ShowCol(currentColRow, count, hiddens) {
        var topicItem;
        var topicId;
        var str = "";
        for (var i = currentColRow; i < currentColRow + count; i++) {
            topicItem = hiddens[i];
            topicId = topicItem.id.split("_")[1];
            str = "td[id *= _" + topicId + "_]";
            $("td #" + topicId).show();
            $(str).show();
        };
    }
</script>




<%using (Html.BeginForm("Statement", "Statement", new { additional = ViewData["DisciplineId"], alias = ViewData["ProfessorId"] }, FormMethod.Get, new { id = "groupFilter" }))%>
   <%  { %>
  
    <table  >
        <tr>
           <td style="padding: 3px;">Дисциплина:&nbsp;&nbsp; </td>
           <td> <b> <%=ViewData["Discipline"]%> </b> </td>
           <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
           <td> Факультет: &nbsp;&nbsp; </td>
           <td><b><%=ViewData["Department"]%></b></td>
        </tr>
        <tr>
           <td >Преподаватель: &nbsp;&nbsp;</td>
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
    
<div style="width:20px; height:450px; background:f7f7f7; float:left;">
<table>
<tr  style="height:50px">
</tr>
    <tr>
        <td ><img id="Button3" alt="" src="/Content/Images/up.png" height=20px width=20px  />
        </td>
    </tr>

    <tr>
        <td><img id="Button4" alt="" src="/Content/Images/down.png" height=20px width=20px  /></td>
    </tr>
</table>
   </div> 
<div>
<table id="mainStatementTable" border="1" >
 <!--style=" width:90%;" >-->
<thead >
        <tr id='head1' align="center" style="background-color: Silver; color: Black; font-weight: bold;" >
			<th rowspan="2" style="width:30px">№</th>
			<th rowspan="2" style=" width:150px;">ФИО</th>
              <%int topicCount = 0;
                foreach (SpecialityDisciplineTopic topicItem in (IEnumerable<SpecialityDisciplineTopic>)ViewData["Topics"])
                {%>
            <input type="hidden" id="hiden_<%=topicItem.Id %>"  value=<%=((List<long>)ViewData["CountVariants"])[topicCount]%>  />
			<th id="<%=topicItem.Id %>" name="<%=topicItem.Title %>" colspan="6" style="font-size:x-small; width:180px"> <%=topicItem.Title %> (
                    <%=((List<long>)ViewData["CountVariants"])[topicCount]%>)
			</th>
                <% topicCount++;
                 } %>
        </tr>
        
        
        
        <tr id="head2" align="center"  style="background-color: Silver; color: Black; font-size:xx-small;">
            <% for (int i=0;i<topicCount;i++)
                 for(int j=0;j<3;j++)
                {%>
			<td id="var_<%=((IEnumerable<SpecialityDisciplineTopic>)ViewData["topics"]).ElementAt(i).Id%>_<%=j%>" style=" width:30px">Вар </td>    
			<td id="ball_<%=((IEnumerable<SpecialityDisciplineTopic>)ViewData["topics"]).ElementAt(i).Id%>_<%=j%>" style=" width:30px">Балл</td>
                <%}%>
        </tr>
 <tbody style="height:240px; text-align: center"> 
            <%int studentCount = 1;
            foreach (VmkLearningKit.Models.Repository.User studentItem in (IEnumerable<VmkLearningKit.Models.Repository.User>)ViewData["Students"])
            {%>
        <tr id="student_<%=studentItem.Id%>"  style=" height:20px;">
			<td  style=" background-color:#ffffff;"><%=Html.Encode(studentCount)%></td>
			<td style=" background-color:#ffffff; text-align:justify"><%=Html.Encode(GetStudentName(studentItem.Id))%></td>
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
                                            
			                <td style=" width:60px;" id="fake_<%=topicItem.Id%>_<%=i%>_var" colspan=2><%=Html.ActionLink(Html.Encode(ViewData[topicItem.Id.ToString() + "_" + atvItem.GeneratedTestVariantId.ToString()]), "ViewTest", "ViewTest", new  { alias = ViewData["DisciplineId"], additional = atvItem.Id }, new { @class = " " })%>
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
			<% else {%>class="unactive" <%;}%>  > &nbsp;
			</td>
               
                   <%} %>
                <% topicCounter2++ ;%>
               <%} %>
        </tr>
          
             <% studentCount++; 
            } %>
  </tbody>  
     </table>
 </div> 
 <div>
 <table width=90%>
    <tr>
    <td  style="width:850px"></td>
        <td   style=" text-align:right">
        <img id="Button2" alt="" src="/Content/Images/left.png" height=20px width=20px  />
        </td>
        <td style=" width:10px">    </td>
        <td >
        <img id="Button1" alt="" src="/Content/Images/right.png" height=20px width=20px  />
        </td>
        <td>
        </td>
    </tr>
 </table> 
 </div> 
       
    <br />
     
    
   <div>
   <input id="setRandomVariant" type="button" value="Расставить варианты автоматически" />
   </div>
    
   <div style="float:left;">
   <table>
        <tr style="height:40px">
            <td>Дата прохождения:
            </td>
            <td><input id="datepicker" type="text" style="width:100px">
            </td>
        </tr>
        <tr> <td></td>
        </tr>
        <tr><td><input id="SetVariants" type="button" value="Назначить тесты"   style="height:25px;"/></td>
        </tr>
   </table>
   </div>
     
   <%} %> 
    <div style="float:right">
    
 <%=Html.ActionLink("К списку дисциплин","Professor","Cabinet",new{alias=ViewData["ProfessorId"]},new{@class=""}) %>
 <p></p>
 </div>        
 <!---
  <select id="SelectTopic" >
 <%//int tCount=0;
     //foreach (SpecialityDisciplineTopic topicItem in (IEnumerable<SpecialityDisciplineTopic>)ViewData["Topics"])%>
 <%//{  %>
    <option value=<%//=topicItem.Id%> <%//if(((List<long>)ViewData["CountVariants"])[tCount++]==0){%>disabled <%//}%>><%//=topicItem.Title%>
    </option>
 <%//}; %>
    </select>
 -->
 
 <%Html.EndForm();%>

</asp:Content>

