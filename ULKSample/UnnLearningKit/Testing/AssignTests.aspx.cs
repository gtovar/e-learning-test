using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UnnLearningKitLibrary;
using UnnLearningKit.App_Code;
using UnnLearningKit.Code;

namespace UnnLearningKit.Testing
{
    public partial class AssingTests : System.Web.UI.Page
    {
        ITable table;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void saveCurrentTest_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < viewStudentsAndTests.Rows.Count; i++)
            {
                string studentName = viewStudentsAndTests.Rows[i].Cells[1].Text;

                table = new StudentTable();
                int studentId = ((IStudentTable)table).GetStudentIdByName(studentName);

                DropDownList testVariantsList = (DropDownList)viewStudentsAndTests.Rows[i].Cells[0].FindControl(WebConstants.TestVariantsListControlName);
                int testVariantid = Constants.FAKE_ID;
                try
                {
                    testVariantid = Convert.ToInt32(testVariantsList.SelectedValue);
                }
                catch (Exception ex)
                {
                }
                table = new TestTable();
                table.Add(new UnnLearningKitLibrary.Test(Constants.FAKE_ID, studentId, testVariantid));

                Response.Redirect(WebConstants.AssignTestsResultUrl);
            }
        }

        protected void viewStudentsAndTests_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < viewStudentsAndTests.Rows.Count; i++)
            {
                Label numbers = (Label)viewStudentsAndTests.Rows[i].Cells[0].FindControl(WebConstants.NumbersLinesLabelName);
                numbers.Text = (i + 1).ToString();
            }
        }
    }
}
