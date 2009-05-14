using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Groups_EditGroup : System.Web.UI.Page
{
    static int groupID = UnnLearningKitLibrary.Constants.FAKE_ID;
    static int departmentID = UnnLearningKitLibrary.Constants.FAKE_ID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                groupID = Convert.ToInt32(Request.Params["GroupID"]);
                ITable groupTable = new GroupTable();
                Group group = (Group)groupTable.GetById(groupID);
                
                departmentID = group.DepartmentId;
                titleText.Text = group.Title;
                descriptionText.Text = group.Description;
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
    protected void saveGroup_Click(object sender, EventArgs e)
    {
        try
        {
            departmentID = Convert.ToInt32(departmentsList.SelectedValue);
            ITable groupTable = new GroupTable();
            string title = titleText.Text;
            string description = descriptionText.Text;
            groupTable.Update(new Group(groupID, departmentID, title, description));

            string url = UrlConstants.GroupsHomeUrl + "?DepartmentID=" + departmentsList.SelectedValue;
            Response.Redirect(url);
        }
        catch (Exception ex)
        {
        }
    }
}
