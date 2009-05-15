<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditDiscipline.aspx.cs" Inherits="Admin_Disciplines_EditDiscipline" %>

<asp:Content ID="headEditDisciplinePage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentEditDisciplinePage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="editDisciplineLabel" CssClass="title" runat="server" Text="Редактировать дисцилину"></asp:Label>
    <br />
    <br />
    <asp:Label ID="departmentsListLabel" runat="server" Text="Факультет:*" 
        Font-Size="Medium"></asp:Label>
    <br />
    <asp:DropDownList ID="departmentsList" runat="server" AutoPostBack="True" 
        DataSourceID="DepartmentsObjectDataSource" DataTextField="title" 
        DataValueField="id" ondatabound="departmentsList_DataBound">
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="chairsListLabel" runat="server" Text="Кафедра:*" 
        Font-Size="Medium"></asp:Label>
    <br />
    <asp:DropDownList ID="chairsList" runat="server" 
        DataSourceID="ChairsObjectDataSource" DataTextField="title" 
        DataValueField="id" ondatabound="chairsList_DataBound">
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
    <asp:ObjectDataSource ID="DepartmentsObjectDataSource" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetAllDepartmentsData" 
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
    <asp:Label ID="disciplineTitleLabel" runat="server" Text="Название:*" 
        Font-Size="Medium"></asp:Label>
    <br />
    <asp:TextBox ID="titleText" runat="server" Width="270px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="disciplineTitleRequiredValidator" 
        runat="server" ErrorMessage="Название" ControlToValidate="titleText" 
        CssClass="validation">Название не должно быть пустым</asp:RequiredFieldValidator>
    <asp:ValidationSummary ID="disciplinesValidationSummary" runat="server" CssClass="validation" HeaderText="В следующих полях  допущены ошибки:" />
    <br />
    <br />
    <asp:Button ID="saveDiscipline" runat="server" Text="Сохранить" 
        CssClass="button" onclick="saveDiscipline_Click" />
</asp:Content>

