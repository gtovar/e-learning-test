﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Metodist/MetodistMasterPage.master" AutoEventWireup="true" CodeFile="EditTest.aspx.cs" Inherits="Metodist_EditTest" %>

<asp:Content ID="contentEditDisciplinePartTestPage" ContentPlaceHolderID="metodistContentPlaceHolder" Runat="Server">
<asp:UpdatePanel ID="editDisciplinePartTestUpdatePanel" runat="server">
        <ContentTemplate>
            <asp:Label ID="editDisciplinePartLabel" runat="server" 
                Text="Редактировать тест" CssClass="title"></asp:Label>
            <br />
            <br />
            <asp:Label ID="departmentsListLabel" runat="server" Font-Size="Medium" 
                Text="Факультет:*"></asp:Label>
            <br />
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
            <br />
            <br />
            <asp:Label ID="chairsListLabel" runat="server" Font-Size="Medium" 
                Text="Кафедра:*"></asp:Label>
            <br />
            <asp:DropDownList ID="chairsList" runat="server" AutoPostBack="True" 
                DataSourceID="ChairsObjectDataSource" DataTextField="title" 
                DataValueField="id" ondatabound="chairsList_DataBound">
            </asp:DropDownList>
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
            <br />
            <asp:Label ID="disciplinesListLabel" runat="server" Font-Size="Medium" 
                Text="Дисциплина:*"></asp:Label>
            <br />
            <asp:DropDownList ID="disciplinesList" runat="server" AutoPostBack="True" 
                DataSourceID="DisciplinesObjectDataSource" DataTextField="title" 
                DataValueField="id" ondatabound="disciplinesList_DataBound">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="DisciplinesObjectDataSource" runat="server" 
                DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllDisciplinesDataByDepartmentID" 
                TypeName="dataSetTableAdapters.DisciplineTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="chairsList" Name="chair_id" 
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="departmentsList" Name="department_id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Size="Medium" 
                Text="Раздел:*"></asp:Label>
            <br />
            <asp:DropDownList ID="disciplinePartsList" runat="server" 
                DataSourceID="DisciplinePartsObjectDataSource" DataTextField="title" 
                DataValueField="id" ondatabound="disciplinePartsList_DataBound">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="DisciplinePartsObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetAllDisciplinePartsDataByDisciplineID" 
                TypeName="dataSetTableAdapters.DisciplinePartTableAdapter" 
                DeleteMethod="Delete" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="disciplinesList" Name="discipline_id" PropertyName="SelectedValue"
                        Type="Int32" DefaultValue="" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
            <br />
                <asp:Button ID="saveDisciplinePart" runat="server" CssClass="button" 
                onclick="saveDisciplinePart_Click" Text="Сохранить" />
                <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>