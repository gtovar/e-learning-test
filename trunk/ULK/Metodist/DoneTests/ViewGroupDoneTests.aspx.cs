using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Metodist_DoneTests_ViewGroupTest : System.Web.UI.Page
{
    protected static int departmentID = UnnLearningKitLibrary.Constants.FAKE_ID;
    protected static int groupID = UnnLearningKitLibrary.Constants.FAKE_ID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string groupTitle = Request.Params["GroupTitle"];
                IGroupTable groupTable = new GroupTable();
                Group group = (Group)groupTable.GetByGroupTitle(groupTitle);

                groupID = group.Id;
                departmentID = group.DepartmentId;
            }
            catch (Exception ex)
            {
            }
        }
    }
    protected void departmentsList_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                for (int i = 0; i < departmentsList.Items.Count; i++)
                {
                    if (Convert.ToInt32(departmentsList.Items[i].Value) == departmentID)
                    {
                        departmentsList.SelectedIndex = i;
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
    protected void groupsList_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                for (int i = 0; i < groupsList.Items.Count; i++)
                {
                    if (Convert.ToInt32(groupsList.Items[i].Value) == groupID)
                    {
                        groupsList.SelectedIndex = i;
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
    protected void doneAssignmentGridView_DataBound(object sender, EventArgs e)
    {
        for (int i = 0; i < doneAssignmentGridView.Rows.Count; i++)
        {
            Label numbers = (Label)doneAssignmentGridView.Rows[i].Cells[0].FindControl(Resources.Constants.NumbersLinesLabelName);
            numbers.Text = (i + 1).ToString();
        }
    }
    protected void backToDoneTests_Click(object sender, EventArgs e)
    {
        string url = UrlConstants.DoneAssignmentsHomeUrl + "?DepartmentID=" + departmentsList.SelectedValue;
        Response.Redirect(url);
    }
}
