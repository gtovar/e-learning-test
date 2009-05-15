<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddDiscipline.aspx.cs" Inherits="Admin_Disciplines_AddDiscipline" %>

<asp:Content ID="headAddDisciplinePage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentAddDisciplinePage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="addDisciplineTitleLabel" runat="server" CssClass="title" 
        Text="Добавить дисциплину"></asp:Label>
    <br />
    <br />
    <asp:Label ID="departmentsListLabel" runat="server" Font-Size="Medium" 
        Text="Факультет:*"></asp:Label>
    <br />
    <asp:DropDownList ID="departmentsList" runat="server" AutoPostBack="True" 
        DataSourceID="DepartmentsObjectDataSource" DataTextField="title" 
        DataValueField="id" ondatabound="departmentsList_DataBound">
    </asp:DropDownList>
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
        <br />
        <br />
    <asp:Label ID="chairTitleLabel" runat="server" Font-Size="Medium" 
        Text="Название:*"></asp:Label>
    <br />
    <asp:TextBox ID="tittleText" runat="server" Width="270px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="chairTitleRequiredValidator" runat="server" 
        ErrorMessage="Название" ControlToValidate="tittleText" 
        CssClass="validation">Название не должно быть пустым</asp:RequiredFieldValidator>
    <br />
    
    <asp:ValidationSummary ID="disciplinesValidationSummary" runat="server" HeaderText="В следующих полях обнаружены ошибки:" CssClass="validation" />
    <br />
    <asp:Button ID="saveDiscipline" runat="server" Text="Сохранить" 
        CssClass="button" onclick="saveDiscipline_Click" />
</asp:Content>

