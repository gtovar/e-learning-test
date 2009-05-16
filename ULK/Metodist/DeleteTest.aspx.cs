using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Metodist_DeleteTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void deleteDisciplinePartTest_Click(object sender, EventArgs e)
    {
        try
        {
            int disciplinePartID = Convert.ToInt32(Request.Params["DisciplinePartID"]);

            ITable disciplinePartTable = new DisciplinePartTable();
            DisciplinePart disciplinePart = (DisciplinePart)disciplinePartTable.GetById(disciplinePartID);

            disciplinePartTable.Delete(disciplinePartID);

            int disciplineID = disciplinePart.DisciplineId;

            ITable disciplineTable = new DisciplineTable();
            Discipline discipline = (Discipline)disciplineTable.GetById(disciplineID);
            int chairID = discipline.ChairId;
            int departmentID = discipline.DepartmentId;

            string url = UrlConstants.DisciplinePartsHomeUrl + "?DepartmentID=" + departmentID + "&ChairID=" + chairID + "&DisciplineID=" + disciplineID;
            Response.Redirect(url);
        }
        catch (Exception ex)
        {
        }
    }
}
