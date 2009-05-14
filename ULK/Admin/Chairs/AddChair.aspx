<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddChair.aspx.cs" Inherits="Admin_Chairs_AddChair" %>

<asp:Content ID="headAddChairPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentAddChairPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="addChairLabel" runat="server" CssClass="title" 
        Text="Добавить кафедру"></asp:Label>
    <br />
    <br />
    <asp:Label ID="departmentsLabel" runat="server" Text="Факультет:*" 
        Font-Size="Medium"></asp:Label>
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
    <asp:Label ID="titleLabel" runat="server" Font-Size="Medium" Text="Название:*"></asp:Label>
    <br />
    <asp:TextBox ID="titleText" runat="server" Width="270px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="chairTitleRequiredValidator" runat="server" 
        ControlToValidate="titleText" CssClass="validation" ErrorMessage="Название">Название не должно быть пустым</asp:RequiredFieldValidator>
    <br />
    <br />
    <br />
    <asp:Label ID="chairDescriptionLabel" runat="server" Font-Size="Medium" 
        Text="Описание:"></asp:Label>
    <br />
    <asp:TextBox ID="descripitonText" runat="server" Rows="5" TextMode="MultiLine" 
        Width="270px"></asp:TextBox>
        <br /><br />
    <asp:ValidationSummary ID="chairsValidationSummary" runat="server" 
        CssClass="validation" HeaderText="В следующих полях допущены ошибки:" />
        <asp:Button ID="saveChair" runat="server" CssClass="button" 
        Text="Сохранить" onclick="saveChair_Click" />
        <br />
</asp:Content>

