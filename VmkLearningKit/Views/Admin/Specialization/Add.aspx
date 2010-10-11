<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    eВМК – электронный ВМК / Администраторская панель / Управление специализациями
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3> Управление специализациями / Добавить специализацию</h3>
     
   <%Html.RenderPartial("Specialization/SpecializationForm", ViewData.Model); %>
   
</asp:Content>
