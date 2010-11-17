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
<script src="/Scripts/Plugins/DatePicker/jquery-1.4.2.min.js" type="text/javascript"></script>
<link href="/Scripts/Plugins/DatePicker/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />
<script src="/Scripts/Plugins/DatePicker/jquery-ui-1.8.4.custom.min.js" type="text/javascript"></script>
<script src="/Scripts/Plugins/DatePicker/ui.datepicker-ru.js" type="text/javascript"></script>
<script src="/Scripts/Plugins/DatePicker/jquery-ui-timepicker-addon-0.5.min.js" type="text/javascript"></script>

<script type="text/javascript" src="/Scripts/Plugins/FancyBox/scripts/jquery.fancybox-1.3.1.js"></script>
<link rel="stylesheet" type="text/css" href="/Scripts/Plugins/FancyBox/style/jquery.fancybox-1.3.1.css" media="screen" />
<style type="text/css">

td.changeble {
 background-color:#F5f9ff;
 text-align:center;
}
td.newAssignement
{
    background-color:#90ee90;
    border-width:2px;
    text-align:center;   
}

td.unactive,
td.secondAssignement {
 
 text-align:center;
}

.mark 
{
	color :red !important;
}
.appointment
{
    background-color:#eeeeee;	
    float:left;
    padding:5px;
    margin:3px;
    height:195px;
}

.marking
{
	background-color:#f3f3f3;
	float:left;
	padding:5px;
	margin:3px;
	height:195px;
}

.markingRules
{
	margin:5px;
}

.markingRules td
{
	padding:3px;
}
.markingRules thead td
{
	color:Red;
	text-align:center;
}
#ui-timepicker-div dl{ text-align: left; }
#ui-timepicker-div dl dt{ height: 25px; }
#ui-timepicker-div dl dd{ margin: -25px 0 10px 65px; }
</style>
<script type="text/javascript">

    $(document).ready(function () {

        /////////////////////////////////////////////////////////////////////////////////////////////////////
        $('.iframe').fancybox(
        {
            "scrolling": "yes",
            "autoScale": false
        });

        $('#5MarkRule').change(function () { Set4Rule(); }).change();
        $('#4MarkRule').change(function () { Set3Rule(); }).change();

        $('#SetMarks').fancybox(
        {
            "scrolling": "no",
            "autoScale": false
        });

        $(".left_col").append('<img id="additional_menu_fake" alt="Дополнительное меню" src="/Content/Images/hide_menu_icon.gif" style="display:none; cursor: pointer;" />');
        setTimeout('$(".additional_menu").hide("slow");$("#additional_menu_fake").show("normal");', 1000);
        $("#additional_menu_fake").click(function () {
            $('.additional_menu').show("fast");
            $("#additional_menu_fake").hide("fast");
        });


        $('.left_col').hover(
	      function () {
	          // $('.additional_menu').show("fast");
	          // $("#additional_menu_fake").hide("fast");
	      },
	      function () {
	          $('.additional_menu').hide("normal");
	          $("#additional_menu_fake").show("normal");
	      }
	    );



        /////////////////////////////////////////////////////////////////////////////////////////////////////


        $.datepicker.setDefaults($.extend
        ($.datepicker.regional["ru"])
        );
        $('#datepicker').datetimepicker({
            inline: true,
            minDate: "0",
            gotoCurrent: true,
            showButtonPanel: false,
            hour: 8,
            minute: 0

        });


        $.datepicker.setDefaults($.extend
        ($.datepicker.regional["ru"])
        );
        $('#datepicker2').datetimepicker({
            inline: true,
            minDate: "0",
            gotoCurrent: true,
            showButtonPanel: false,
            hour: 8,
            minute: 0

        });

        var countRow = $("#mainStatementTable tr").length;
        //alert(countRow);
        $("#mainStatementTable tr").hide();
        $("#mainStatementTable tr:lt(12)").show();
        $('#mainStatementTable tr:last').show();
        var currentRow = 21;
        var flags = new Array();
        var flagExistInputChange = 0;


        $("#clear").click(function () {
            $("td.changeble").empty().append(" ");
            flags = [];

        })

        $("#setRandomVariant").click(function () {

            if ($("#SelectTopic").val() != -1) {
                $.post("/Statement/RandomVariants", { topicId: $("#SelectTopic").val(), groupId: $("#Select1").val() },
        function (str) {
            flags = [];
            var mas = str.split("]");
            var tmp;
            var td;
            for (var i = 0; i < mas.length - 1; i++) {
                tmp = mas[i].split("_");
                td = $("td[id^=" + tmp[0] + "_" + tmp[1] + "_" + "].changeble");
                td.empty().append(tmp[2]);
                flags.push($("td[id^=" + tmp[0] + "_" + tmp[1] + "_" + "].changeble").attr('id'));

            }
            flagExistInputChange = 0;
            alert('Для назначения тестов нажмите "Назначить тесты"');

        }, "json");
            }
        });




        $("td.unactive").click(function () {
            var me = $(this).attr('Id');
            var topic = (me.split("_"))[1];
            /*if (confirm("По данной теме нет сгенерированных вариантов! Перейти на страницу создания тестовых вариантов?")) {
            var path = "/Testing/Index/" + topic;
            location.replace(path);
            };
            */
            alert("По данной теме нет сгенерированных вариантов!");

        })



        $("#SetVariants").click(function () {
            if (flagExistInputChange == 1) {
                var InputChange = $("input[id^=changeInput]");
                var tmp = (InputChange.val());

                var max = $("#hiden_" + (InputChange.attr("Id")).split("_")[2]).val();
                if (parseInt(tmp) > parseInt(max)) {
                    return alert("Неверно задан номер варианта! Максимально возможное значение :" + max);
                }
                else if (parseInt(tmp) <= 0)
                { return alert("Неверно задан номер варианта! Номер варианта не может быть меньше или равно 0"); }
                else {
                    $("input[id^=changeInput]").replaceWith(tmp);
                }
            }

            var tmpArr = new Array();
            var strStudents = "";
            var strTopics = "";
            var strVariants = "";

            for (var i = 0; i < flags.length; i++) {
                var fl = flags[i];
                tmpArr = ParseTdId(fl);
                var temp;

                temp = $('#' + fl).text();
                strStudents = strStudents + tmpArr[0] + "_";
                strTopics = strTopics + tmpArr[1] + "_";
                strVariants = strVariants + temp + "_";
            }

            var _startTime = $("#startTime").val();
            var data = { "students": strStudents,
                "topics": strTopics,
                "variantNums": strVariants,
                "date": $("#datepicker").val().toString(),
                "endDate": $("#datepicker2").val().toString()
            };
            $.post("/Statement/SetVariants", data, function (str) {
                var dataTemp = str.split("[");
                for (var i = 1; i < dataTemp.length; i++) {
                    var setVariant = dataTemp[i].split("_");
                    var student = setVariant[0];
                    var topic = setVariant[1];
                    var numVar = setVariant[2];
                    if (setVariant[3] != -1) {
                        var Help = '<%=ConfigurationManager.AppSettings["webPlayerUrl"].ToString() %>' + "/Start.aspx?mode=grading&key=" + setVariant[3];
                        // "/ViewTest/ViewTest/" + '<%//=ViewData["DisciplineId"] %>' + '/' + setVariant[3];
                        var tmp = $('<a href=' + Help + 'target="_blank" >' + numVar + '</a>');
                        var t = $("td[id^='" + student.toString() + "_" + topic.toString() + "'].changeble").empty().append(tmp);
                        t.attr('class', 'newAssignement');
                        flags = new Array();
                    }
                    flagExistInputChange = 0;

                }
                alert(dataTemp[0]);

            }, "json");

        });

        var colFlag = 0;
        var hiddens = $("input[id^='hiden_']");
//число отображаемых тем на странице
        var countShowTopics = 4;
        HideCol(countShowTopics, hiddens.length - countShowTopics, hiddens);

//скролл вправо
        $("#ButtonRight").click(function () {
            if (colFlag + countShowTopics < hiddens.length) {

                HideCol(colFlag, countShowTopics, hiddens);
                colFlag += countShowTopics;
                var showCount = countShowTopics;
                if (hiddens.length - colFlag < countShowTopics) showCount = hiddens.length - colFlag;
                ShowCol(colFlag, showCount, hiddens);

            }
        });

//скролл влево
        $("#ButtonLeft").click(function () {
            if (colFlag - countShowTopics >= 0) {
                var hideCount = countShowTopics;
                if (hiddens.length - colFlag < countShowTopics) hideCount = hiddens.length - colFlag;
                HideCol(colFlag, hideCount, hiddens)
                colFlag -= countShowTopics;
                ShowCol(colFlag, countShowTopics, hiddens);
            }
        });

        $("#Button4").click(function () {

            if (currentRow - 10 <= countRow) {

                $("#mainStatementTable tr").hide();
                var tmp = currentRow - 10;
                //var tmp=currentRow;
                $("#mainStatementTable tr:gt(" + tmp + ")").show();
                $("#mainStatementTable tr:lt(" + tmp + ")").hide();
                $('#mainStatementTable tr:gt(' + currentRow + ')').hide();
                $('#mainStatementTable tr:lt(3)').show();
                $('#mainStatementTable tr:last').show();
                currentRow += 10;
            };


        });

        $("#Button3").click(function () {

            if (currentRow > 21) {

                currentRow -= 10;
                $("#mainStatementTable tr").hide();
                var tmp = currentRow - 10;
                var tmp2 = tmp - 10;
                $("#mainStatementTable tr:lt(" + tmp2 + ")").hide();
                $("#mainStatementTable tr:gt(" + tmp2 + ")").show();
                $("#mainStatementTable tr:gt(" + tmp + ")").hide();
                $('#mainStatementTable tr:lt(3)').show();
                $('#mainStatementTable tr:last').show();


            };
        })


        $("td.changeble").click(function () {
            flagExistInputChange = 1;
            var me = $(this).attr('Id');
            var meArr = (me.split("_"));
            var student = meArr[0];
            var topic = meArr[1];
            var existFlag = 0;

            for (var i = 0; i < flags.length; i++) {
                if ((flags[i].split("_")[0] == student) && (flags[i].split("_")[1] == topic)) {
                    existFlag = 1;
                    break;
                };
            };


            if (existFlag == 0) {
                flags.push(me);

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

    //////////////////////////////////////////////////////////////////////////////////////
    ///////// Выставление оценок /////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////

    (function($){
	  // очищаем select
	  $.fn.clearSelect = function() {
	    return this.each(function(){
	      if(this.tagName=='SELECT') {
	        this.options.length = 0;
	        $(this).attr('disabled','disabled');
	      }
	    });
	  }
	  // заполняем select
	  $.fn.fillSelect = function(dataArray) {
	    var oldVal = $(this).find("option:selected").val();
	    
	    return this.clearSelect().each(function(){
	      if(this.tagName=='SELECT') {
            var currentSelect = this;
	        $.each(dataArray,function(index,data){
              if(oldVal!=data.value){
	            var option = new Option(data.text,data.value);
              } else {
                    var option = new Option(data.text,data.value,true, true);
              }
	          if($.support.cssFloat) {
	            currentSelect.add(option,null);
	          } else {
	            currentSelect.add(option);
	          }
	        });
	      }
	    });
	  }
	})(jQuery);


// выбор четверки 
function Set4Rule(){
    var Value5 =parseInt( $('#5MarkRule').val());
    var tmpSelect = $('#4MarkRule');
    if (Value5.length == 0) {
	    tmpSelect.attr('disabled','disabled');
	    tmpSelect.clearSelect();
	    Set3Rule(); // adjustModel(); 
	} else {
	    var data = [{ "text": "100%", "value": "100" },
             { "text": "90%", "value": "90" },
             { "text": "80%", "value": "80" },
             { "text": "70%", "value": "70" },
             { "text": "60%", "value": "60" },
             { "text": "50%", "value": "50" },
             { "text": "40%", "value": "40" },
             { "text": "30%", "value": "30" },
             { "text": "20%", "value": "20" },
             { "text": "10%", "value": "10" },
             { "text": "0%", "value": "0"}];
        var newData= new Array();
        $.each(data, function (i, val) {
            if (parseInt(val.value) <= Value5) {
                newData.push(val);
            }
        });
        tmpSelect.fillSelect(newData).attr('disabled','');
        Set3Rule(); //adjustModel();
	    
	}
};
// выбор тройки
function Set3Rule() {
    var Value4 = parseInt($('#4MarkRule').val());
    var tmpSelect = $('#3MarkRule');
    if (Value4.length == 0) {
        tmpSelect.attr('disabled', 'disabled');
        tmpSelect.clearSelect();
       // Set3Rule(); // adjustModel(); 
    } else {
        var data = [{ "text": "100%", "value": "100" },
             { "text": "90%", "value": "90" },
             { "text": "80%", "value": "80" },
             { "text": "70%", "value": "70" },
             { "text": "60%", "value": "60" },
             { "text": "50%", "value": "50" },
             { "text": "40%", "value": "40" },
             { "text": "30%", "value": "30" },
             { "text": "20%", "value": "20" },
             { "text": "10%", "value": "10" },
             { "text": "0%", "value": "0"}];
        var newData = new Array();
        $.each(data, function (i, val) {
            if (parseInt(val.value) <= Value4) {
                newData.push(val);
            }
        });
        tmpSelect.fillSelect(newData).attr('disabled', '');
       // Set3Rule(); //adjustModel();

    }

};

function setMarks() {
    $("#marksInfo").html("");
    var topicItemId = $("#SelectMarkTopic option:selected").val();
    if (topicItemId == "-1") {
        $("#marksInfo").append("<h3>Тема не выбрана.</h3>");
       // $.fn.fancybox.close();
        return false;
    } else {
        var tmpContent;
        tmpContent= "<h3>Оценки по теме<br/> \"" + $("#SelectMarkTopic option:selected").html() + "\" </h3>";
        tmpContent += '<div style="width:360px; height:240px; border:1px groove; margin:10px; overflow:scroll;">';
            tmpContent += '<table width="100%" border="1px" id="tmpMarksTable"><thead><tr><th>ФИО</th><th>Оценка</th>  </tr></thead><tbody>';
            // Поиск всех непровереных тестов по данной теме и выставление оценок
            var tests = $("[id^='fake_" + topicItemId + "']").filter("[id$=score]");
            var name;
            //var studentId;
            var testId;
            var score;
            var maxScore;
            var persent;
            var mark;
            var marksStat = [ 0, 0, 0, 0 ]

            tests.each(function () {
                name = $(this).parent().find(".studentName").html();
                testId = $(this).attr('class');
                //studentId = $(this).parent().attr('id');
                // studentId = studentId.replace(/student_/, "");
                score = $(this).find("a").html();
                maxScore = $(this).find("h5").html();
                maxScore = maxScore.replace(/\(/, "");
                maxScore = maxScore.replace(/\)/, "");
                persent = 100 * score / maxScore;
                if (persent >= $('#5MarkRule').val()) {
                    mark = 5;
                    marksStat[0]++;
                } else {
                    if (persent >= $('#4MarkRule').val()) {
                        mark = 4;
                        marksStat[1]++;
                    } else {
                        if (persent >= $('#3MarkRule').val()) {
                            mark = 3;
                            marksStat[2]++;
                        } else {
                            mark = 2;
                            marksStat[3]++;
                        }
                    }
                }
                tmpContent += '<tr> <td>' + name + '</td><td><input name="' + testId + '" class="newMark"  type="text" size="6" value="' + mark + '"></td></tr>';
            });
            tmpContent += '</tbody></table> ';

            tmpContent += '</div>';
            var numMark = marksStat[0] + marksStat[1] + marksStat[2] + marksStat[3];
            tmpContent += 'Статистика:<br/> "Отлично": &#09;' + marksStat[0] + '(' + Math.round(100 * marksStat[0] / numMark) + '%)<br/>"Хорошо": &#09;' + marksStat[1] + '(' + Math.round(100 * marksStat[1] / numMark) + '%)<br/>"Удовл.": &#09;' + marksStat[2] + '(' + Math.round(100 * marksStat[2] / numMark) + '%)<br/>"Плохо": &#09;' + marksStat[3] + '(' + Math.round(100 * marksStat[3] / numMark) + '%)<br/><br/>';
        tmpContent += '<input  type="button" value="Сохранить" onclick="saveMarks(); return false;"  style=""/> <input  type="button" value="Закрыть" onclick=" closeBox(); return false;"  style=""/>';
        $("#marksInfo").append(tmpContent);
        return false;
    }
};



function saveMarks() {
    //alert("Почти сохранено))");
    //var tmp = $('#tmpMarksTable');
    //alert(tmp.html());
    var res;
    $('#tmpMarksTable .newMark').each(function () {
        var obj = this;
        // var mark = this.value;
        //var id = this.getAttribute('name');
        var data = { "alias": this.getAttribute('name'), "mark": this.value };
        $.post("/ViewTest/SetMark", data, function (str) { $(obj).parent().html(str); }, "json");
        
    });
    // После изменения- перезагружаем страницу ( кроме FireFox'а- там глючит)
    if (navigator.userAgent.toLowerCase().indexOf("gecko") == -1) {
        setTimeout(myReload, 3000);
    }
    //window.location.reload();
    //setTimeout('$.fancybox.close()', 2000);
    
};

function myReload() {
    window.location.reload();
}


function closeBox() {
    $.fancybox.close();
    // страница перезагружается только в FireFox
    if (navigator.userAgent.toLowerCase().indexOf("gecko") != -1) {
        window.location.reload();
    }
};




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

 
 <%//если в базе данных нет групп, обучающихся у преполавателя по данной дисциплине
      if (null == ViewData["groups"])
       {%>
           </tr>
        </table>
       
        <div style=" color:Red;"> <p><b>Нет групп обучающихся по данной дисциплине</b>
        </p></div>
        
    <%;} %>
    

    <%//если нет в базе данных студентов в группы
      if (null != ViewData["groups"] && null == ViewData["students"])
      {%>
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
    
    
   
    <div style=" color:Red;"> <p><b>В базе данных нет информации о студентах данной группы</b>
    </p></div>
    
    <%}  %>
    <%   //если нет тем по данной дисциплине 
    else if (null != ViewData["groups"] && null == ViewData["topics"])
         {%>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
           <td style="padding: 3px;">Группа: &nbsp;&nbsp;</td>
           <td><select id="Select2" name="param1" onchange='SubmitPage("GroupFilter")' >
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
    
    <div style=" color:Red;"><p><b>Нет тем по данной дисциплине</b>
    </p></div>
    
            <%}%>


<%//в случае если есть все данные
      if(null!=ViewData["groups"] && null != ViewData["students"] && null != ViewData["topics"]) {%>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
           <td style="padding: 3px;">Группа: &nbsp;&nbsp;</td>
           <td><select id="Select1" name="param1" onchange='SubmitPage("GroupFilter")' >
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

<table id="mainStatementTable"  border="1px" style="border-color:  Black; padding: 0px 0px 0px 0px; border-width: 0px 0px 0px 0px;">
 <!--style=" width:90%;" >-->
<thead >
        <tr id='head1' align="center" style=" color: Black; font-weight: bold; " >
			<th rowspan="2" style="width:30px; background-color:White; border-width:0px;"> </th>
            <th rowspan="2" style="width:30px; background-color: Silver;border-width:1px;">№</th>
			<th rowspan="2" style=" width:150px; background-color: Silver;border-width:1px;">ФИО</th>
              <%int topicCount = 0;
                foreach (SpecialityDisciplineTopic topicItem in (IEnumerable<SpecialityDisciplineTopic>)ViewData["Topics"])
                {%>
            <input type="hidden" id="hiden_<%=topicItem.Id %>"  value=<%=((List<long>)ViewData["CountVariants"])[topicCount]%>  />
			<th id="<%=topicItem.Id %>" name="<%=topicItem.Title %>" colspan="6" style="font-size:x-small; width:180px;background-color: Silver;"> <%=topicItem.Title%> (
                    <%=((List<long>)ViewData["CountVariants"])[topicCount]%>)
			</th>
                <% topicCount++;
                } %>
        </tr>
        
        
        
        <tr id="head2" align="center"  style="background-color: Silver; color: Black; font-size:xx-small;">
            <% for (int i = 0; i < topicCount; i++)
                   for (int j = 0; j < 3; j++)
                   {%>
			<td id="var_<%=((IEnumerable<SpecialityDisciplineTopic>)ViewData["topics"]).ElementAt(i).Id%>_<%=j%>" style=" width:30px">Вар </td>    
			<td id="ball_<%=((IEnumerable<SpecialityDisciplineTopic>)ViewData["topics"]).ElementAt(i).Id%>_<%=j%>" style=" width:30px">Балл</td>
                <%}%>
        </tr>
 </thead >       

 <tbody style=" text-align: center"> 
           <tr >
                <td rowspan="<%=((IEnumerable<VmkLearningKit.Models.Repository.User>)ViewData["Students"]).Count()+1%>" style=" border-width:0px; vertical-align:top;">
                    <img id="Button3" alt="" src="/Content/Images/up.png" height="20px" width="20px"  />
                    <br />
                    <img id="Button4" alt="" src="/Content/Images/down.png" height="20px" width="20px"  />
                </td>
            </tr>
            <%int studentCount = 1;
              foreach (VmkLearningKit.Models.Repository.User studentItem in (IEnumerable<VmkLearningKit.Models.Repository.User>)ViewData["Students"])
              {%>
                    <tr id="student_<%=studentItem.Id%>"  style=" height:20px;">
			
            
                    <td  style=" background-color:#ffffff;"><%=Html.Encode(studentCount)%></td>
			        <td class="studentName" style=" background-color:#ffffff; text-align:justify"><%=Html.Encode(GetStudentName(studentItem.Id))%></td>
                    <%int topicCounter2 = 0; %>			
                     <%foreach (SpecialityDisciplineTopic topicItem in (IEnumerable<SpecialityDisciplineTopic>)ViewData["Topics"])
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
			     <!---вывод номера варианта-->
                                        <td id="fake_<%=topicItem.Id%>_<%=i%>_var">
                                        <!--
                                        <a href="<%//=ConfigurationManager.AppSettings["webPlayerUrl"].ToString() + "/Start.aspx?mode=grading&key="+atvItem.ProfessorKey.ToString()%>" target="_blank">
                                        <%//=Html.Encode(ViewData[topicItem.Id.ToString() + "hasLocalNumber_" + atvItem.GeneratedTestVariantId.ToString()]) %>
                                        </a>
                                        -->
                                        <%=Html.ActionLink(Html.Encode(ViewData[topicItem.Id.ToString() + "hasLocalNumber_" + atvItem.GeneratedTestVariantId.ToString()] ), "ViewTest", "ViewTest", new { alias = ViewData["DisciplineId"], additional = atvItem.Id }, new { @class = "iframe " })%>
			                            </td>  

                                        <%if (atvItem.Mark!=0)
                                                {%>

			                                        <td id="fake_<%=topicItem.Id%>_<%=i%>_mark" class="<%=atvItem.Id%>">
                                                    <a href="<%="/ViewTest/ViewTest/"+ ViewData["DisciplineId"].ToString()+"/"+atvItem.Id.ToString() %>" style="color:red;" class="iframe"> 
                                                    <%=Html.Encode(atvItem.Mark)%>
                                                    </a>
                                                    <%//=Html.ActionLink(Html.Encode(atvItem.Mark), "ViewTest", "ViewTest", new { alias = ViewData["DisciplineId"], additional = atvItem.Id }, new { @class = "iframe" })%>
                                                        <br /><h6>(оценка)</h6>
                                                    </td>
                                            <%;
                                                }
                                                else
                                                { %>
                 <!--вывод количества полученных баллов-->
                                                    <td id="fake_<%=topicItem.Id%>_<%=i%>_score" class="<%=atvItem.Id%>">
                                                    <!--
                                                    <a href="<%//=ConfigurationManager.AppSettings["webPlayerUrl"].ToString() + "/Start.aspx?mode=grading&key="+atvItem.ProfessorKey.ToString()%>" target="_blank">
                                                    <%//=Html.Encode(atvItem.Score) %>
                                                    </a>
                                                    -->
                                                    <%=Html.ActionLink(Html.Encode(atvItem.Score), "ViewTest", "ViewTest", new { alias = ViewData["DisciplineId"], additional = atvItem.Id }, new { @class = "iframe" })%>
                                                    <br /><h5> (<%=ViewData["maxScoreVariant_"+atvItem.GeneratedTestVariantId.ToString()]%>)</h5>
                                                   
			                                        </td>
                                                <%} %>
                                        <%;
                                    }
                                    else
                                    { %>
                                            
			                            <td style=" width:60px;" id="fake_<%=topicItem.Id%>_<%=i%>_var" colspan=2>
                                        <!--
                                        <a href="<%//=ConfigurationManager.AppSettings["webPlayerUrl"].ToString() + "/Start.aspx?mode=grading&key="+atvItem.ProfessorKey.ToString()%>" target="_blank">
                                                    <%//=Html.Encode(ViewData[topicItem.Id.ToString() + "hasLocalNumber_"+ atvItem.GeneratedTestVariantId.ToString()]) %> 
                                        </a>
                                        -->

                                        <%=Html.ActionLink(Html.Encode(ViewData[topicItem.Id.ToString() + "hasLocalNumber_" + atvItem.GeneratedTestVariantId.ToString()]), "ViewTest", "ViewTest", new { alias = ViewData["DisciplineId"], additional = atvItem.Id }, new { @class = "iframe " })%>
			                            </td>  
                                    <%} %>
                                <%}%>
                         
                            <%}
                            for (int j = i + 1; j <= 3; j++)
                            {%>
			                        <td id="<%=studentItem.Id%>_<%=topicItem.Id%>_<%=j%>" colspan="2"  
			                        <%if( ((List<long>)ViewData["CountVariants"])[topicCounter2]!=0 ){%>
			                        <%if(j==i+1) {%> class="changeble"<%;}else{%>class="secondAssignement"<% } %>
			                        <%;}%> 
			                        <% else {%>class="unactive" <%;}%>  > &nbsp;
			                        </td>
               
                            <%} %>
                            <% topicCounter2++;%>
                    <%} %>
                    </tr>
          
                    <% studentCount++;
              } %>

         <tr> 
            <td colspan="<%= ((IEnumerable<SpecialityDisciplineTopic>)ViewData["Topics"]).Count()*3+2 %>" style=" border-width:0px;padding-top: 5px; text-align:right;">
            <img id="ButtonLeft" alt="" src="/Content/Images/left.png" height="20px" width="20px"  />&nbsp;<img id="ButtonRight" alt="" src="/Content/Images/right.png" height="20px" width="20px"  />
            </td>
         </tr>
  </tbody>  
     </table>
  
 
       
   <div class="appointment"  >
       <h3>Назначение тестов</h3>
       <div>
           <select id="SelectTopic"  style=" width:300px; margin:3px;">
           <option disabled selected="selected" value="-1">выберите тему...
           </option>
         <%int tCount = 0;
           foreach (SpecialityDisciplineTopic topicItem in (IEnumerable<SpecialityDisciplineTopic>)ViewData["Topics"])%>
         <%{  %>
            <option value="<%=topicItem.Id%>" <%if(((List<long>)ViewData["CountVariants"])[tCount++]==0){%>disabled <%}%>><%=topicItem.Title%>
            </option>
         <%}; %>
            </select>
            <br/>
           <input id="setRandomVariant" type="button" value="Расставить варианты автоматически"  style="width:230px;"/>
           <input id="clear" type="button" value="Очистить"  style="width:70px;"/>
           <h6> *Вы так же можете назначить варианты вручную определенным студентам</h6>
       </div>
    
       <div style="float:left;">
       <table>
            <tr style="height:40px">
                <td>Время начала:
                </td>
                <td><input id="datepicker" type="text" /></td>
           
            </tr>
            <tr style="height:40px">
                <td>Время окончания:
                </td>
                <td><input id="datepicker2" type="text" /></td>
          
            </tr>
            <tr> <td></td>
            </tr>
            <tr><td><input id="SetVariants" type="button" value="Назначить тесты"   style="height:25px;"/></td>
            </tr>
       </table>
       </div>
    </div>
    <div class="marking">
        <h3>Выставление оценок</h3>
        <select id="SelectMarkTopic"  style=" width:300px; margin:3px;">
           <option disabled selected="selected" value="-1">выберите тему...
           </option>
         <% tCount = 0;
           foreach (SpecialityDisciplineTopic topicItem in (IEnumerable<SpecialityDisciplineTopic>)ViewData["Topics"])
           {  %>
            <option value="<%=topicItem.Id%>" <%if(((List<long>)ViewData["CountVariants"])[tCount++]==0){%> disabled <%}%>><%=topicItem.Title%>
            </option>
         <%}; %>
            </select>
            <br/>
            <div class="markingRules">
                <h5>Критерии оценок:</h5>
                <table border="1px">
                    <thead>
                        <tr>
                            <td> "5" </td>
                            <td> "4" </td>
                            <td> "3" </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <select id="5MarkRule" class="markRule">
                                    <option value="100">100% </option>
                                    <option selected="selected" value="90">90% </option>
                                    <option value="80">80% </option>
                                    <option value="70">70% </option>
                                    <option value="60">60% </option>
                                    <option value="50">50% </option>
                                    <option value="40">40% </option>
                                    <option value="30">30% </option>
                                    <option value="20">20% </option>
                                    <option value="10">10% </option>
                                    <option value="0">0% </option>
                                </select>
                            </td>
                            <td>
                            <select id="4MarkRule" class="markRule">
                                    
                                    <option selected="selected" value="60">60% </option>
                                    
                                </select>
                            </td>
                            <td>
                                <select id="3MarkRule" class="markRule">
                                    
                                    <option selected="selected" value="30">30% </option>
                                    
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
           <a id="SetMarks" href="#marksInfo"><input  type="button" value="Расставить оценки автоматически" onclick="setMarks();"  style=""/></a>
           <h6> *Вы можете выставить оценки студентам вручную кликнув<br /> на соответствующем поле</h6>
           <div style="display:none;">
		         <div id="marksInfo" style=" height:450px; width:400px;">
                </div>
	       </div>

    </div>
    
   <%}; %>
    <p> 
    <div style="float:right">
    <%=Html.ActionLink("К списку дисциплин", "Professor", "Cabinet", new { alias = ViewData["ProfessorId"] }, new { @class = "" })%>
     <br />
    <%//=Html.ActionLink("К сводной ведомости", "FinalStatement", "FinalStatement", new { alias = ViewData["ProfessorId"], additional = ViewData["DisciplineId"], param1 = ViewData["IdGroup"] }, new { @class = "" })%>
    </div>        
    </p>
    
   <%;} %>
 <%Html.EndForm();%>
 
</asp:Content>

