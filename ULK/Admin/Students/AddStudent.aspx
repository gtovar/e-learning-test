﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddStudent.aspx.cs" Inherits="Admin_Students_AddStudent" %>

<asp:Content ID="headAddStudentPage" ContentPlaceHolderID="headAdminMasterPage" Runat="Server">
</asp:Content>
<asp:Content ID="contentAddStudentPage" ContentPlaceHolderID="adminContentPlaceHolder" Runat="Server">
    <asp:UpdatePanel ID="addStudentUpdatePanel" runat="server">
    <ContentTemplate>
    <br />
    <br />
    <br />
    <br />
    <div align="center" style="vertical-align:middle">
<asp:CreateUserWizard ID="createStudent" runat="server" BackColor="#EDF5FF" 
        BorderColor="#B5C7DE" BorderStyle="Solid" BorderWidth="1px" 
        Font-Names="Verdana" Font-Size="1.0em" 
        CreateUserButtonText="Добавить студента" 
        oncreateduser="createStudent_CreatedUser" LoginCreatedUser="False">
        <SideBarStyle BackColor="#1C5E55" Font-Size="0.9em" VerticalAlign="Middle" HorizontalAlign="Center" />
        <SideBarButtonStyle ForeColor="White" />
        <ContinueButtonStyle BackColor="White" BorderColor="#C5BBAF" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#1C5E55" />
        <NavigationButtonStyle BackColor="White" BorderColor="#C5BBAF" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#1C5E55" />
        <HeaderStyle BackColor="#666666" BorderColor="#E6E2D8" BorderStyle="Solid" 
            BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="White" 
            HorizontalAlign="Center" />
        <CreateUserButtonStyle BackColor="White" BorderColor="#C5BBAF" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#1C5E55" />
        <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <StepStyle BorderWidth="0px" />
        <WizardSteps>
            <asp:CreateUserWizardStep ID="createStudentWizardStep" runat="server">
                <ContentTemplate>
                    <table border="0">
                        <tr>
                            <td align="center" colspan="2">
                                <div class="title">Добавить студента</div>
                                * отмечены обязательные для заполнения поля</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Логин*:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server" Width="200px" Text="petrov.p.p"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" 
                                    ErrorMessage="Поле &quot;Логин&quot; является обязательным." 
                                    ToolTip="Поле &quot;Логин&quot; является обязательным." 
                                    ValidationGroup="createStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="FullUserNameLabel" runat="server" AssociatedControlID="FullUserName">Полное имя*:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="FullUserName" runat="server" Width="200px">Петров П.П.</asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="FullUserName" 
                                    ErrorMessage="Поле &quot;Полное имя&quot; является обязательным." 
                                    ToolTip="Поле &quot;Полное имя&quot; является обязательным." 
                                    ValidationGroup="createStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Пароль*:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="200px">Qwerty_123</asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" 
                                    ErrorMessage="Поле &quot;Пароль&quot; является обязательным." 
                                    ToolTip="Поле &quot;Пароль&quot; является обязательным." 
                                    ValidationGroup="createStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                    AssociatedControlID="ConfirmPassword">Подтвердите пароль*:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" 
                                    Width="200px">Qwerty_123</asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" 
                                    ErrorMessage="Поле &quot;Подтвердите пароль&quot; является обязательным." 
                                    ToolTip="Поле &quot;Подтвердите пароль&quot; является обязательным." 
                                    ValidationGroup="createStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Электронная почта*:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                    ControlToValidate="Email" 
                                    ErrorMessage="Поле &quot;Электронная почта&quot; является обязательным." 
                                    ToolTip="Поле &quot;Электронная почта&quot; является обязательным." 
                                    ValidationGroup="createStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Защитный вопрос*:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Question" runat="server" Width="200px">Номер вашей группы?</asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                    ControlToValidate="Question" 
                                    ErrorMessage="Защитный вопрос является обязательным." 
                                    ToolTip="Защитный вопрос является обязательным." 
                                    ValidationGroup="createStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Защитный ответ*:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Answer" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                    ControlToValidate="Answer" ErrorMessage="Защитный ответ является обязательным." 
                                    ToolTip="Защитный ответ является обязательным." 
                                    ValidationGroup="createStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                             <asp:Label ID="departmentLabel" runat="server" AssociatedControlID="departmentsList">Факультет*:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="departmentsList" runat="server" 
                                    DataSourceID="ObjectDepartmentsDataSource" DataTextField="title" 
                                    DataValueField="id"
                                    AutoPostBack="True" ondatabound="departmentsList_DataBound">
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
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                             <asp:Label ID="groupLabel" runat="server" AssociatedControlID="groupsList">Группа*:</asp:Label>
                            </td>
                            <td>
                            <asp:DropDownList ID="groupsList" runat="server" 
                                DataSourceID="ObjectGroupsDataSource" DataTextField="title" 
                                DataValueField="id" AutoPostBack="True" ondatabound="groupsList_DataBound" 
                                    onselectedindexchanged="groupsList_SelectedIndexChanged" >
                            </asp:DropDownList>
                                        <asp:ObjectDataSource ID="ObjectGroupsDataSource" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetAllGroupsDataByDepartmentId" 
                                            TypeName="dataSetTableAdapters.GroupTableAdapter" 
                                    DeleteMethod="Delete" UpdateMethod="Update">
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
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="DescriptionLabel" runat="server" AssociatedControlID="Description">Характеристика:</asp:Label>
                            </td>
                            <td>
                            
                                <asp:TextBox ID="Description" runat="server" Height="61px" TextMode="MultiLine" 
                                    Width="200px"></asp:TextBox>
                            
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" 
                                    ErrorMessage="Значения &quot;Пароль&quot; и &quot;Подтвердите пароль&quot; должны совпадать." 
                                    ValidationGroup="createStudent"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep runat="server" >
                <ContentTemplate>
                    <table border="0" style="font-family:Verdana;font-size:100%;">

                        <tr>
                            <td align="center">
                                <div class="title">Спасибо, студент добавлен!!!</div></td>
                        </tr>
                        <tr>
                        <td colspan="2">
&nbsp;<asp:Button ID="redirectToManageStudents" runat="server" CssClass="button" 
            Text="Перейти на управление студентами" onclick="redirectToManageStudents_Click" />
        <br />
                        </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

