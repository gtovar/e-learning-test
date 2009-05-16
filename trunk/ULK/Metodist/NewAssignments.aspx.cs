using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Metodist_NewAssignments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void viewNewTests_DataBound(object sender, EventArgs e)
    {
        for (int i = 0; i < viewNewTests.Rows.Count; i++)
        {
            Label numbers = (Label)viewNewTests.Rows[i].Cells[0].FindControl(Resources.Constants.NumbersLinesLabelName);
            numbers.Text = (i + 1).ToString();
        }
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
}
