<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Статистика
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center" />
    <h2>
        Распределение вопросов по вариантам</h2>
    <br />
    (В строчках указаны вопросы для соответствующего варианта,<br />
     распределенные по соответствующим разделам)
    <br />
    <br />
    <table class="Generator">
    
    <tr align="center">
        <td border="0"></td>
        <%
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
            IRazdelRepository razdelRepository = repositoryManager.GetRazdelRepository;
            
            foreach (Razdel r in (IEnumerable<Razdel>)ViewData["AllRazdelsByTopic"])
            {
                int colspan = r.QuestionsCount;
                int localId = razdelRepository.GetRazdelLocalIdByRazdelId(r.Id);
                if (colspan != 0)
                {
                %>
                <td class ="Generator2" colspan = "<%= colspan %>"> <%= localId%></td>
                <% }
                else continue; %>
           <% ;
            }
        %>
        </tr>
        <% int k = 1;
           int m = 0;
           foreach (GeneratedTestVariant gtv in (IEnumerable<GeneratedTestVariant>)ViewData["AllGeneratedTestVariantsByGeneratedTest"])
           {
        %>
        <tr align="center">
            <td class="Generator3">
                <b>
                    <%= k++%>
                </b>
            </td>
            <%
                ArrayList al = new ArrayList((ICollection)ViewData["AllGeneratedQuestionsByGeneratedTestVariant"]);
                ViewData["temp"] = al[m++];

                foreach (GeneratedQuestion gq in (IEnumerable<GeneratedQuestion>)ViewData["temp"])
                {
                    IQuestionRepository questionRepository = repositoryManager.GetQuestionRepository;
                    int localId = questionRepository.GetQuestionLocalIdByQuestionId(gq.QuestionId);
                                     
            %><td class="Generator">
                <%= localId %>
            </td>
            <% }
            %>
            <td class="Generator">
                <%= Html.ActionLink("К вопросам", "GetTestVariant", new { id = gtv.Id })%>
            </td>
        </tr>
        <%} %>
    </table>
    <br />
    <h2>
        Частота использования вопросов в вариантах
    </h2>
    <br />
    <div align="center">
        (Для каждого вопроса теста указано количество его попаданий в варианты)
        <br />
        <br />
        <table class="Generator">
            <% int s = 0;
               int count = 0;
               ArrayList r1 = new ArrayList();
               ArrayList r2 = new ArrayList();

               r1.Add(0);
               r2.Add(0);
               foreach (GeneratedTestVariant gtv in (IEnumerable<GeneratedTestVariant>)ViewData["AllGeneratedTestVariantsByGeneratedTest"])
               {
                   ArrayList al = new ArrayList((ICollection)ViewData["AllGeneratedQuestionsByGeneratedTestVariant"]);
                   ViewData["temp"] = al[s++];

                   foreach (GeneratedQuestion gq in (IEnumerable<GeneratedQuestion>)ViewData["temp"])
                   {
                       if (r1.LastIndexOf(gq.QuestionId) == -1) { r1.Add(gq.QuestionId); r2.Add(1); }
                       else r2[r1.LastIndexOf(gq.QuestionId)] = Convert.ToInt64(r2[r1.LastIndexOf(gq.QuestionId)]) + 1;
                   }

                   r1.Remove(0);
                   r2.Remove(0);

                   ViewData["r1"] = r1;
                   ViewData["r2"] = r2;
               }%>
            <tr align="center">
                <%

                    foreach (object j in (IEnumerable)ViewData["r1"])
                    {
                        IQuestionRepository questionRepository = repositoryManager.GetQuestionRepository;
                        string fullLocalId = questionRepository.GetFullQuestionLocalIdByQuestionId(Convert.ToInt64(j));
                        %>
                <td class="Generator">
                    <b>
                        <%= fullLocalId %>
                    </b>
                </td>
                <%}%>
            <tr align="center">
                <%
                    foreach (object j in (IEnumerable)ViewData["r2"])
                    {%>
                <td class="Generator">
                    <%= j.ToString() %>
                </td>
                <%}
                %>
            </tr>
        </table>
        <br />
        <%= Html.ActionLink("Назад", "GetGeneratedTests", "Tests", new { topicId = Convert.ToInt64(ViewData["TopicId"]) }, new { @class = "" })%>
    </div>
</asp:Content>
