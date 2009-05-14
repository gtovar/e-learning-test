using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Chairs_EditChair : System.Web.UI.Page
{
    static int chairID = UnnLearningKitLibrary.Constants.FAKE_ID;
    static int departmentID = UnnLearningKitLibrary.Constants.FAKE_ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                chairID = Convert.ToInt32(Request.Params["ChairID"]);
                ITable groupTable = new ChairTable();
                Chair group = (Chair)groupTable.GetById(chairID);

                departmentID = group.DepartmentId;
                titleText.Text = group.Title;
                descriptionText.Text = group.Description;
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
            departmentID = Convert.ToInt32(departmentsList.SelectedValue);
            string title = titleText.Text;
            string description = descriptionText.Text;

            chairTable.Update(new Chair(chairID, departmentID, title, description));

            string url = UrlConstants.ChairsHomeUrl + "?DepartmentID=" + departmentID;
            Response.Redirect(url);
        }
        catch (Exception ex)
        {
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
}
