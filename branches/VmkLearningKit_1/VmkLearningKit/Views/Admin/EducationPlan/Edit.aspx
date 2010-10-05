<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Администраторская панель / Управление планами обучения 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Управление планами обучения / Редактировать план обучения</h3>
    <%Html.RenderPartial("EducationPlan/EducationPlanForm", ViewData.Model); %>
</asp:Content>