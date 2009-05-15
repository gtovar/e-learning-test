using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_DisciplineParts_AddDisciplinePart : System.Web.UI.Page
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
    protected void chairsList_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                int chairID = Convert.ToInt32(Request.Params["ChairID"]);
                for (int i = 0; i < chairsList.Items.Count; i++)
                {
                    if (Convert.ToInt32(chairsList.Items[i].Value) == chairID)
                    {
                        chairsList.SelectedIndex = i;
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }

    protected void saveDisciplinePart_Click(object sender, EventArgs e)
    {
        try
        {
            ITable disciplinePartTable = new DisciplinePartTable();

            int disciplineID = Convert.ToInt32(disciplinesList.SelectedValue);
            disciplinePartTable.Add(new DisciplinePart(UnnLearningKitLibrary.Constants.FAKE_ID, disciplineID, titleText.Text));

            string url = UrlConstants.DisciplinePartsHomeUrl + "?DepartmentID=" + departmentsList.SelectedValue + "&ChairID=" + chairsList.SelectedValue + "&DisciplineID=" + disciplineID;
            Response.Redirect(url);
        }
        catch (Exception ex)
        {
        }
    }
    protected void disciplinesList_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                int disciplineID = Convert.ToInt32(Request.Params["DisciplineID"]);
                for (int i = 0; i < disciplinesList.Items.Count; i++)
                {
                    if (Convert.ToInt32(disciplinesList.Items[i].Value) == disciplineID)
                    {
                        disciplinesList.SelectedIndex = i;
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}
