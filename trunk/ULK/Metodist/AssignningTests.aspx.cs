using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Metodist_AssignningTests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void viewStudentsAndTests_DataBound(object sender, EventArgs e)
    {
        for (int i = 0; i < viewStudentsAndTests.Rows.Count; i++)
        {
            Label numbers = (Label)viewStudentsAndTests.Rows[i].Cells[0].FindControl(Resources.Constants.NumbersLinesLabelName);
            numbers.Text = (i + 1).ToString();
        }
    }
    protected void saveCurrentTest_Click(object sender, EventArgs e)
    {
        IStudentTable studentTable = new StudentTable();
        ITestTable testTable = new TestTable();
        for (int i = 0; i < viewStudentsAndTests.Rows.Count; i++)
        {
            string studentName = viewStudentsAndTests.Rows[i].Cells[1].Text;
            int studentId = studentTable.GetStudentIdByName(studentName);

            DropDownList testVariantsList = (DropDownList)viewStudentsAndTests.Rows[i].Cells[0].FindControl(Resources.Constants.TestVariantsListControlName);
            int testVariantid = Convert.ToInt32(testVariantsList.SelectedValue);

            testTable.Add(new Test(UnnLearningKitLibrary.Constants.FAKE_ID, studentId, testVariantid));
        }
        string url = UrlConstants.NewAssignmentsHomeUrl;
        Response.Redirect(url);
    }
}