<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Статистика
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center" />
    <h2>
        Распределение вопросов по вариантам</h2>
    <br />
    (В строчках указаны вопросы для соответствующего варианта)
    <br />
    <br />
    <table border="1">
        <% int k = 1;
           int m = 0;
           foreach (GeneratedTestVariant gtv in (IEnumerable<GeneratedTestVariant>)ViewData["AllGeneratedTestVariantsByGeneratedTest"])
           {
        %>
        <tr align = "center">
            <td>
                <b>
                    <%= k++%>
                </b>
            </td>
            <%
                ArrayList al = new ArrayList((ICollection)ViewData["AllGeneratedQuestionsByGeneratedTestVariant"]);
                ViewData["temp"] = al[m++];

                foreach (GeneratedQuestion gq in (IEnumerable<GeneratedQuestion>)ViewData["temp"])
                {                  
            %><td>
                <%= gq.QuestionId %>
            </td>
            <% }
            %>
            <td>
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
        <table border = "1">
            <% int s = 0;
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
            <tr align = "center">
                <%

                    foreach (object j in (IEnumerable)ViewData["r1"])
                    {%>
                <td>
                    <b>
                        <%= j.ToString() %>
                    </b>
                </td>
                <%}%>
            <tr align ="center">
                <%
                    foreach (object j in (IEnumerable)ViewData["r2"])
                    {%>
                <td>
                    <%= j.ToString() %>
                </td>
                <%}
                %>
            </tr>
        </table>
        <br />
        <%= Html.ActionLink("Назад", "GetGeneratedTests", "Tests")%>
    </div>
</asp:Content>
