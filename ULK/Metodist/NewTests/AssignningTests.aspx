<%@ Page Title="" Language="C#" MasterPageFile="~/Metodist/MetodistMasterPage.master" AutoEventWireup="true"
    CodeFile="AssignningTests.aspx.cs" Inherits="Metodist_AssignningTests" %>

<asp:Content ID="headAssignningTestsPage" ContentPlaceHolderID="metodistHeadPlaceHolder"
    runat="Server">
</asp:Content>
<asp:Content ID="contentAssignningTestPage" ContentPlaceHolderID="metodistContentPlaceHolder"
    runat="Server">
    <asp:UpdatePanel ID="assignningTestsUpdatePanel" runat="server" ChildrenAsTriggers="True">
        <ContentTemplate>
            <asp:Label ID="assinningTestLabel" CssClass="title" runat="server" Text="���������� ������"></asp:Label>
            <br />
            <br />
            <table width="100%">
                <tr>
                    <td>
                        <asp:Label ID="departmentLabel" runat="server" Text="���������" 
                            Font-Size="Medium"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="departmentsList" runat="server" AutoPostBack="True" DataSourceID="ObjectDepartmentsDataSource"
                            DataTextField="title" DataValueField="id">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDepartmentsDataSource" runat="server" DeleteMethod="Delete"
                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDepartmentsData"
                            TypeName="dataSetTableAdapters.DepartmentTableAdapter" 
                            UpdateMethod="Update">
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
                            <asp:Label ID="chairsListLabel" runat="server" Text="�������" 
                                Font-Size="Medium"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="chairsList" runat="server" 
                                DataSourceID="ChairsObjectDataSource" DataTextField="title" 
                                DataValueField="id" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ChairsObjectDataSource" runat="server" 
                                DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
                                SelectMethod="GetAllChairsDataByDepartmentID" 
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
                                    <asp:ControlParameter ControlID="departmentsList" Name="department_id" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td width="25%">
                            <asp:Label ID="disciplineLabel" runat="server" Text="����������" 
                                Font-Size="Medium"></asp:Label>
                            &nbsp;/
                            <asp:Label ID="disciplinePartLabel" runat="server" Text="������ ����������" Font-Size="Medium"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="disciplinesList" runat="server" AutoPostBack="True" DataSourceID="ObjectDisciplinesDataSource"
                                DataTextField="title" DataValueField="id">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDisciplinesDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetAllDisciplinesDataByDepartmentID" 
                                TypeName="dataSetTableAdapters.DisciplineTableAdapter" 
                                DeleteMethod="Delete" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_id" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="title" Type="String" />
                                    <asp:Parameter Name="Original_id" Type="Int32" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="chairsList" Name="chair_id" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="departmentsList" Name="department_id" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            &nbsp;/&nbsp;
                            <asp:DropDownList ID="disciplinePartsList" runat="server" AutoPostBack="True" DataSourceID="ObjectDisciplinePartsDataSource"
                                DataTextField="title" DataValueField="id">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDisciplinePartsDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetAllDisciplinePartsDataByDisciplineID" 
                                TypeName="dataSetTableAdapters.DisciplinePartTableAdapter" 
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
                            <asp:Label ID="groupLabel" runat="server" Text="������" Font-Size="Medium"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="groupsList" runat="server" DataSourceID="ObjectGroupsDataSource"
                                DataTextField="title" DataValueField="id" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectGroupsDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetAllGroupsDataByDepartmentId" 
                                TypeName="dataSetTableAdapters.GroupTableAdapter" DeleteMethod="Delete" 
                                UpdateMethod="Update">
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
                            <asp:ObjectDataSource ID="ObjectTestVariantsDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetAllTestsVariants" 
                                TypeName="dataSetTableAdapters.TestVariantTableAdapter" DeleteMethod="Delete" 
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_id" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="title" Type="String" />
                                    <asp:Parameter Name="path" Type="String" />
                                    <asp:Parameter Name="Original_id" Type="Int32" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="disciplinePartsList" Name="discipline_part_id" PropertyName="SelectedValue"
                                        DefaultValue="" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
            </table>
            <div>
                <asp:GridView ID="viewStudentsAndTests" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="ObjectStudentsDataSource"
                    OnDataBound="viewStudentsAndTests_DataBound" ForeColor="#333333" GridLines="None"
                    Width="100%" CssClass="Grid">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="H����" runat="server">
                            <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                            <ItemTemplate>
                                <asp:Label ID="numbers" runat="server" Text="1"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="name" HeaderText="���" SortExpression="name">
                            <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="�������� �������">
                            <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                            <ItemTemplate>
                                <asp:DropDownList ID="testVariantsList" runat="server" DataSourceID="ObjectTestVariantsDataSource"
                                    DataTextField="title" DataValueField="id">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectStudentsDataSource" runat="server" DeleteMethod="Delete"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllStudentsDataByGroupID"
                    TypeName="dataSetTableAdapters.StudentTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="login" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="groupsList" Name="group_id" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <br />
            <asp:Button ID="saveCurrentTest" runat="server" Text="�������" CssClass="button"
                OnClick="saveCurrentTest_Click" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="viewStudentsAndTests" EventName="DataBound" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
