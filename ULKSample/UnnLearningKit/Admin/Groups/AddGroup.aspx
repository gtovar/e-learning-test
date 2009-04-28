<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddGroup.aspx.cs" MasterPageFile="~/Main.Master" Inherits="UnnLearningKit.Admin.Groups.AddGroup" %>

<asp:Content ID="AddGroupPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <h2>
        <asp:Label ID="headerText" runat="server" Text="Добавить группу"></asp:Label>
    </h2>
    <div>
        <p>
        <asp:Label ID="groupStatus" runat="server" CssClass="hideMessage" />
        </p>
        <asp:Label ID="titleText" runat="server" Text="Название*"></asp:Label>
        <br />
        <asp:TextBox ID="titleValue" runat="server" Width="240px"></asp:TextBox>
        <br />
        <asp:Label ID="departmentText" runat="server" Text="Факультет*"></asp:Label>
        <br />
        <asp:DropDownList ID="departmentList" runat="server" 
            DataSourceID="ObjectDepartmentDataSource" DataTextField="title" 
            DataValueField="id">
        </asp:DropDownList>
        <br />
        <asp:ObjectDataSource ID="ObjectDepartmentDataSource" runat="server" 
            DeleteMethod="Delete" InsertMethod="Insert" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDepartments" 
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
        <asp:Label ID="descriptionText" runat="server" Text="Краткое описание"></asp:Label>
        <br />
        <asp:TextBox ID="descriptionValue" runat="server" Width="240px" Height="100px" 
            Rows="5" TextMode="MultiLine"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="saveGroup" runat="server" onclick="saveGroup_Click" 
            Text="Сохранить" />
        &nbsp;
        <asp:Button ID="cancelSaveGroup" runat="server" onclick="cancelSaveGroup_Click" 
            Text="Отмена" />
        <br />
    </div>
</asp:Content>