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
            <td border="0">
            </td>
            <%
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
            IQuestionRepository questionRepository = repositoryManager.GetQuestionRepository;
            IRazdelRepository razdelRepository = repositoryManager.GetRazdelRepository;
            
            ArrayList num_razdels = new ArrayList();
            foreach (GeneratedTestVariant gtv in (IEnumerable<GeneratedTestVariant>)ViewData["AllGeneratedTestVariantsByGeneratedTest"])
               {
                    ArrayList al_ = new ArrayList((ICollection)ViewData["AllGeneratedQuestionsByGeneratedTestVariant"]);
                    ViewData["temp"] = al_[0];

                    foreach (GeneratedQuestion gq in (IEnumerable<GeneratedQuestion>)ViewData["temp"])
                    {
                        long num1 = questionRepository.GetRazdelIdByQuestionId(gq.QuestionId);
                        long num = razdelRepository.GetRazdelLocalIdByRazdelId(num1);
                        num_razdels.Add(num);
                    }
                break;
            }

            ArrayList b1 = new ArrayList();
            ArrayList b2 = new ArrayList();
 
            for (int i = 0; i < num_razdels.Count; i++)
			{
                if (b1.IndexOf(num_razdels[i]) < 0)
                {
                    int colspan = 1;
                    for (int j = i + 1; j < num_razdels.Count; j++)
                    {
                        if (Convert.ToInt32(num_razdels[i]) == Convert.ToInt32(num_razdels[j])) { colspan++; }
                        else break;
                    }
                    b1.Add(num_razdels[i]);
                    b2.Add(colspan);
                }
                else continue;
            }
            for (int i = 0; i < b1.Count; i++)
			{
            %>
            <td class="Generator2"
                colspan="<%= b2[i]%>">
                <%= b1[i]%>
            </td>
            <%        
               
            }%>
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
                    
                    int localId = questionRepository.GetQuestionLocalIdByQuestionId(gq.QuestionId);
                                     
            %><td class="Generator">
                <%= localId %>
            </td>
            <% }
            %>
            <td class="Generator">
                <%= Html.ActionLink("К вопросам", "GetTestVariant", new { id = gtv.Id })%>
            </td>
            <td class="Generator">
                <%= Html.ActionLink("Смотреть", "Show", new { id = gtv.Id })%>
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
        (Для каждого вопроса теста указано количество его попаданий в варианты.<br />
         В скобках указаны номера разделов вопросов)
        <br />
        <br />
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
               }

               ArrayList numbers = new ArrayList();
               ArrayList counts = new ArrayList();
                
               foreach (object j in (IEnumerable)ViewData["r1"])
               {
                   numbers.Add(questionRepository.GetFullQuestionLocalIdByQuestionId(Convert.ToInt64(j)));
               }

               foreach (object j in (IEnumerable)ViewData["r2"])
               {
                   counts.Add(Convert.ToInt32(j));
               } 
                
                
                %>
                <table class="Generator">
                <%
                    int length = numbers.Count;
                    int index = 0;

                    while (length > 0)
                    {%>
                       <tr align="center">
                        <%int t = index + 15;
                        for (int i = index; i < t; i++, length--)
                        {
                            if (length > 0)
                            {
                %>
                <td class="Generator">
                    <b>
                        <%= numbers[i]%>
                    </b>
                </td>
                <%}
                            else { t = i;  break; }
                        }%>
                        </tr>
                        <tr align="center">
                        <%
                        for (int i = index; i < t; i++)
                        {			 
                        %>
            
                <td class="Generator">
                    <%= counts[i]%>
                </td>
                <%}
                        index += 15;
                %>
            </tr>
        
        <%} %>
        </table>
        <br />
        <%= Html.ActionLink("Назад", "GetGeneratedTests", "Tests", new { topicId = Convert.ToInt64(ViewData["TopicId"]) }, new { @class = "" })%>
    </div>
</asp:Content>
