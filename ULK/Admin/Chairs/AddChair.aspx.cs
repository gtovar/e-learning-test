using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Chairs_AddChair : System.Web.UI.Page
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
    protected void saveChair_Click(object sender, EventArgs e)
    {
        try
        {
            ITable chairTable = new ChairTable();
            int departmentID = Convert.ToInt32(departmentsList.SelectedValue);
            string title = titleText.Text;
            string description = descripitonText.Text;
            
            chairTable.Add(new Chair(UnnLearningKitLibrary.Constants.FAKE_ID, departmentID, title, description));

            string url = UrlConstants.ChairsHomeUrl + "?DepartmentID=" + departmentID;
            Response.Redirect(url);
        }
        catch (Exception ex)
        {
        }
    }
}
