using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_GeneralInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.Name != "")
        {
            dataSetTableAdapters.StudentInfoTableAdapter studentInfoAdapter = new dataSetTableAdapters.StudentInfoTableAdapter();
            dataSet.StudentInfoDataTable studentsTable = studentInfoAdapter.GetStudentInfoDataByLogin(User.Identity.Name);

            if (studentsTable.Rows.Count > 0)
            {
                StudentName.Text = studentsTable.Rows[0].ItemArray[0].ToString();
                StudentLogin.Text = studentsTable.Rows[0].ItemArray[2].ToString();
                StudentEmail.Text = studentsTable.Rows[0].ItemArray[1].ToString();
                StudentDepartment.Text = studentsTable.Rows[0].ItemArray[4].ToString();
                StudentGroup.Text = studentsTable.Rows[0].ItemArray[3].ToString();
            }
        }

        //string user_name = studentsTable.Rows[0].ItemArray[0].ToString();
        
    }
}
