<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="ManageGroups.aspx.cs" Inherits="Admin_Groups_ManageGroups" %>

<asp:Content ID="headManageGroupsPage" ContentPlaceHolderID="headAdminMasterPage"
    runat="Server">
</asp:Content>
<asp:Content ID="contentManageGroupsPage" ContentPlaceHolderID="adminContentPlaceHolder"
    runat="Server">
    <asp:Label ID="groupLabel" runat="server" CssClass="title" Text="Группы"></asp:Label>
    <br />
    <br />
    <div style="width: 100%">
        <div style="float: left">
                <asp:Label ID="choosingDepartmentLabel" runat="server" Text="Факультет:" Font-Size="Medium"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="departmentsList" runat="server" AutoPostBack="True" DataSourceID="DepartmentsObjectDataSource"
            DataTextField="title" DataValueField="id" ondatabound="departmentsList_DataBound">
        </asp:DropDownList>
        </div>
        <div style="float: right">
            <asp:Button ID="addGroup" runat="server" Text="Добавить группу" 
                CssClass="button" onclick="addGroup_Click" />
        </div>
    </div>
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
    <asp:GridView ID="groupsGridView" runat="server" CellPadding="4" ForeColor="#333333"
        GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
        DataKeyNames="id" DataSourceID="GroupsObjectDataSource" Width="100%">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="title" HeaderText="Название" SortExpression="title">
                <ItemStyle BackColor="#EDF5FF"  Width="20%" CssClass="text_center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="description" HeaderText="Описание" SortExpression="description">
                <ItemStyle BackColor="#EDF5FF" Width="45%"></ItemStyle>
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="~/Admin/Groups/EditGroup.aspx?GroupID={0}" 
                HeaderText="Операции" Text="Правка" >
                <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="~/Admin/Groups/DeleteGroup.aspx?GroupID={0}" 
                HeaderText="Операции" Text="Удалить" >
                <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="~/Admin/Students/ManageStudents.aspx?GroupID={0}" 
                HeaderText="Студенты" Text="Студенты" >
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
    <asp:ObjectDataSource ID="GroupsObjectDataSource" runat="server" DeleteMethod="Delete"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllGroupsDataByDepartmentId"
        TypeName="dataSetTableAdapters.GroupTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="departmentsList" Name="department_id" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
</asp:Content>
