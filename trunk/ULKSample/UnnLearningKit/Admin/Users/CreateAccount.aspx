<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="CreateAccount.aspx.cs" Inherits="UnnLearningKit.Register" %>

<asp:Content ID="RegisterPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:CreateUserWizard ID="createUserWizard" runat="server" 
        BackColor="#E3EAEB" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px" 
        Font-Names="Verdana" Font-Size="0.8em" 
        oncreateduser="createUserWizard_CreatedUser" 
    CreateUserButtonText="Создать учетную запись" >
        <SideBarStyle BackColor="#1C5E55" Font-Size="0.9em" VerticalAlign="Top" />
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
            <asp:CreateUserWizardStep runat="server" >
                <ContentTemplate>
                    <table border="0">
                        <tr>
                            <td align="center" colspan="2">
                                <div class="title">Новая учетная запись</div>
                                * отменчены обязательные для заполнения поля</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Логин:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" 
                                    ErrorMessage="Поле &quot;Имя пользователя&quot; является обязательным." 
                                    ToolTip="Поле &quot;Имя пользователя&quot; является обязательным." 
                                    ValidationGroup="createUserWizard">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Пароль:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" 
                                    ErrorMessage="Поле &quot;Пароль&quot; является обязательным." 
                                    ToolTip="Поле &quot;Пароль&quot; является обязательным." 
                                    ValidationGroup="createUserWizard">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                    AssociatedControlID="ConfirmPassword">Подтвердите пароль:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" 
                                    ErrorMessage="Поле &quot;Подтвердите пароль&quot; является обязательным." 
                                    ToolTip="Поле &quot;Подтвердите пароль&quot; является обязательным." 
                                    ValidationGroup="createUserWizard">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Электронная почта:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                    ControlToValidate="Email" 
                                    ErrorMessage="Поле &quot;Электронная почта&quot; является обязательным." 
                                    ToolTip="Поле &quot;Электронная почта&quot; является обязательным." 
                                    ValidationGroup="createUserWizard">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Защитный вопрос:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                    ControlToValidate="Question" 
                                    ErrorMessage="Защитный вопрос является обязательным." 
                                    ToolTip="Защитный вопрос является обязательным." 
                                    ValidationGroup="createUserWizard">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Защитный ответ:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                    ControlToValidate="Answer" ErrorMessage="Защитный ответ является обязательным." 
                                    ToolTip="Защитный ответ является обязательным." 
                                    ValidationGroup="createUserWizard">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                        <td align="right">
                             <asp:Label ID="roleLabel" runat="server" AssociatedControlID="rolesList">Группа прав:</asp:Label>
                        </td>
                        <td>
                        
                            <asp:DropDownList ID="rolesList" runat="server" 
                                DataSourceID="ObjectRolesDataSource" DataTextField="RoleName" 
                                DataValueField="RoleId" >
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectRolesDataSource" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllRoles" 
                                TypeName="dataSetTableAdapters.RolesTableAdapter"></asp:ObjectDataSource>
                        
                        </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" 
                                    ErrorMessage="Значения &quot;Пароль&quot; и &quot;Подтвердите пароль&quot; должны совпадать." 
                                    ValidationGroup="createUserWizard"></asp:CompareValidator>
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
                            <td align="center" colspan="2" 
                                style="color:White;background-color:#1C5E55;font-weight:bold;">
                                Спасибо</td>
                        </tr>
                        <tr>
                            <td align="center">
                                <p><b>Учетная запись создана</b></p></td>
                        </tr>
                        <tr>
                        <td colspan="2">
        <asp:Button ID="redirectToCreateAccount" runat="server" CssClass="button" 
            onclick="redirectToCreateAccount_Click" Text="Добавить еще" />
&nbsp;<asp:Button ID="redirectToManageAccounts" runat="server" CssClass="button" 
            Text="Перейти на управление учетными записями" onclick="redirectToManageAccounts_Click" />
        <br />
                        </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>