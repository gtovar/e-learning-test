<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditDisciplinePart.aspx.cs" Inherits="Admin_DisciplineParts_EditDisciplinePart" %>

<asp:Content ID="headEditDisciplinePartPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentEditDisciplinePartPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
<asp:UpdatePanel ID="editDisciplinePartsUpdatePanel" runat="server">
        <ContentTemplate>
            <asp:Label ID="editDisciplinePartLabel" runat="server" 
                Text="Редактировать раздел дисциплины" CssClass="title"></asp:Label>
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
            <asp:Label ID="chairsListLabel" runat="server" Font-Size="Medium" 
                Text="Кафедра:*"></asp:Label>
            <br />
            <asp:DropDownList ID="chairsList" runat="server" AutoPostBack="True" 
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
            <asp:Label ID="disciplinesListLabel" runat="server" Font-Size="Medium" 
                Text="Дисциплина:*"></asp:Label>
            <br />
            <asp:DropDownList ID="disciplinesList" runat="server" 
                DataSourceID="DisciplinesObjectDataSource" DataTextField="title" 
                DataValueField="id" ondatabound="disciplinesList_DataBound">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="DisciplinesObjectDataSource" runat="server" 
                DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllDisciplinesDataByDepartmentID" 
                TypeName="dataSetTableAdapters.DisciplineTableAdapter" UpdateMethod="Update">
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
            <br />
            <br />
            <asp:Label ID="disciplineTitleLabel" runat="server" Font-Size="Medium" 
                Text="Название:*"></asp:Label>
            <br />
            <asp:TextBox ID="titleText" runat="server" Width="270px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="disciplinePartTitleRequiredValidator" 
                runat="server" ErrorMessage="Название" ControlToValidate="titleText" 
                CssClass="validation">Название не должно быть пустым</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:ValidationSummary ID="disciplinePartsValidationSummary" runat="server" 
                CssClass="validation" HeaderText="В следующих полях допущены ошибки:" />
                <asp:Button ID="saveDisciplinePart" runat="server" CssClass="button" 
                onclick="saveDisciplinePart_Click" Text="Сохранить" />
                <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

