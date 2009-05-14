using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Groups_AddGroup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void departmentsList_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                int departmentID = Convert.ToInt32(Request.Params["DepartmentID"]);
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
    protected void saveGroup_Click(object sender, EventArgs e)
    {
        ITable groupTable = new GroupTable();
        int departmentID = Convert.ToInt32(departmentsList.SelectedValue.ToString());
        string title = titleText.Text;
        string description = descriptionText.Text;
        groupTable.Add(new Group(UnnLearningKitLibrary.Constants.FAKE_ID, departmentID, title, description));

        string url = UrlConstants.GroupsHomeUrl + "?DepartmentID=" + departmentsList.SelectedValue;
        Response.Redirect(url);
    }
}
