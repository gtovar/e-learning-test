<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<li><%= Html.ActionLink("eВМК", "Index", "Home") %>
    <ul>
        <li><%= Html.ActionLink("Модель образовательного процесса", "Index", "Home") %></li>
        <li><%= Html.ActionLink("Как преподавателю стать участником e-ННГУ?", "Index", "Home") %></li>
        <li><%= Html.ActionLink("Как пройти обучение студенту?", "Index", "Home") %></li>
        <li><%= Html.ActionLink("Что такое e-Learning? ", "Index", "Home") %></li>
    </ul>
</li>
<li><%= Html.ActionLink("Помощь", "Index", "Home") %>
    <ul>
        <li><%= Html.ActionLink("Инструкция для преподователя", "Index", "Home") %></li>
        <li><%= Html.ActionLink("Интсрукция для студента", "Index", "Home") %></li>
    </ul>
</li>