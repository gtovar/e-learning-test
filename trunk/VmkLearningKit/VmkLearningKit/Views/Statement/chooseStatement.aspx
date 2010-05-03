<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	eВМК – электронный ВМК
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
  /*  $(function() {
        $("group").change(function() {
            var data = {
                "professor": '<%=ViewData["ProfessorId"]%>',
                "discipline": '<%=ViewData["DisciplineId"]%>',
                "group": $(this).val()
            };
            $post("/Statement/Statement", data, null, "json");
        })
    })
    */
</script>

<%using (Html.BeginForm("Statement", "Statement",new{alias=ViewData["DisciplineId"]},FormMethod.Post, new {id="groupFilter" })) %>
   <%  { %>
    
    <table>
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
           <td>
                <select name="group" onchange="SubmitPage('groupFilter')">  
                <option >select...</option>
                <%foreach (VmkLearningKit.Models.Repository.Group groupItem in (IEnumerable<VmkLearningKit.Models.Repository.Group>)ViewData["groups"])
                  {%>
                <option value='<%=groupItem.Alias%>'><%=Html.Encode(groupItem.Title)%>
                </option> 
                <%} %>   
                </select>
           <b> <%=ViewData["TitleGroup"]%></b>
           </td>
        </tr>
    </table>
    <br/>  
    <input id="Hidden1"  name="professor"  value="<%=ViewData["ProfessorId"]%>" type="hidden" />
    <input id="Hidden2" name="discipline" type="hidden" value="<%=ViewData["DisciplineId"]%>" />
    
    <%} %>
    <%Html.EndForm();%>
</asp:Content>
