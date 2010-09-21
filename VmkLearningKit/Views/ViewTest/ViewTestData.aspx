<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Просмотр тестового варианта студента</title>
    <script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
    $(function () {
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
    <table border='1px' style="color:#4c4c4c; text-align:left; border-color:Black"> 
    <thead >
        <tr>
           <td style=" background-color:#e2efff;  border-width: 0px; margin-bottom:0px; margin-top:0px; padding-bottom:0px; padding-top:0px; padding-left:5px; padding-right:5px;">
               <h3 style="margin-top: 4px; margin-bottom: 4px;">Тест по дисциплине: <%=ViewData["discipline"] %> <br />
                    тема: <%=ViewData["topic"] %>
               </h3>
           </td>
        </tr>
        <tr>
            <td  style="border-width: 0px; padding-bottom:0px; padding-top:0px; padding-left:5px; padding-right:5px; margin-bottom:0px; margin-top:0px" > 
                
                  <h3 style="margin-top: 4px; margin-bottom: 4px;"> <%=ViewData["student"] %> (<%=ViewData["group"] %>)</h3>
            </td>
        </tr>
        <tr>
            <td  style="border-width: 0px; padding-top:0px; padding-left :5px; padding-right:5px; padding-bottom:5px;">
                  Вариант <b>№:<%=(ViewData["testLocalNum"]).ToString()%></b>      Генереция тестового варианта: <b><%=((AssignedTestVariant)ViewData["test"]).GeneratedTestVariant.GeneratedTest.GeneratedDate.ToString()%></b> <br />
                  Время прохождения теста: c <b><%=((AssignedTestVariant)ViewData["test"]).AssignedDate.ToString()%></b> по <b> <%//=((AssignedTestVariant)ViewData["test"]).AssignedDateEnd.ToString()%></b> 
               
            </td>
        </tr>
    
    </thead>
    
    <tbody>
        <tr>
            <td  style="border-width: 0px; padding-top:0px; padding-left :5px; padding-right:5px; padding-bottom:5px;"><a href="<%= ViewData["testPath"]%>" target="_blank">Посмотреть тест</a>
            </td>
        </tr>
    
        <%if (((AssignedTestVariant)ViewData["test"]).State == VLKConstants.TEST_VARIANT_STATE_NEW)
          {%>
        <tr>
            <td style="border-width: 0px; padding: 5px;">
            <p><h3><font color="red"><b>Тестовый вариант еще не выполнен студентом</b></font></h3></p>
            </td>
        </tr> 
        <%;} %>
        <%else { %>
        <tr>
            <td style="border-width: 0px; padding: 5px;">
            Колличество баллов: <b><%=((AssignedTestVariant)ViewData["test"]).Score%></b> из <b><%=(ViewData["MaxScore"]).ToString() %></b>
            </td>           
        </tr>
        <tr>
            <td style="border-width: 0px; padding: 5px;">
            Оценка:  
            <input id="Mark" type="text" value='<%if (((AssignedTestVariant)ViewData["test"]).State == VLKConstants.TEST_VARIANT_STATE_DONE){%>
                 <%=((AssignedTestVariant)ViewData["test"]).Mark %>
                 <%} %>' style=" width:50px; color:Red ;"/>
           
            </td>
        </tr>
        <tr>
            <td style="border-width: 0px; padding: 5px;"><input id="setMark" type="button" value="Изменить оценку" />
            </td>
        </tr>
    </tbody>    
    </table> 
    
    </div>
</body>            
      <%;} %>
    

</html>
