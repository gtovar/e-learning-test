using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Students_ManageStudents : System.Web.UI.Page
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
    protected void addStudent_Click(object sender, EventArgs e)
    {
        string url = UrlConstants.AddStudentUrl + "?DepartmentID=" + departmentsList.SelectedValue + "&GroupID=" + groupsList.SelectedValue;
        Response.Redirect(url);
    }
    protected void groupsList_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                int groupID = Convert.ToInt32(Request.Params["GroupID"]);
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
}
