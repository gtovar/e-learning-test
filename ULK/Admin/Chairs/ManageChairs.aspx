<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageChairs.aspx.cs" Inherits="Admin_Chairs_ManageChairs" %>

<asp:Content ID="headManageChairsPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentManageChairsPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:Label ID="chairsLabel" runat="server" CssClass="title" Text="Кафедры"></asp:Label>
    <br />
    <br />
    <table width="100%"><tr><td width="8%">
    <asp:Label ID="departmentLabel" Font-Size="Medium" runat="server" Text="Факультет:"></asp:Label>
    </td>
    <td>
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
    </td>
    <td align="right" valign="bottom">
        <asp:Button ID="addChair" CssClass="button" runat="server" 
            Text="Добавить кафедру" onclick="addChair_Click" /></div>
</td></tr></table>
    <br />
    <asp:GridView Width="100%" ID="chairsGridView" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="id" DataSourceID="ChairsObjectDataSource" ForeColor="#333333" 
        GridLines="None" CssClass="Grid">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="title" HeaderText="Название" 
                SortExpression="title" >
            <ItemStyle BackColor="#EDF5FF"  Width="30%"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="description" HeaderText="Описание" 
                SortExpression="description" >
            <ItemStyle BackColor="#EDF5FF"  Width="30%"></ItemStyle>
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="~/Admin/Chairs/EditChair.aspx?ChairID={0}" 
                HeaderText="Операции" Text="Редактировать" >            
             <ItemStyle BackColor="#EDF5FF"  CssClass="text_center"></ItemStyle>
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="~/Admin/Chairs/DeleteChair.aspx?ChairID={0}" 
                HeaderText="Операции" Text="Удалить" >            
             <ItemStyle BackColor="#EDF5FF"  CssClass="text_center"></ItemStyle>
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="~/Admin/Disciplines/ManageDisciplines.aspx?ChairID={0}" 
                HeaderText="Дисциплины" Text="Дисциплины" >            
             <ItemStyle BackColor="#EDF5FF"  CssClass="text_center"></ItemStyle>
            </asp:HyperLinkField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
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
</asp:Content>

