<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Просмотр тестового варианта студента</title>
    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
    $(function () {
        //    $("#first").load('<%//=ViewData["testPath"] %>');

        $("#setMark").click(function () {

            var mark = parseInt($("#Mark").val());

            var id = '<%=((AssignedTestVariant)ViewData["test"]).Id %>';


            var data = { "alias": id.toString(), "mark": mark };
            $.post("/ViewTest/SetMark", data, function (str) { alert(str); }, "json");

        })
    });

</script>
</head>
<body>
    <div>
    <table style=" width:90%">
  <tr style=" text-align:left"> <td> <b>Дисциплина</b>
       </td>
       <td> <%=ViewData["discipline"] %>
       </td>
       <td><b>Тема</b>
       </td>
       <td><%=ViewData["topic"] %>
       </td>
  </tr>
 
  <tr>
    <td><b> Студент</b>
    </td>
    <td><%=ViewData["student"] %>
    </td>
    <td><b> Группa </b>
    </td>
    <td><%=ViewData["group"] %>
    </td>
  </tr>
  </table>
  
 <div id="first" style=" width:90%">
       <p><a href="<%= ViewData["testPath"]%>" target="_blank">Посмотреть тест</a></p> 

 </div>
     
     <table>    
     <%if (((AssignedTestVariant)ViewData["test"]).State == VLKConstants.TEST_VARIANT_STATE_NEW)
       {%>
       <tr>
       <td><b>Тестовый вариант еще не выполнен студентом</b>
       </td>
       </tr> 
        <%;} %>
        <%else { %>
        <tr>
            <td>Колличество баллов:
            </td>
            <td><%=((AssignedTestVariant)ViewData["test"]).Score%>
            </td>
        </tr>
        <tr>
        <td>Оценка
        </td>
        <td>
        <input id="Mark" type="text" value='<%if (((AssignedTestVariant)ViewData["test"]).State == VLKConstants.TEST_VARIANT_STATE_DONE){%>
             <%=((AssignedTestVariant)ViewData["test"]).Mark %>
             <%} %>'/>
        </td>
        </tr>
        <tr>
            <input id="setMark" type="button" value="Изменить оценку" />
        </tr>
        <%;} %>
     </table>
    </div>
</body>
</html>
