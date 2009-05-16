using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Metodist_TestStorage : System.Web.UI.Page
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
    protected void addDisciplinePartTest_Click(object sender, EventArgs e)
    {
        string url = UrlConstants.AddDisciplinePartTestUrl + "?DepartmentID=" + departmentsList.SelectedValue + "&ChairID="
            + chairsList.SelectedValue + "&DisciplineID=" + disciplinesList.SelectedValue + "&DisciplinePartID=" + disciplinePartsList.SelectedValue;
        Response.Redirect(url);
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

    protected void disciplinePartsList_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                int disciplinePartID = Convert.ToInt32(Request.Params["DisciplinePartID"]);
                for (int i = 0; i < disciplinePartsList.Items.Count; i++)
                {
                    if (Convert.ToInt32(disciplinePartsList.Items[i].Value) == disciplinePartID)
                    {
                        disciplinePartsList.SelectedIndex = i;
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}
