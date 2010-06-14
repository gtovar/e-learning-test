<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace ='VmkLearningKit.Models.Repository' %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	�������� ��������� �������� ��������
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<link type="text/css" rel="stylesheet" href='<%=ViewData["themes"] %>'> 
<script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
    $(function() {
        $("#first").load('<%=ViewData["testPath"] %>');

        $("#setMark").click(function() {

        var mark = parseInt($("#Mark").val());
            
            var id = '<%=((AssignedTestVariant)ViewData["test"]).Id %>';
            alert(id);
           
            var data={ "alias": id.toString(), "mark": mark };
            $.post("/ViewTest/SetMark", data , function(str) { alert(str); }, "json");
           
        })
    });

</script>
    
 <form>
    <table style=" width:90%">
  <tr style=" text-align:left"> <td> <b>����������</b>
       </td>
       <td> <%=ViewData["discipline"] %>
       </td>
       <td><b>����</b>
       </td>
       <td><%=ViewData["topic"] %>
       </td>
  </tr>
 
  <tr>
    <td><b> �������</b>
    </td>
    <td><%=ViewData["student"] %>
    </td>
    <td><b> �����a </b>
    </td>
    <td><%=ViewData["group"] %>
    </td>
  </tr>
  </table>
  
 <div id="first" style=" width:90%">
       <!-- qqq-->
 </div>
     
     <table>    
     <%if (((AssignedTestVariant)ViewData["test"]).State == VLKConstants.TEST_VARIANT_STATE_NEW)
       {%>
       <tr>
       <td><b>�������� ������� ��� �� �������� ���������</b>
       </td>
       </tr> 
        <%;} %>
        <%else { %>
        <tr>
            <td>����������� ������:
            </td>
            <td><%=((AssignedTestVariant)ViewData["test"]).Score%>
            </td>
        </tr>
        <tr>
        <td>������
        </td>
        <td>
        <input id="Mark" type="text" value='<%if (((AssignedTestVariant)ViewData["test"]).State == VLKConstants.TEST_VARIANT_STATE_DONE){%>
             <%=((AssignedTestVariant)ViewData["test"]).Mark %>
             <%} %>'/>
        </td>
        <tr>
            <input id="setMark" type="button" value="�������� ������" />
        </tr>
        <%;} %>
     </table>

          
 
 
</form>
</asp:Content>


