<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="TestsGenerator.aspx.cs" Inherits="UnnLearningKit.Testing.TestsGenerator" %>

<asp:Content ID="TestsGeneratorPage"  ContentPlaceHolderID="contentPlaceHolder" runat="server">
    Генератор тестов<br />
&nbsp;<div>
        <asp:Label ID="choosingWordDocTitle" runat="server" 
            Text="Выберите word документ:"></asp:Label>
        <br />
        <asp:FileUpload ID="UploadWordDoc" runat="server" />
        <br />
        <br />
        <asp:Label ID="templateTestTitle" runat="server" 
            Text="Введите шаблон названия теста: "></asp:Label>
        <br />
        <asp:TextBox ID="templateTitleValue" runat="server" Width="279px"></asp:TextBox>
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server">
            <asp:RadioButton ID="allowNegativePoints" runat="server" 
                Text="Разрешить отрицательные баллы" 
                GroupName="allowNegativePointsInQuestion" />
            <br />
            <asp:RadioButton ID="notAllowNegativePoints" runat="server" 
                Text="Ограничить число выбираемых ответов" 
                GroupName="allowNegativePointsInQuestion" />
        </asp:Panel>
        <br />
        <asp:Button ID="generateQuestions" runat="server" CssClass="button" 
            onclick="generateQuestions_Click" Text="Обработать документ" />
        <br />
        
    </div>
</asp:Content>