<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditChair.aspx.cs" Inherits="Admin_Chairs_EditChair" %>

<asp:Content ID="headEditChairPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentEditChairPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="chairTitleLabel" runat="server" CssClass="title" 
        Text="Редактировать кафедру"></asp:Label>
    <br />
    <br />
    <asp:Label ID="departmentsListLabel" runat="server" Font-Size="Medium" 
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
    <asp:Label ID="titleLabel" runat="server" Text="Название:*" Font-Size="Medium"></asp:Label>
    <br />
    <asp:TextBox ID="titleText" runat="server" Width="270px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="chairTitleRequiredValidator" runat="server" 
        ErrorMessage="Название" ControlToValidate="titleText" 
        CssClass="validation">Название не должно быть пустым</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="chairDescriptionLabel" runat="server" Font-Size="Medium" 
        Text="Описание:"></asp:Label>
    <br />
    <asp:TextBox ID="descriptionText" runat="server" Rows="5" TextMode="MultiLine" 
        Width="270px"></asp:TextBox>
    <br />
    <asp:ValidationSummary ID="chairValidationSummary" runat="server" 
        CssClass="validation" HeaderText="В следующих полях допущены ошибки:" />
        <br />
        <br />
    <asp:Button ID="saveChair" runat="server" Text="Сохранить" CssClass="button" 
        onclick="saveChair_Click" />
</asp:Content>

