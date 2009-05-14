<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditGroup.aspx.cs" Inherits="Admin_Groups_EditGroup" %>

<asp:Content ID="headEditGroupPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentEditGroupPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="editGroupLabel" runat="server" CssClass="title" 
        Text="Редактирование группы"></asp:Label>
    <br />
    <br />
    <asp:Label ID="departmentListLabel" runat="server" Font-Size="Medium" 
        Text="Факультет:*"></asp:Label>
    <br />
    <asp:DropDownList ID="departmentsList" runat="server" 
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
    <asp:Label ID="groupTitleLabel" runat="server" Font-Size="Medium" 
        Text="Название:*"></asp:Label>
    <br />
    <asp:TextBox ID="titleText" runat="server" Width="270px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="titleRequiredValidator" runat="server" 
        CssClass="validation" ErrorMessage="Название" 
        ControlToValidate="titleText">Название не должно быть пустым</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="groupDescriptionLabel" runat="server" Text="Описание:"></asp:Label>
    <br />
    <asp:TextBox ID="descriptionText" runat="server" Rows="5" TextMode="MultiLine" 
        Width="270px"></asp:TextBox>
    <br />
    <asp:ValidationSummary ID="groupsValidationSummary" runat="server" 
        CssClass="validation" HeaderText="В следующих полях допущены ошибки:" />
        <br />
        <br />
    <asp:Button ID="saveGroup" runat="server" Text="Сохранить" CssClass="button" 
        onclick="saveGroup_Click" />
</asp:Content>

