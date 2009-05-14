using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Chairs_DeleteChair : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void deleteChair_Click(object sender, EventArgs e)
    {
        try
        {
            int chairID = Convert.ToInt32(Request.Params["ChairID"]);
            ITable chairTable = new ChairTable();
            Chair chair = (Chair)chairTable.GetById(chairID);
            chairTable.Delete(chairID);


            ITable disciplineTable = new DisciplineTable();
            ((DisciplineTable)disciplineTable).DeleteAllDisciplinesByChairId(chairID);

            string url = UrlConstants.ChairsHomeUrl + "?DepartmentID=" + chair.DepartmentId;
            Response.Redirect(url);
        }
        catch (Exception ex)
        {
        }
    }
}
