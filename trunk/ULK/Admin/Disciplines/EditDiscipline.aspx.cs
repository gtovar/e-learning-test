using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Disciplines_EditDiscipline : System.Web.UI.Page
{
    static int departmentID = UnnLearningKitLibrary.Constants.FAKE_ID;
    static int chairID = UnnLearningKitLibrary.Constants.FAKE_ID;
    static int disciplineID = UnnLearningKitLibrary.Constants.FAKE_ID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                disciplineID = Convert.ToInt32(Request.Params["DisciplineID"]);
                ITable disciplineTable = new DisciplineTable();
                Discipline discipline = (Discipline)disciplineTable.GetById(disciplineID);

                departmentID = discipline.DepartmentId;
                chairID = discipline.ChairId;
                titleText.Text = discipline.Title;
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
    protected void chairsList_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
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
        try
        {
            ITable disciplineTable = new DisciplineTable();
            departmentID = Convert.ToInt32(departmentsList.SelectedValue);
            chairID = Convert.ToInt32(chairsList.SelectedValue);
            disciplineTable.Update(new Discipline(disciplineID, departmentID, chairID, titleText.Text));
            
            string url = UrlConstants.DisciplinesHomeUrl + "?DepartmentID=" + departmentID + "&ChairID=" + chairID;
            Response.Redirect(url);
        }
        catch (Exception ex)
        {
        }
    }
}
