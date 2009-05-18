using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Disciplines_AddDiscipline : System.Web.UI.Page
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
    protected void saveDiscipline_Click(object sender, EventArgs e)
    {
        ITable disciplineTable = new DisciplineTable();
        int departmentID = Convert.ToInt32(departmentsList.SelectedValue);
        int chairID = Convert.ToInt32(chairsList.SelectedValue);
        disciplineTable.Add(new Discipline(UnnLearningKitLibrary.Constants.FAKE_ID, departmentID, chairID, tittleText.Text));
        
        string url = UrlConstants.DisciplinesHomeUrl + "?DepartmentID=" + departmentID + "&ChairID=" + chairID;
        Response.Redirect(url);
    }
}
