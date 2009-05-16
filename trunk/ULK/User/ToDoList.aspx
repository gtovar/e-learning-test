<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User/UserMasterPage.master" CodeFile="ToDoList.aspx.cs" Inherits="User_ToDoList" %>

<asp:Content ID="ToDoUserPage"  ContentPlaceHolderID="userContentPlaceHolder" runat="server">
<asp:Label ID="studentsLabel" runat="server" Text="Назначенные тесты" CssClass="title"></asp:Label>
<br />
<br />
    <asp:Label ID="Label1" runat="server" Text="Дисциплина:" Font-Size="Medium"></asp:Label>
    <asp:DropDownList ID="disciplinesList" runat="server" AutoPostBack="True" DataSourceID="DisciplinesObjectDataSource"
        DataTextField="DisciplineTitle" DataValueField="DisciplineID" 
        OnDataBound="disciplinesList_DataBound">
    </asp:DropDownList>
    <br />
    <br />
    <asp:ObjectDataSource ID="DisciplinesObjectDataSource" runat="server"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dataSetTableAdapters.StudentTestsDisciplinesTableAdapter">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="is_completed" Type="Byte" />
            <asp:ControlParameter ControlID="userLoginHidden" DefaultValue="" Name="login" 
                PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="NewTestsObjectDataSource" runat="server"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dataSetTableAdapters.StudentTestsTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="userLoginHidden" DefaultValue="" Name="login" 
                PropertyName="Value" Type="String" />
            <asp:Parameter DefaultValue="0" Name="is_completed" Type="Byte" />
            <asp:ControlParameter ControlID="disciplinesList" DefaultValue="" Name="discipline_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="userLoginHidden" runat="server" />
    <asp:GridView ID="newTestsGridView" runat="server" 
                AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="CurrentTestID" DataSourceID="NewTestsObjectDataSource"
                ForeColor="#333333" GridLines="None" Width="100%" CssClass="Grid">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="TestVariantTitle" HeaderText="Название" 
                        SortExpression="title" />
                    <asp:ButtonField HeaderText="Действие" Text="Начать выполнение" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
</asp:Content>
