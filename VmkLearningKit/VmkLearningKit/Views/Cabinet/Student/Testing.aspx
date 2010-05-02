<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    e��� � ����������� ��� / ����� ������� / ������� ��������
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link type="text/css" href="/Scripts/Plugins/Tabber/css/ui-lightness/jquery-ui-1.8.1.custom.css"
        rel="stylesheet" />

    <script type="text/javascript" src="/Scripts/Plugins/Tabber/js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="/Scripts/Plugins/Tabber/js/jquery-ui-1.8.1.custom.min.js"></script>

    <script type="text/javascript">
        $(function() {
            // Tabs
            $('#tabs').tabs();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        ������������</h2>
    <br />
    <div id="tabs">
        <ul>
            <li><a href="#newTestVariantTab">�����</a></li>
            <li><a href="#doneTestVariantTab">�����������</a></li>
            <li><a href="#checkedTestVariantTab">�����������</a></li>
        </ul>
        <div id="newTestVariantTab">
            <% if (null != ViewData["AssignedTestVariants"])
               {
                   IEnumerable<AssignedTestVariant> assignedTestVariants = (IEnumerable<AssignedTestVariant>)ViewData["AssignedTestVariants"];
                   if (assignedTestVariants.Count() > 0)
                   {
            %>
            <table width="100%" border="1">
                <tr class="table_header">
                    <th class="table_th">
                        �
                    </th>
                    <th class="table_th">
                        ����������
                    </th>
                    <th class="table_th">
                        ����
                    </th>
                </tr>
                <% int index = 1;
                   foreach (AssignedTestVariant assignedTestVariant in assignedTestVariants)
                   {
                       // ������� ������ ����� �����
                       if (assignedTestVariant.State == VLKConstants.TEST_VARIANT_STATE_NEW)
                       {
                %>
                <tr class="table_row">
                    <td class="table_td">
                        <%= index%>
                    </td>
                    <td class="table_td" style="text-align:left">
                        <%
                            string disciplineTitle = String.Empty;
                            if (null != assignedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline)
                            {
                                disciplineTitle = assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline.Title;
                            }
                        %>
                        <%= Html.Encode(disciplineTitle)%>
                    </td>
                    <td class="table_td">
                        <% string testVariantTitle = String.Empty;
                           if (null != assignedTestVariant && !assignedTestVariant.Path.Trim().Equals(String.Empty))
                           {
                               testVariantTitle = "�������_" + Path.GetFileNameWithoutExtension(assignedTestVariant.Path);
                           }
                        %>
                        <% if (!testVariantTitle.Trim().Equals(String.Empty))
                           { %>
                        <%= Html.ActionLink(testVariantTitle, "")%>
                        <% } %>
                    </td>
                </tr>
                <% index++;
                       }
                   }%>
            </table>
            <% }
                   else
                   {%>
            ����� ������� ���
            <%}
               }%>
        </div>
        <div id="doneTestVariantTab">
            <% if (null != ViewData["AssignedTestVariants"])
               {
                   IEnumerable<AssignedTestVariant> assignedTestVariants = (IEnumerable<AssignedTestVariant>)ViewData["AssignedTestVariants"];
                   if (assignedTestVariants.Count() > 0)
                   {
            %>
            <table width="100%" border="1">
                <tr class="table_header">
                    <th class="table_th">
                        �
                    </th>
                    <th class="table_th">
                        ����������
                    </th>
                    <th class="table_th">
                        ����
                    </th>
                    <th class="table_th">
                        ����
                    </th>
                </tr>
                <% int index = 1;
                   foreach (AssignedTestVariant assignedTestVariant in assignedTestVariants)
                   {
                       // ������� ������ ���������� �����
                       if (assignedTestVariant.State == VLKConstants.TEST_VARIANT_STATE_DONE)
                       {
                %>
                <tr class="table_row">
                    <td class="table_td">
                        <%= index%>
                    </td>
                    <td class="table_td" style="text-align: left">
                        <%
                            string disciplineTitle = String.Empty;
                            if (null != assignedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline)
                            {
                                disciplineTitle = assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline.Title;
                            }
                        %>
                        <%= Html.Encode(disciplineTitle)%>
                    </td>
                    <td class="table_td">
                        <% string testVariantTitle = String.Empty;
                           if (null != assignedTestVariant && !assignedTestVariant.Path.Trim().Equals(String.Empty))
                           {
                               testVariantTitle = "�������_" + Path.GetFileNameWithoutExtension(assignedTestVariant.Path);
                           }
                        %>
                        <% if (!testVariantTitle.Trim().Equals(String.Empty))
                           { %>
                        <%= Html.Encode(testVariantTitle)%>
                        <% } %>
                    </td>
                    <td class="table_td">
                        <%= assignedTestVariant.Score %>
                    </td>
                </tr>
                <% index++;
                       }
                   }%>
            </table>
            <% }
                   else
                   {%>
            ����������� ������� ���
            <%}
               }%>
        </div>
        <div id="checkedTestVariantTab">
            <% if (null != ViewData["AssignedTestVariants"])
               {
                   IEnumerable<AssignedTestVariant> assignedTestVariants = (IEnumerable<AssignedTestVariant>)ViewData["AssignedTestVariants"];
                   if (assignedTestVariants.Count() > 0)
                   {
            %>
            <table width="100%" border="1">
                <tr class="table_header">
                    <th class="table_th">
                        �
                    </th>
                    <th class="table_th">
                        ����������
                    </th>
                    <th class="table_th">
                        ����
                    </th>
                    <th class="table_th">
                        ����
                    </th>
                    <th class="table_th">
                        ������
                    </th>
                </tr>
                <% int index = 1;
                   foreach (AssignedTestVariant assignedTestVariant in assignedTestVariants)
                   {
                       // ������� ������ ����������� �����
                       if (assignedTestVariant.State == VLKConstants.TEST_VARIANT_STATE_CHECKED)
                       {
                %>
                <tr class="table_row">
                    <td class="table_td">
                        <%= index%>
                    </td>
                    <td class="table_td" style="text-align:left">
                        <%
                            string disciplineTitle = String.Empty;
                            if (null != assignedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic &&
                                null != assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline)
                            {
                                disciplineTitle = assignedTestVariant.GeneratedTestVariant.GeneratedTest.SpecialityDisciplineTopic.SpecialityDiscipline.Title;
                            }
                        %>
                        <%= Html.Encode(disciplineTitle)%>
                    </td>
                    <td class="table_td">
                        <% string testVariantTitle = String.Empty;
                           if (null != assignedTestVariant && !assignedTestVariant.Path.Trim().Equals(String.Empty))
                           {
                               testVariantTitle = "�������_" + Path.GetFileNameWithoutExtension(assignedTestVariant.Path);
                           }
                        %>
                        <% if (!testVariantTitle.Trim().Equals(String.Empty))
                           { %>
                        <%= Html.Encode(testVariantTitle) %>
                        <% } %>
                    </td>
                    <td class="table_td">
                        <%= assignedTestVariant.Score %>
                    </td>
                    <td class="table_td">
                        <%= assignedTestVariant.Mark %>
                    </td>
                </tr>
                <% index++;
                       }
                   }%>
            </table>
            <% }
                   else
                   {%>
            ����������� ������� ���
            <%}
               }%>
        </div>
    </div>
</asp:Content>
