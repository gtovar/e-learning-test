<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="ManageStudents.aspx.cs" Inherits="Admin_Students_ManageStudents" %>

<asp:Content ID="headManageStudentsPage" ContentPlaceHolderID="headAdminMasterPage"
    runat="Server">
    <style type="text/css">
        .style1
        {
            width: 82px;
        }
        .style2
        {
            width: 286px;
        }
    </style>
</asp:Content>
<asp:Content ID="contentManageStudentsPage" ContentPlaceHolderID="adminContentPlaceHolder"
    runat="Server">
    <asp:UpdatePanel ID="studentsUpdatePanel" runat="server">
        <ContentTemplate>
            <asp:Label ID="studentsLabel" runat="server" Text="Студенты" CssClass="title"></asp:Label>
            <br />
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="style1">
                        <asp:Label ID="departmentsListLabel" runat="server" Text="Факультет:" 
                            Font-Size="Medium"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="departmentsList" runat="server" AutoPostBack="True" DataSourceID="DepartmentsObjectDataSource"
                            DataTextField="title" DataValueField="id" OnDataBound="departmentsList_DataBound">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="DepartmentsObjectDataSource" runat="server" DeleteMethod="Delete"
                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDepartmentsData"
                            TypeName="dataSetTableAdapters.DepartmentTableAdapter" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_id" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="title" Type="String" />
                                <asp:Parameter Name="Original_id" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="title" Type="String" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="groupsListLabel" runat="server" Text="Группа:" 
                            Font-Size="Medium"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="groupsList" runat="server" AutoPostBack="True" DataSourceID="GroupsObjectDataSource"
                            DataTextField="title" DataValueField="id" OnDataBound="groupsList_DataBound">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="GroupsObjectDataSource" runat="server" DeleteMethod="Delete"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllGroupsDataByDepartmentId"
                            TypeName="dataSetTableAdapters.GroupTableAdapter" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_id" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="title" Type="String" />
                                <asp:Parameter Name="description" Type="String" />
                                <asp:Parameter Name="Original_id" Type="Int32" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="departmentsList" Name="department_id" PropertyName="SelectedValue"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td align="right">
                        <asp:Button ID="addStudent" runat="server" CssClass="button" Text="Добавить студента"
                            OnClick="addStudent_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="studentsGridView" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="StudentsObjectDataSource"
                ForeColor="#333333" GridLines="None" Width="100%" CssClass="Grid">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="login" HeaderText="Логин" SortExpression="login">
                        <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="Полное имя" 
                        SortExpression="name">
                        <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email">
                        <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="description" HeaderText="Описание" SortExpression="description">
                        <ItemStyle BackColor="#EDF5FF" ></ItemStyle>
                    </asp:BoundField>
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/Admin/Students/EditStudent.aspx?StudentID={0}"
                        HeaderText="Операции" Text="Редактировать">
                        <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                    </asp:HyperLinkField>
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/Admin/Students/DeleteStudent.aspx?StudentID={0}"
                        HeaderText="Операции" Text="Удалить">
                        <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                    </asp:HyperLinkField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <asp:ObjectDataSource ID="StudentsObjectDataSource" runat="server" DeleteMethod="Delete"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllStudentsDataByGroupID"
                TypeName="dataSetTableAdapters.StudentTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="login" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="groupsList" Name="group_id" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
