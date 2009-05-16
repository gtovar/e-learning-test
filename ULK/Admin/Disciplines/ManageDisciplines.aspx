<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="ManageDisciplines.aspx.cs" Inherits="Admin_Disciplines_ManageDisciplines" %>

<asp:Content ID="headManageDisciplinesPage" ContentPlaceHolderID="headAdminMasterPage"
    runat="Server">
</asp:Content>
<asp:Content ID="contentManageDisciplinesPage" ContentPlaceHolderID="adminContentPlaceHolder"
    runat="Server">
    <asp:Label ID="disciplineTitleLabel" CssClass="title" runat="server" Text="Дисциплины"></asp:Label>
    <br />
    <br />
    <table width="100%">
        <tr>
            <td width="8%">
                <asp:Label ID="departmentsListLabel" runat="server" Font-Size="Medium" Text="Факультеты:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="departmentsList" runat="server" AutoPostBack="True" DataSourceID="DepartmentsObjectDataSource"
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
            </td>
            <td></td>
        </tr>
        <tr>
            <td width="8%">
                <asp:Label ID="chairTitleLabel" runat="server" Text="Кафедры:" Font-Size="Medium"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="chairsList" runat="server" AutoPostBack="True" DataSourceID="ChairsObjectDataSource"
                    DataTextField="title" DataValueField="id" OnDataBound="chairsList_DataBound">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ChairsObjectDataSource" runat="server" DeleteMethod="Delete"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllChairsDataByDepartmentID"
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
                        <asp:ControlParameter ControlID="departmentsList" Name="department_id" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                    </asp:ObjectDataSource>
            </td>
            <td align="right">
                <asp:Button ID="addDiscipline" runat="server" Text="Добавить дисциплину" CssClass="button"
                    OnClick="addDiscipline_Click" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="chairsGridView" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="DisciplinesObjectDataSource"
        ForeColor="#333333" GridLines="None" Width="100%" CssClass="Grid">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="title" HeaderText="Название" SortExpression="title">
                <ItemStyle BackColor="#EDF5FF" Width="30%"></ItemStyle>
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/Admin/Disciplines/EditDiscipline.aspx?DisciplineID={0}"
                HeaderText="Операции" Text="Редактировать">
                <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/Admin/Disciplines/DeleteDiscipline.aspx?DisciplineID={0}"
                HeaderText="Операции" Text="Удалить">
                <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/Admin/DisciplineParts/ManageDisciplineParts.aspx?DisciplineID={0}"
                HeaderText="Операции" Text="Разделы дисциплины">
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
    <asp:ObjectDataSource ID="DisciplinesObjectDataSource" runat="server" DeleteMethod="Delete"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDisciplinesDataByDepartmentID"
        TypeName="dataSetTableAdapters.DisciplineTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="chairsList" Name="chair_id" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:ControlParameter ControlID="departmentsList" Name="department_id" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
