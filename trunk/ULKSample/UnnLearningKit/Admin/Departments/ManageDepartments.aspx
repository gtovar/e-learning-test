<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="ManageDepartments.aspx.cs"
    Inherits="UnnLearningKit.Admin.ManageDepartments" %>

<asp:Content ID="ManageDepartmentsPage" ContentPlaceHolderID="contentPlaceHolder"
    runat="server">
    <h2>
        Добавить факультет</h2>
    <div>
        <p>
        <asp:Label ID="departmentStatus" runat="server" CssClass="hideMessage" />
        </p>
        <asp:TextBox ID="departmentTitle" runat="server" Width="306px"></asp:TextBox>
        &nbsp;<asp:Button ID="addDepartment" runat="server" OnClick="addDepartment_Click"
            Text="Добавить" />
        <br />
    </div>
    <h2>
        Все факультеты</h2>
    <asp:GridView ID="viewDepartments" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None"
        BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="objectDepartmentDataSource"
        GridLines="Vertical">
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="title" HeaderText="Название факультета" SortExpression="title" />
            <asp:BoundField DataField="id" HeaderText="Номер" InsertVisible="False" ReadOnly="True"
                SortExpression="id" />
            <asp:CommandField ShowEditButton="True" HeaderText="Операции" />
            <asp:TemplateField HeaderText="Операции">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Удалить"
                        OnClientClick="javascript : return confirm('Вы уверены: что хотите удалить факультет?');">
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField HeaderText="Операции" NavigateUrl="~/Admin/Chairs/ManageChairs.aspx"
                Text="Добавить кафедру" />
            <asp:HyperLinkField HeaderText="Операции" NavigateUrl="~/Admin/Disciplines/ManageDisciplines.aspx"
                Text="Добавить дисциплину" />
            <asp:HyperLinkField HeaderText="Операции" NavigateUrl="~/Admin/Groups/ManageGroups.aspx"
                Text="Добавить группу" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#DCDCDC" />
    </asp:GridView>
    <asp:ObjectDataSource ID="objectDepartmentDataSource" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllSorterDepartments"
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
