<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="ManageGroups.aspx.cs"
    Inherits="UnnLearningKit.Admin.Groups.ManageGroups" %>

<asp:Content ID="ManageGroupsPage" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <br />
    <asp:DropDownList ID="departmentsList" runat="server" AutoPostBack="True" DataSourceID="ObjectDepartmentsDataSource"
        DataTextField="title" DataValueField="id" 
        OnSelectedIndexChanged="departmentList_SelectedIndexChanged">
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="addGroup" 
        runat="server" Height="24px" Text="Добавить группу" 
        Width="145px" CssClass="button" 
        PostBackUrl="~/Admin/Groups/AddGroup.aspx" />
&nbsp;<asp:ObjectDataSource ID="ObjectDepartmentsDataSource" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDepartments"
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
    <asp:GridView ID="viewGroups" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None"
        BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="ObjectGroupsDataSource">
        <RowStyle BackColor="White" ForeColor="#003399" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Порядковый номер" InsertVisible="False"
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="title" HeaderText="Название" SortExpression="title" />
            <asp:BoundField DataField="description" HeaderText="Описание" SortExpression="description">
            </asp:BoundField>
            <asp:CommandField ShowEditButton="True" HeaderText="Редактировать" />
            <asp:TemplateField HeaderText="Удалить">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Удалить"
                        OnClientClick="javascript : return confirm('Вы уверены: что хотите удалить группу?');">
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="~/Admin/Students/ManageStudents.aspx?GroupID={0}" 
                HeaderText="Просмотр группы" Text="Студенты" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectGroupsDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllGroupsByDepartmentId" UpdateMethod="UpdateOnlyGroupContentField"
        DeleteMethod="DeleteOnlyGroup" TypeName="dataSetTableAdapters.GroupTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="department_id" QueryStringField="DepartmentID"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
