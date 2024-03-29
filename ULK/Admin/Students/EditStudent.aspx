﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditStudent.aspx.cs" Inherits="Admin_Students_EditStudent" %>

<asp:Content ID="headEditStudentPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentEditStudentPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
<div width="200px">
    <div class="title">
        Редактировать информацию студента
    </div>
    <div>
    
        <br />
        <asp:Label ID="loginTitle" runat="server" Text="Логин*:" Font-Size="Medium"></asp:Label>
        <br />
        <asp:TextBox ID="loginValue" runat="server" Width="226px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="loginValidation" runat="server" 
            ControlToValidate="loginValue" ErrorMessage="Логин" 
            SetFocusOnError="True" CssClass="validation" Display="Dynamic">Логин не должен быть пустым</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="nameTitle" runat="server" Text="Полное имя*:" Font-Size="Medium"></asp:Label>
        <br />
        <asp:TextBox ID="nameValue" runat="server" Width="226px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="nameValidation" runat="server" 
            ControlToValidate="nameValue" ErrorMessage="Полное имя" 
            SetFocusOnError="True" CssClass="validation" Display="Dynamic">Имя не должно быть пустым</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="emailTitle" runat="server" Text="Email*:" Font-Size="Medium"></asp:Label>
        <br />
        <asp:TextBox ID="emailValue" runat="server" Width="226px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="emailValidation" runat="server" 
            ControlToValidate="emailValue" ErrorMessage="Email" 
            SetFocusOnError="True" CssClass="validation" Display="Dynamic"></asp:RequiredFieldValidator>
        &nbsp;<asp:RegularExpressionValidator ID="emailFormatValidation" runat="server" 
            ControlToValidate="emailValue" ErrorMessage="Email" 
            SetFocusOnError="True" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            CssClass="validation" Display="Dynamic">Формат email&#39;а должен соответствовать формату электронной почты</asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="departmentTitle" runat="server" Text="Факультет*:" 
            Font-Size="Medium"></asp:Label>
        <br />
        <asp:DropDownList ID="departmentsList" runat="server" AutoPostBack="True" 
            DataSourceID="ObjectDepartmentsDataSource" DataTextField="title" 
            DataValueField="id" ondatabound="departmentsList_DataBound">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDepartmentsDataSource" runat="server" 
            DeleteMethod="Delete" InsertMethod="Insert" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDepartmentsData" 
            TypeName="dataSetTableAdapters.DepartmentTableAdapter" 
            UpdateMethod="Update">
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
        <asp:Label ID="groupTitle" runat="server" Text="Группа*:" Font-Size="Medium"></asp:Label>
        <br />
        <asp:DropDownList ID="groupsList" runat="server" 
            DataSourceID="ObjectGroupsDataSource" DataTextField="title" DataValueField="id" 
            ondatabound="groupsList_DataBound">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectGroupsDataSource" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetAllGroupsDataByDepartmentId" 
            TypeName="dataSetTableAdapters.GroupTableAdapter" DeleteMethod="Delete" 
            UpdateMethod="Update">
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
        <asp:ValidationSummary ID="editStudentValidationSummary" runat="server" 
            CssClass="validation" HeaderText="Ошибки при заполнении следующих полей" />
        <br />
        <asp:Label ID="descriptionTitle" runat="server" Text="Характеристика:" 
            Font-Size="Medium"></asp:Label>
        <br />
        <asp:TextBox ID="descriptionValue" runat="server" Height="84px" 
            TextMode="MultiLine" Width="226px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="saveStudent" runat="server" CssClass="button" 
            onclick="saveStudent_Click" Text="Сохранить" />
    
    </div>
    </div>
</asp:Content>

