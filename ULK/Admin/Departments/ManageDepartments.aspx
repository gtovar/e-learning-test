﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="ManageDepartments.aspx.cs" Inherits="Admin_Departments_ManageDepartments" %>

<asp:Content ID="headManageDepartmentsPage" ContentPlaceHolderID="headAdminMasterPage"
    runat="Server">
</asp:Content>
<asp:Content ID="contentManageDepartmentsPage" ContentPlaceHolderID="adminContentPlaceHolder"
    runat="Server">
    <br />
        <table width="100%"><tr><td>
        <asp:Label ID="departmentsLabel" runat="server" CssClass="title" Text="Факультеты"></asp:Label>
</td>
<td align="right" valign="bottom">
        <asp:Button ID="addDepartment" runat="server" CssClass="button" 
            Text="Добавить факультет" 
            PostBackUrl="~/Admin/Departments/AddDepartments.aspx" />
    </td></tr></table>
<br />
    <asp:GridView ID="departmentsGridView" runat="server" CellPadding="4" DataSourceID="DepartmentsObjectDataSource"
        ForeColor="#333333" GridLines="None" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False"
        DataKeyNames="id" BackColor="#EDF5FF" Width="100%" CssClass="Grid">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="title" HeaderText="Название" SortExpression="title">
                <ItemStyle BackColor="#EDF5FF"></ItemStyle>
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="~/Admin/Departments/EditDepartment.aspx?DepartmentID={0}" 
                HeaderText="Операции" Text="Редактировать" >
                <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="~/Admin/Departments/DeleteDepartment.aspx?DepartmentID={0}" 
                HeaderText="Операции" Text="Удалить" >
                <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/Admin/Groups/ManageGroups.aspx?DepartmentID={0}"
                HeaderText="Группы" Text="Группы" >
                <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="~/Admin/Chairs/ManageChairs.aspx?DepartmentID={0}" 
                HeaderText="Кафедры" Text="Кафедры" >
                <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
            </asp:HyperLinkField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
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
</asp:Content>
