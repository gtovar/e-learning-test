<%@ Page Title="" Language="C#" MasterPageFile="~/Metodist/MetodistMasterPage.master"
    AutoEventWireup="true" CodeFile="ViewGroupDoneTests.aspx.cs" Inherits="Metodist_DoneTests_ViewGroupTest" %>

<asp:Content ID="headViewGroupTestPage" ContentPlaceHolderID="metodistHeadPlaceHolder"
    runat="Server">
</asp:Content>
<asp:Content ID="contentViewGroupTestPage" ContentPlaceHolderID="metodistContentPlaceHolder"
    runat="Server">
    <asp:UpdatePanel ID="doneAssignmentsUpdatePanel" runat="server" ChildrenAsTriggers="True">
        <ContentTemplate>
            <asp:Label ID="doneAssignmentLabel" runat="server" CssClass="title" Text="Выполненное тестирование"></asp:Label>
            <br />
            <br />
            <table width="100%">
                <tr>
                    <td>
                        <asp:Label ID="departmentLabel" runat="server" Text="Факультет" Font-Size="Medium"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="departmentsList" runat="server" AutoPostBack="True" DataSourceID="ObjectDepartmentsDataSource"
                            DataTextField="title" DataValueField="id" OnDataBound="departmentsList_DataBound">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDepartmentsDataSource" runat="server" DeleteMethod="Delete"
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
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="chairsListLabel" runat="server" Text="Кафедра" Font-Size="Medium"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="chairsList" runat="server" DataSourceID="ChairsObjectDataSource"
                            DataTextField="title" DataValueField="id" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ChairsObjectDataSource" runat="server" DeleteMethod="Delete"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllChairsDataByDepartmentID"
                            TypeName="dataSetTableAdapters.ChairTableAdapter" UpdateMethod="Update">
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
                </tr>
                <tr>
                    <td width="25%">
                        <asp:Label ID="disciplineLabel" runat="server" Text="Дисциплина" Font-Size="Medium"></asp:Label>
                        &nbsp;/
                        <asp:Label ID="disciplinePartLabel" runat="server" Text="Раздел дисциплины" Font-Size="Medium"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="disciplinesList" runat="server" AutoPostBack="True" DataSourceID="ObjectDisciplinesDataSource"
                            DataTextField="title" DataValueField="id">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDisciplinesDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetAllDisciplinesDataByDepartmentID" TypeName="dataSetTableAdapters.DisciplineTableAdapter"
                            DeleteMethod="Delete" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_id" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="title" Type="String" />
                                <asp:Parameter Name="Original_id" Type="Int32" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="chairsList" Name="chair_id" PropertyName="SelectedValue"
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="departmentsList" Name="department_id" PropertyName="SelectedValue"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        &nbsp;/&nbsp;
                        <asp:DropDownList ID="disciplinePartsList" runat="server" AutoPostBack="True" DataSourceID="ObjectDisciplinePartsDataSource"
                            DataTextField="title" DataValueField="id">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDisciplinePartsDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetAllDisciplinePartsDataByDisciplineID" TypeName="dataSetTableAdapters.DisciplinePartTableAdapter"
                            DeleteMethod="Delete" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_id" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="title" Type="String" />
                                <asp:Parameter Name="Original_id" Type="Int32" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="disciplinesList" Name="discipline_id" PropertyName="SelectedValue"
                                    Type="Int32" DefaultValue="" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="groupLabel" runat="server" Text="Группа" Font-Size="Medium"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="groupsList" runat="server" DataSourceID="ObjectGroupsDataSource"
                            DataTextField="title" DataValueField="id" AutoPostBack="True" OnDataBound="groupsList_DataBound">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectGroupsDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetAllGroupsDataByDepartmentId" TypeName="dataSetTableAdapters.GroupTableAdapter"
                            DeleteMethod="Delete" UpdateMethod="Update">
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
                                    Type="Int32" DefaultValue="" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="doneAssignmentGridView" runat="server" CellPadding="4" ForeColor="#333333"
                GridLines="None" DataSourceID="DoneTestsObjectDataSource" CssClass="Grid" AllowPaging="True"
                AllowSorting="True" AutoGenerateColumns="False" Width="100%">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:TemplateField HeaderText="Hомер" runat="server">
                        <ItemStyle BackColor="#EDF5FF" CssClass="text_center" Width="10%"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="numbers" runat="server" Text="1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="name" HeaderText="Студент" SortExpression="name">
                        <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="title" HeaderText="Тестовый вариант" SortExpression="title">
                        <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <asp:ObjectDataSource ID="DoneTestsObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetAllDoneTestsByGroupId" TypeName="dataSetTableAdapters.GroupTestsTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="groupsList" Name="group_id" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:ControlParameter ControlID="disciplinePartsList" Name="discipline_part_id" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
            <asp:Button ID="backToDoneTests" CssClass="button" runat="server" Text="Назад" OnClick="backToDoneTests_Click" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="doneAssignmentGridView" EventName="DataBound" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
