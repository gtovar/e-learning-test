<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Metodist/MetodistMasterPage.master" CodeFile="TestGenerator.aspx.cs" Inherits="Metodist_TestGenerator" %>

<asp:Content ID="GeneratorMetodistPage"  ContentPlaceHolderID="metodistContentPlaceHolder" runat="server">
<asp:Label ID="metodistLabel" runat="server" Text="Генератор тестов" CssClass="title"></asp:Label>
    <div align="center">
        <br />
        <br />
        <p>Генератор тестов</p>
        <p>Надо добавить страницу UploadDocFile.aspx которая будет загружать документ Microsoft Word и тут же анализировать его. 
        В случае успешной проверки документа на ошибки на этой странице можно будет ввести настройки и сгенерировать тесты указав
        где они будут хранится в хранилище тестов.</p>
    </div>
</asp:Content>
