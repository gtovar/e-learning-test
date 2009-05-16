using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Departments_DeleteDepartment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void deleteDepartment_Click(object sender, EventArgs e)
    {
        try
        {
            int departmentID = Convert.ToInt32(Request.Params["DepartmentID"]);
            ITable departmentTable = new DepartmentTable();
            departmentTable.Delete(departmentID);

            string url = UrlConstants.DepartmentsHomeUrl;
            Response.Redirect(url);
        }
        catch (Exception ex)
        {
        }
    }
}
