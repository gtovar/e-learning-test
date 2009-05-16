<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="ManageDisciplineParts.aspx.cs" Inherits="Admin_DisciplineParts_ManageDisciplineParts" %>

<asp:Content ID="headManageDisciplinePartsPage" ContentPlaceHolderID="headAdminMasterPage"
    runat="Server">
</asp:Content>
<asp:Content ID="contentManageDisciplinePartsPage" ContentPlaceHolderID="adminContentPlaceHolder"
    runat="Server">
    <asp:UpdatePanel ID="disciplinePartsUpdatePanel" runat="server">
        <ContentTemplate>
            <asp:Label ID="disciplinePartsLabel" runat="server" Text="Разделы дисциплины" CssClass="title"></asp:Label>
            <br />
            <br />
            <table width="100%">
                <tr>
                    <td width="8%">
                        <asp:Label ID="departmentsListLabel" runat="server" Text="Факультет:" Font-Size="Medium"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="departmentsList" runat="server" AutoPostBack="True" DataSourceID="DepartmentsObjectDataSource"
                            DataTextField="title" DataValueField="id" OnDataBound="departmentsList_DataBound">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td width="8%">
                        <asp:Label ID="chairsListLabel" runat="server" Font-Size="Medium" Text="Кафедра:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="chairsList" runat="server" AutoPostBack="True" DataSourceID="ChairsObjectDataSource"
                            DataTextField="title" DataValueField="id" OnDataBound="chairsList_DataBound">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td width="8%">
                        <asp:Label ID="disciplinesListLabel" runat="server" Text="Дисциплина:" Font-Size="Medium"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="disciplinesList" runat="server" AutoPostBack="True" DataSourceID="DisciplinesObjectDataSource"
                            DataTextField="title" DataValueField="id" OnDataBound="disciplinesList_DataBound">
                        </asp:DropDownList>
                    </td>
                    <td align="right">
                        <asp:Button ID="addDisciplinePart" CssClass="button" runat="server" Text="Добавить раздел дисциплины"
                            OnClick="addDisciplinePart_Click" />
                    </td>
                </tr>
            </table>
            <br />
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
            <asp:GridView ID="disciplinePartsGridView" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="DisciplinePartsObjectDataSource"
                ForeColor="#333333" GridLines="None" Width="100%" CssClass="Grid">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="title" HeaderText="Название" SortExpression="title">
                        <ItemStyle BackColor="#EDF5FF" Width="40%"></ItemStyle>
                    </asp:BoundField>
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/Admin/DisciplineParts/EditDisciplinePart.aspx?DisciplinePartID={0}"
                        HeaderText="Операции" Text="Редактировать">
                        <ItemStyle BackColor="#EDF5FF" CssClass="text_center"></ItemStyle>
                    </asp:HyperLinkField>
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/Admin/DisciplineParts/DeleteDisciplinePart.aspx?DisciplinePartID={0}"
                        HeaderText="Операции" Text="Удалить">
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
            <asp:ObjectDataSource ID="DisciplinePartsObjectDataSource" runat="server" DeleteMethod="Delete"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDisciplinePartsDataByDisciplineID"
                TypeName="dataSetTableAdapters.DisciplinePartTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="disciplinesList" Name="discipline_id" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
