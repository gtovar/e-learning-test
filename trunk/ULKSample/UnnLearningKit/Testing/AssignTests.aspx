<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="AssignTests.aspx.cs" Inherits="UnnLearningKit.Testing.AssingTests" %>

<asp:Content ID="AssignTestsPage" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="assignTestsUpdatePanel" runat="server" ChildrenAsTriggers="True">
    <ContentTemplate>
        <br />
        <asp:Label ID="departmentLabel" runat="server" Text="Факультет"></asp:Label>
        <br />
        <asp:DropDownList ID="departmentsList" runat="server" AutoPostBack="True" 
            DataSourceID="ObjectDepartmentsDataSource" DataTextField="title" 
            DataValueField="id">
        </asp:DropDownList>
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
<asp:Label ID="disciplineLabel" runat="server" Text="Дисциплина"></asp:Label>
&nbsp;/
<asp:Label ID="disciplinePartLabel" runat="server" Text="Раздел дисциплины"></asp:Label>
<br />
<asp:DropDownList ID="disciplinesList" runat="server" AutoPostBack="True" 
            DataSourceID="ObjectDisciplinesDataSource" DataTextField="title" 
            DataValueField="id">
</asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDisciplinesDataSource" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDisciplinesByDepartmentId" 
            TypeName="dataSetTableAdapters.DisciplineTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="departmentsList" Name="department_id" 
                    PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
            </SelectParameters>
        </asp:ObjectDataSource>
        &nbsp;/&nbsp;
<asp:DropDownList ID="disciplinePartsList" runat="server" AutoPostBack="True" 
            DataSourceID="ObjectDisciplinePartsDataSource" DataTextField="title" 
            DataValueField="id">
</asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDisciplinePartsDataSource" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetAllDisciplinePartByDisciplineId" 
            TypeName="dataSetTableAdapters.DisciplinePartTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="disciplinesList" Name="discipline_id" 
                    PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <br />
        <asp:Label ID="groupLabel" runat="server" Text="Группа"></asp:Label>
        <br />
        <asp:DropDownList ID="groupsList" runat="server" 
            DataSourceID="ObjectGroupsDataSource" DataTextField="title" 
            DataValueField="id" AutoPostBack="True">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectGroupsDataSource" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetAllGroupsByDepartmentId" 
            TypeName="dataSetTableAdapters.GroupTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="departmentsList" Name="department_id" 
                    PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <br />
<div>
    <asp:ObjectDataSource ID="ObjectTestVariantsDataSource" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetAllTestByDisciplinePartId" 
        TypeName="dataSetTableAdapters.TestVariantTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="disciplinePartsList" Name="discipline_part_id" 
                PropertyName="SelectedValue" DefaultValue="1" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="viewStudentsAndTests" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataKeyNames="id" DataSourceID="ObjectStudentsDataSource" 
        ondatabound="viewStudentsAndTests_DataBound">
        <RowStyle BackColor="White" ForeColor="#003399" />
        <Columns>
            <asp:TemplateField HeaderText="Hомер" runat="server">
            <ItemTemplate>
            <asp:Label ID="numbers" runat="server" Text="1"></asp:Label>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="name" HeaderText="ФИО" SortExpression="name" />
            <asp:TemplateField HeaderText="Тестовый варинат">
            <ItemTemplate>
                <asp:DropDownList ID="testVariantsList" runat="server" DataSourceID="ObjectTestVariantsDataSource" DataTextField="path" DataValueField="id">
                </asp:DropDownList>
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectStudentsDataSource" runat="server" 
        DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetOnlyStudentContentField" 
        TypeName="dataSetTableAdapters.StudentTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="login" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="groupsList" Name="group_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</div>
<br />
<br />
        <asp:Button ID="saveCurrentTest" runat="server" Text="Принять" 
            CssClass="button" onclick="saveCurrentTest_Click" />
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="viewStudentsAndTests" EventName="DataBound" />
    </Triggers>
    </asp:UpdatePanel>
</asp:Content>
