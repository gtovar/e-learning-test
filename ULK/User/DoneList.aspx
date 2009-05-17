<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User/UserMasterPage.master" CodeFile="DoneList.aspx.cs" Inherits="User_DoneList" %>

<asp:Content ID="DoneUserPage"  ContentPlaceHolderID="userContentPlaceHolder" runat="server">
<asp:Label ID="studentsLabel" runat="server" Text="Выполненные тесты" CssClass="title"></asp:Label>
<br />
<br />
    <asp:Label ID="Label1" runat="server" Text="Дисциплина:" Font-Size="Medium"></asp:Label>
    <asp:DropDownList ID="disciplinesList" runat="server" AutoPostBack="True" DataSourceID="DisciplinesObjectDataSource"
        DataTextField="DisciplineTitle" DataValueField="DisciplineID" 
        OnDataBound="disciplinesList_DataBound" 
        ondatabinding="disciplinesList_DataBinding">
    </asp:DropDownList>
    <br />
    <br />
    <asp:ObjectDataSource ID="DisciplinesObjectDataSource" runat="server"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dataSetTableAdapters.StudentTestsDisciplinesTableAdapter">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="is_completed" Type="Byte" />
            <asp:ControlParameter ControlID="userLoginHidden" DefaultValue="" Name="login" 
                PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="DoneTestsObjectDataSource" runat="server"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dataSetTableAdapters.StudentTestsTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="userLoginHidden" DefaultValue="" Name="login" 
                PropertyName="Value" Type="String" />
            <asp:Parameter DefaultValue="1" Name="is_completed" Type="Byte" />
            <asp:ControlParameter ControlID="disciplinesList" DefaultValue="" Name="discipline_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="userLoginHidden" runat="server" />
    <asp:GridView ID="newTestsGridView" runat="server" 
                AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="CurrentTestID" DataSourceID="DoneTestsObjectDataSource"
                ForeColor="#333333" GridLines="None" Width="100%" CssClass="Grid">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="TestVariantTitle" HeaderText="Название" 
                        SortExpression="title" >
                    <ItemStyle BackColor="#EDF5FF" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Оценка" DataField="CurrentTestScore" >
                    <ItemStyle BackColor="#EDF5FF" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
</asp:Content>

