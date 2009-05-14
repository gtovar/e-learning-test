<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="AddGroup.aspx.cs" Inherits="Admin_Groups_AddGroup" %>

<asp:Content ID="headAddGroupPage" ContentPlaceHolderID="headAdminMasterPage" runat="Server">
</asp:Content>
<asp:Content ID="contentAddGroupPage" ContentPlaceHolderID="adminContentPlaceHolder"
    runat="Server">
    <asp:Label ID="addGroupLabel" runat="server" CssClass="title" Text="Добавить группу"></asp:Label>
    <br />
    <br />
    <asp:Label ID="departmentLabel" runat="server" Text="Факультет:*" Font-Size="Medium"></asp:Label>
    <br />
    <asp:DropDownList ID="departmentsList" runat="server" DataSourceID="DepartmentsObjectDataSource"
        DataTextField="title" DataValueField="id" OnDataBound="departmentsList_DataBound">
    </asp:DropDownList>
    <asp:ObjectDataSource ID="DepartmentsObjectDataSource" runat="server" DeleteMethod="Delete"
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
    <br />
    <br />
    <asp:Label ID="groupTitleLabel" runat="server" Font-Size="Medium" Text="Название:*"></asp:Label>
    <br />
    <asp:TextBox ID="titleText" runat="server" Width="270px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="titleRequiredValidator" runat="server" 
        ControlToValidate="titleText" CssClass="validation" ErrorMessage="Название">Название не должно быть пустым</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="descriptionLabel" runat="server" Font-Size="Medium" Text="Описание:"></asp:Label>
    <br />
    <asp:TextBox ID="descriptionText" runat="server" Rows="5" TextMode="MultiLine" 
        Width="270px"></asp:TextBox>
    <br />
    <asp:ValidationSummary ID="groupsValidationSummary" runat="server" 
        CssClass="validation" HeaderText="В следующих полях допущены ошибки:" />
    <br />
    <asp:Button ID="saveGroup" runat="server" Text="Сохранить" CssClass="button" 
        onclick="saveGroup_Click" />
</asp:Content>
