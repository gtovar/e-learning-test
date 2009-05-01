using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UnnLearningKitLibrary;
using UnnLearningKit.App_Code;
using UnnLearningKit.Code;

namespace UnnLearningKit.Admin.Students
{
    public partial class DeleteStudents : System.Web.UI.Page
    {
        static int studentId = Constants.FAKE_ID;
        ITable table;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.Params["StudentID"]))
                {
                    try
                    {
                        studentId = Convert.ToInt32(Request.Params["StudentID"]);
                    }
                    catch (Exception ex)
                    {
                    }
                }
            }
        }

        protected void deleteStudentConfirm_Click(object sender, EventArgs e)
        {
            table = new StudentTable();
            Student student = (Student)table.GetById(studentId);
            string userId = AspNet_Users.GetUserId(student.Login);

            AspNet_Users.DeleteUser(userId);
            table.Delete(studentId);

            Response.Redirect(WebConstants.DeleteStudentResultUrl);
        }
    }
}
