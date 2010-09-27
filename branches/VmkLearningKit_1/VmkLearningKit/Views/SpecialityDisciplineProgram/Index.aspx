<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VmkLearningKit.Models.Repository.SpecialityDisciplineProgram>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Прорамма дисциплины
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<link rel="stylesheet" type="text/css" href="/Content/SpecialityDisciplineProgram.css" />
    <%
        if (null != ViewData["discipline"] && null != ViewData["disciplineProgram"])
        {
            //.Replace("Редактрировать", String.Format(@"<img src='/Content/Images/edit2.png' alt='Редактировать'/>Редактрировать"))
            SpecialityDiscipline discipline = (SpecialityDiscipline)ViewData["discipline"];
            SpecialityDisciplineProgram disciplineProgram = (SpecialityDisciplineProgram)ViewData["disciplineProgram"]; %>

        <div class="programText">
           
                <% if(null!=ViewData["isEdit"]){ %>
                <div id="editDiv">
                    <img src="/Content/Images/edit2.png" alt="Редактировать" />
                    <%=Html.ActionLink("Редактрировать", "Edit", new { id = disciplineProgram.SpecialityDisciplineId })%>    
                  
                </div>
                <% } %>

           <h2>Прорамма дисциплины "<% = Html.Encode(discipline.Title)%>"</h2>

            <br />
            <h3>1. Область применения</h3>
                <%= disciplineProgram.ApplicationDomain%>
            <br />
            <h3>2. Цели и задачи дисциплины</h3>
                <%= disciplineProgram.Purposes%>
                <br />
            <h3>3. Требования к уровню освоения содержания дисциплины</h3>
                <%= disciplineProgram.Requirements%>
                <br />
            <h3>4.Объем дисциплины и виды учебной работы</h3>
                <%= disciplineProgram.Volume%>
                <br />
            <h3>5. Содержание дисциплины</h3>
       
                <br />
            <h4>5.1. Разделы дисциплины и виды занятий</h4>
                <%= disciplineProgram.Razdels%>
                <br />
            <h4>5.2. Содержание разделов дисциплины</h4>
                <%= disciplineProgram.RazdelsContent%>
                <br />
            <h3>6. Лабораторный практикум.</h3>
                <%= disciplineProgram.LabPractice%>
                <br />
            <h3>7. Учебно-методическое обеспечение дисциплины</h3>
                <%= disciplineProgram.Literature%>
                <br />
            <h3>8. Вопросы для контроля</h3>
                <%= disciplineProgram.Questions%>
                <br />
            <h3>9. Критерии оценок</h3>
                <%= disciplineProgram.MarkCriterias%>
                <br />
            <h3>10. Примерная тематика курсовых работ и критерии их оценки </h3>
                <%= disciplineProgram.Reporting%>
                <br />
                <br />
                <%= disciplineProgram.Additional%>
                  <br />

                    
           </div>
     <% }
        else
        { %>
            <h2>Ошибка выбора дисциплины!</h2>
           <%} %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>

