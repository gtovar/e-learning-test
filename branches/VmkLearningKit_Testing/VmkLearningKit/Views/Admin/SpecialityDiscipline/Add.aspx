<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Администраторская панель / Управление дисциплинами
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3> Управление дисциплинами / Добавить дисциплину</h3>
     
   <%Html.RenderPartial("SpecialityDiscipline/SpecialityDisciplineForm", ViewData.Model); %>
   
</asp:Content>
