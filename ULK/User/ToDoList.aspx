<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User/UserMasterPage.master" CodeFile="ToDoList.aspx.cs" Inherits="User_ToDoList" %>

<asp:Content ID="ToDoUserPage"  ContentPlaceHolderID="userContentPlaceHolder" runat="server">

<script type="text/javascript">
    function OpenTraining(strOrgOrAtt) {
        var a;
        if ((a = strOrgOrAtt.match(/^Org:([0-9]+)$/)) != null) {
            var args = new Object;
            args.OrganizationId = a[1];
            args.OnAttemptCreated = OnAttemptCreated;
            ShowDialog("CreateAttempt.aspx", args, 450, 250, false);
        }
    }

    function OnAttemptCreated(strOrganizationId, strAttemptId) {
        OpenFrameset(strAttemptId);
    }

    function OpenFrameset(strAttemptId) {
        window.open("../Frameset/Frameset.aspx?View=0&AttemptId=" + strAttemptId, "_blank");
    }

    function ShowDialog(strUrl, args, cx, cy, fScroll) {
        var useShowModalDialog = false;
        var strScroll = fScroll ? "yes" : "no";
        if (useShowModalDialog) {
            showModalDialog(strUrl, args,
				    "dialogWidth: " + cx + "px; dialogHeight: " + cy +
					"px; center: yes; resizable: yes; scroll: " + strScroll + ";");
        }
        else {
            dialogArguments = args;
            var x = Math.max(0, (screen.width - cx) / 2);
            var y = Math.max(0, (screen.height - cy) / 2);
            window.open(strUrl, "_blank", "left=" + x + ",top=" + y +
					",width=" + cx + ",height=" + cy +
					",location=no,menubar=no,scrollbars=" + strScroll +
					",status=no,toolbar=no,resizable=yes");
        }
    }
</script>

<asp:Label ID="studentsLabel" runat="server" Text="Назначенные тесты" CssClass="title"></asp:Label>
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
                    <asp:TemplateField HeaderText="Действие">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                NavigateUrl='<%# Eval("CurrentTestID", "javascript:OpenTraining(&#039;Org:{0}&#039;)") %>' 
                                Text="Начать выполнение"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
</asp:Content>
