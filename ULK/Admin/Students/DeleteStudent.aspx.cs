using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Students_DeleteStudent : System.Web.UI.Page
{
    static int studentId = UnnLearningKitLibrary.Constants.FAKE_ID;

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

    protected void deleteStudent_Click(object sender, EventArgs e)
    {
        ITable table;
        table = new StudentTable();
        Student student = (Student)table.GetById(studentId);
        string userId = AspNetUsers.GetUserId(student.Login);

        AspNetUsers.DeleteUser(userId);
        table.Delete(studentId);

        table = new GroupTable();
        Group group = (Group)table.GetById(student.GroupId);

        string url = UrlConstants.StudentsHomeUrl + "?DepartmentID=" + group.DepartmentId  + "&GroupID=" + student.GroupId;
        Response.Redirect(url);
    }
}
