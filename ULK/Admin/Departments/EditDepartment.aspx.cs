using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Departments_EditDepartment : System.Web.UI.Page
{
    static int departmentID = UnnLearningKitLibrary.Constants.FAKE_ID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                departmentID = Convert.ToInt32(Request.Params["DepartmentID"]);
                ITable departmentTable = new DepartmentTable();
                Department department = (Department)departmentTable.GetById(departmentID);

                titleText.Text = department.Title;
            }
            catch (Exception ex)
            {
            }
        }
    }
    protected void saveDepartment_Click(object sender, EventArgs e)
    {
        try
        {
            ITable departmentTable = new DepartmentTable();
            string title = titleText.Text;
            departmentTable.Update(new Department(departmentID, title));

            string url = UrlConstants.DepartmentsHomeUrl;
            Response.Redirect(url);
        }
        catch (Exception ex)
        {
        }
    }
}
