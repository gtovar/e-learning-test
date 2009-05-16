using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Metodist_EditTest : System.Web.UI.Page
{
    static int departmentID = UnnLearningKitLibrary.Constants.FAKE_ID;
    static int chairID = UnnLearningKitLibrary.Constants.FAKE_ID;
    static int disciplineID = UnnLearningKitLibrary.Constants.FAKE_ID;
    static int disciplinePartID = UnnLearningKitLibrary.Constants.FAKE_ID;
    static int disciplinePartTestID = UnnLearningKitLibrary.Constants.FAKE_ID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                disciplinePartTestID = Convert.ToInt32(Request.Params["DisciplinePartTestID"]);

                ITable testVariantTable = new TestVariantTable();
                TestVariant testVariant = (TestVariant)testVariantTable.GetById(disciplinePartTestID);

                disciplinePartID = testVariant.DisciplinePartId;

                ITable disciplinePartTable = new DisciplinePartTable();
                DisciplinePart disciplinePart = (DisciplinePart)disciplinePartTable.GetById(disciplinePartID);

                disciplineID = disciplinePart.DisciplineId;

                ITable disciplineTable = new DisciplineTable();
                Discipline discipline = (Discipline)disciplineTable.GetById(disciplineID);

                chairID = discipline.ChairId;
                departmentID = discipline.DepartmentId;
                //titleText.Text = disciplinePart.Title;
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

    protected void saveDisciplinePart_Click(object sender, EventArgs e)
    {
        try
        {
            ITable testVariantTable = new TestVariantTable();

            disciplinePartID = Convert.ToInt32(disciplinePartsList.SelectedValue);
            testVariantTable.Update(new TestVariant(disciplinePartTestID, disciplinePartID, "", ""));

            string url = UrlConstants.DisciplinePartTestsHomeUrl + "?DepartmentID=" + departmentsList.SelectedValue + "&ChairID=" + chairsList.SelectedValue +
                "&DisciplineID=" + disciplinesList.SelectedValue + "&DisciplinePartID=" + disciplinePartsList.SelectedValue;
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
