<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User/UserMasterPage.master" CodeFile="ToDoList.aspx.cs" Inherits="User_ToDoList" %>

<asp:Content ID="ToDoUserPage"  ContentPlaceHolderID="userContentPlaceHolder" runat="server">

<script type="text/javascript">
    function OpenTraining(strOrgOrAtt) {
        // open training content; <strOrgOrAtt> is either of the form "Org:<organizationId>"
        // (for content that has not been launched yet) or "Att:<attemptId>" for content that's
        // previously been launched -- in the former case we need to create an attempt for the
        // content...
        var a;
        if ((a = strOrgOrAtt.match(/^Org:([0-9]+)$/)) != null) {
            // display the dialog to create an attempt on this organization; if the attempt is
            // successfully created, OnAttemptCreated() will be called from the the dialog to
            // update TrainingGrid and display the training
            var args = new Object;
            args.OrganizationId = a[1];
            args.OnAttemptCreated = OnAttemptCreated;
            ShowDialog("CreateAttempt.aspx", args, 450, 250, false);
        }
        else
            if ((a = strOrgOrAtt.match(/^Att:([0-9]+)$/)) != null) {
            // open training in a new window
            OpenFrameset(a[1]);
        }
    }

    function OnAttemptCreated(strOrganizationId, strAttemptId) {
        // called after CreateAttempt.aspx has successfully created an attempt; update the
        // anchor tag to include the attempt number, then open the frameset
      //  var anchor = document.all["Org_" + strOrganizationId];
      //  anchor.href = "javascript:OpenTraining('Att:" + strAttemptId + "')";
      //  anchor.title = "Continue training";
      //  anchor.parentElement.parentElement.cells[3].innerHTML =
		//	    "<A href=\"javascript:ShowLog(" + strAttemptId + ")\" title=\"Show Log\">Active</A>";
        OpenFrameset(strAttemptId);
    }

    function OpenFrameset(strAttemptId) {
        // open the frameset for viewing training content; <strAttemptId> is the attempt ID
        window.open("../Frameset/Frameset.aspx?View=0&AttemptId=" + strAttemptId, "_blank");
    }

    function ShowDialog(strUrl, args, cx, cy, fScroll) {
        // display a dialog box with URL <strUrl>, arguments <args>, width <cx>, height <cy>,
        // scrollbars if <fScroll>; this can be done using either showModalDialog() or
        // window.open(): the former has better modal behavior; the latter allows selection
        // within the window
        var useShowModalDialog = false;
        var strScroll = fScroll ? "yes" : "no";
        if (useShowModalDialog) {
            showModalDialog(strUrl, args,
				    "dialogWidth: " + cx + "px; dialogHeight: " + cy +
					"px; center: yes; resizable: yes; scroll: " + strScroll + ";");
        }
        else {
            dialogArguments = args; // global variable accessed by dialog
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
    <asp:HiddenField ID="userLoginHidden" runat="server" 
        ondatabinding="userLoginHidden_DataBinding" />
    <asp:GridView ID="newTestsGridView" runat="server" 
                AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="CurrentTestID" DataSourceID="NewTestsObjectDataSource"
                ForeColor="#333333" GridLines="None" Width="100%" CssClass="Grid" 
        onselectedindexchanged="newTestsGridView_SelectedIndexChanged">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="TestVariantTitle" HeaderText="Название" 
                        SortExpression="title" />
                    <asp:TemplateField HeaderText="Действие">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                NavigateUrl='<%# Eval("CurrentTestID", "javascript:OpenTraining(&#039;Att:{0}&#039;)") %>' 
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
