using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UnnLearningKitLibrary;
using Resources;

public partial class Admin_Departments_AddDepartments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void saveDepartment_Click(object sender, EventArgs e)
    {
        ITable departmentTable = new DepartmentTable();
        departmentTable.Add(new Department(UnnLearningKitLibrary.Constants.FAKE_ID, titleText.Text));

        Response.Redirect(UrlConstants.DepartmentsHomeUrl);
    }
}
