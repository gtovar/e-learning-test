<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace ='VmkLearningKit.Models.Repository' %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Просмотр тестового варианта студента
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<link type="text/css" rel="stylesheet" href='<%=ViewData["themes"] %>'> 
<script type="text/javascript" src="/Scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
</script>


    <frameset rows="10,*">
     <frame src="http://ya.ru">aa
     <frame src="http://localhost:1061/WebPlayer/Start.aspx?mode=grading&key=7TqOelZ4bWuzgRNlGxR5tHQlQMhhHzj1SV7a3mWE">
     <noframes>
          <p>K сожалению, ваш браузер не' поддерживает фреймы. Воспользуйтесь более свежей версией ПО</р>
     </noframes>

  </frameset>





</asp:Content>