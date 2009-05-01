<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageStudents.aspx.cs" MasterPageFile="~/Main.Master" Inherits="UnnLearningKit.Admin.Students.ManageStudents" %>

<asp:Content ID="ManageStudentsPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <br />
    <asp:DropDownList ID="groupsList" runat="server" AutoPostBack="True" 
        DataSourceID="ObjectGroupsDataSource" DataTextField="title" DataValueField="id" 
        onselectedindexchanged="groupsList_SelectedIndexChanged">
    </asp:DropDownList>
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="addStudent" runat="server" Height="22px" 
        onclick="addStudent_Click" Text="Добавить студента" CssClass="button" />
&nbsp;<asp:ObjectDataSource ID="ObjectGroupsDataSource" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetAllGroupsAtDepartmentByGroupId" 
        TypeName="dataSetTableAdapters.GroupTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="group_id" 
                QueryStringField="GroupID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <br />
    <asp:GridView ID="viewStudents" runat="server" 
        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="id" DataSourceID="ObjectStudentsDataSource">
        <RowStyle BackColor="White" ForeColor="#003399" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Порядковый номер" 
                InsertVisible="False" ReadOnly="True" SortExpression="id" />
           <asp:BoundField DataField="login" HeaderText="Логин" 
                SortExpression="login" />
            <asp:BoundField DataField="email" HeaderText="Email" 
                SortExpression="email" />
            <asp:BoundField DataField="name" HeaderText="Полное имя" 
                SortExpression="name" />
            <asp:BoundField DataField="description" HeaderText="Характеристика" 
                SortExpression="description" />
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="EditStudent.aspx?StudentID={0}" 
                HeaderText="Редактировать" Text="Редактировать" />
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="DeleteStudent.aspx?StudentID={0}" 
                HeaderText="Удалить" Text="Удалить" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectStudentsDataSource" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetOnlyStudentContentField" 
        TypeName="UnnLearningKit.App_Code.dataSetTableAdapters.StudentTableAdapter" >
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="group_id" 
                QueryStringField="GroupID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
&nbsp;
</asp:Content>
