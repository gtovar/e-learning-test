using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Disciplines_DeleteDiscipline : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void deleteDiscipline_Click(object sender, EventArgs e)
    {
        try
        {
            int disciplineID = Convert.ToInt32(Request.Params["DisciplineID"]);

            ITable disciplineTable = new DisciplineTable();
            Discipline discipline = (Discipline)disciplineTable.GetById(disciplineID);

            disciplineTable.Delete(disciplineID);

            ITable disciplinePartTable = new DisciplinePartTable();
            ((DisciplinePartTable)disciplinePartTable).DeleteAllDisciplinePartsByDisciplineId(disciplineID);

            string url = UrlConstants.DisciplinesHomeUrl + "?DepartmentID=" + discipline.DepartmentId + "&ChairID=" + discipline.ChairId;
            Response.Redirect(url);
        }
        catch (Exception ex)
        {
        }
    }
}
