<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="ManageTesting.aspx.cs" Inherits="UnnLearningKit.Testing.Testing" %>

<asp:Content ID="ManageTestingPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="manageTestingUpdatePanel" runat="server">
        <ContentTemplate>
            Список назначенных тестирований<br />
            <br />
            <asp:Label ID="departmentsTitle" runat="server" Text="Факультет"></asp:Label>
            <br />
            <asp:DropDownList ID="departmentsList" runat="server" 
                DataSourceID="ObjectDepartmentsDataSource" DataTextField="title" 
                DataValueField="id" AutoPostBack="True">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;<asp:Button ID="assignTest" runat="server" 
                Text="Назначить тестирование" CssClass="button" 
                PostBackUrl="~/Testing/AssignTests.aspx" />
            <asp:ObjectDataSource ID="ObjectDepartmentsDataSource" runat="server" 
                DeleteMethod="Delete" InsertMethod="Insert" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDepartments" 
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
            <br />
            <br />
            <asp:Label ID="disciplinesTitle" runat="server" Text="Дисциплина"></asp:Label>
            &nbsp;/
            <asp:Label ID="disciplinePartsTitle" runat="server" Text="Раздел дисциплины"></asp:Label>
            <br />
            <asp:DropDownList ID="disciplinesList" runat="server" 
                DataSourceID="ObjectDisciplinesDataSource" DataTextField="title" 
                DataValueField="id" AutoPostBack="True">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="ObjectDisciplinesDataSource" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllDisciplinesByDepartmentId" 
                TypeName="dataSetTableAdapters.DisciplineTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="departmentsList" Name="department_id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            &nbsp; / &nbsp;
            <asp:DropDownList ID="disciplinePartsList" runat="server" 
                DataSourceID="ObjectDisciplinePartsDataSource" DataTextField="title" 
                DataValueField="id" AutoPostBack="True">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="ObjectDisciplinePartsDataSource" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllDisciplinePartByDisciplineId" 
                TypeName="dataSetTableAdapters.DisciplinePartTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="disciplinesList" Name="discipline_id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
            <br />
<div>

    <asp:GridView ID="viewCurrentTests" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataSourceID="ObjectGroupCurrentTestingDataSource" 
        ondatabound="viewCurrentTests_DataBound">
        <RowStyle BackColor="White" ForeColor="#003399" />
        <Columns>
            <asp:TemplateField HeaderText="Hомер" runat="server">
            <ItemTemplate>
            <asp:Label ID="numbers" runat="server" Text="1"></asp:Label>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="title" HeaderText="Группа" SortExpression="title" />
            <asp:TemplateField HeaderText="Статус">
            <ItemTemplate>
            <asp:Label ID="status" runat="server" Text="Назначено"></asp:Label>
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectGroupCurrentTestingDataSource" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetGroupCurrentTesting" 
        TypeName="dataSetTableAdapters.GroupCurrentTestingTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="departmentsList" Name="department_id" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="disciplinePartsList" Name="discipline_part_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</div>
            <br />

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="viewCurrentTests" EventName="DataBound" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
