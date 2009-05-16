<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Metodist/MetodistMasterPage.master"
    CodeFile="DoneAssignments.aspx.cs" Inherits="Metodist_DoneAssignments" %>

<asp:Content ID="DoneAssignmentsMetodistPage" ContentPlaceHolderID="metodistContentPlaceHolder"
    runat="server">
    <asp:UpdatePanel ID="doneTestsUpdatePanel" runat="server" ChildrenAsTriggers="True">
        <ContentTemplate>
            <asp:Label ID="doneTestLabel" CssClass="title" runat="server" Text="Выполненное тестирование"></asp:Label>
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
            </table>
            <br />
            <asp:GridView ID="viewDoneTests" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectGroupDoneTestsDataSource"
                OnDataBound="viewDoneTests_DataBound" ForeColor="#333333" CssClass="Grid" GridLines="None" Width="100%">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:TemplateField HeaderText="Hомер" runat="server">
                        <ItemStyle BackColor="#EDF5FF" CssClass="text_center" Width="10%"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="numbers" runat="server" Text="1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="title" HeaderText="Группа" SortExpression="title">
                        <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                    </asp:BoundField>
                    <asp:HyperLinkField DataNavigateUrlFields="title" 
                        DataNavigateUrlFormatString="~/Metodist/DoneTests/ViewGroupDoneTests.aspx?GroupTitle={0}" 
                        HeaderText="Операции" Text="Просмотр" >
                        <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                    </asp:HyperLinkField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectGroupDoneTestsDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetGroupDoneAssignments" 
                TypeName="dataSetTableAdapters.GroupAssignmentsTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="departmentsList" Name="department_id" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:ControlParameter ControlID="disciplinePartsList" Name="discipline_part_id" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="viewDoneTests" EventName="DataBound" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
