using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Metodist_DoneAssignments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void viewDoneTests_DataBound(object sender, EventArgs e)
    {
        for (int i = 0; i < viewDoneTests.Rows.Count; i++)
        {
            Label numbers = (Label)viewDoneTests.Rows[i].Cells[0].FindControl(Resources.Constants.NumbersLinesLabelName);
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
