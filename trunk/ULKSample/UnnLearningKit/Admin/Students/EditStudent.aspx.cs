using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UnnLearningKitLibrary;
using UnnLearningKit.App_Code.dataSetTableAdapters;
using UnnLearningKit.App_Code;

namespace UnnLearningKit.Admin.Students
{
    public partial class EditStudent : System.Web.UI.Page
    {
        ITable table;
        static Group group = null;
        static string userId = String.Empty;
        static int studentId = Constants.FAKE_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.Params["StudentID"]))
                {
                    try
                    {
                        studentId = Convert.ToInt32(Request.Params["StudentID"]);
                        table = new StudentTable();
                        Student student = (Student)table.GetById(studentId);
                        table = new GroupTable();
                        group = (Group)table.GetById(student.GroupId);

                        loginValue.Text = student.Login;
                        emailValue.Text = student.Email;
                        nameValue.Text = student.Name;
                        descriptionValue.Text = student.Description;

                        userId = GetUserId(student.Login);
                    }
                    catch (Exception ex)
                    {
                    }
                }
            }
        }

        protected string GetUserId(string userName)
        {
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            dataSet.UsersDataTable usersTable = userAdapter.GetUserId(userName);
            string user_id = usersTable.Rows[0].ItemArray[0].ToString();

            return user_id;
        }

        protected void UpdateUserName(string userName, string userId)
        {
            Guid userGuid = new Guid(userId);
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            userAdapter.UpdateUserName(userName, userName.ToLower(), userGuid);
        }

        protected void UpdateUserEmail(string userEmail, string userId)
        {
            Guid userGuid = new Guid(userId);
            MembershipTableAdapter membershipAdapter = new MembershipTableAdapter();
            membershipAdapter.UpdateEmail(userEmail, userEmail.ToLower(), userGuid);
        }

        protected void UpdateStudent()
        {
            Student student = new Student();
            student.Login = loginValue.Text;
            student.Email = emailValue.Text;
            student.Name = nameValue.Text;
            student.Description = descriptionValue.Text;
            student.Id = studentId;
            try
            {
                student.GroupId = Convert.ToInt32(groupsList.Items[groupsList.SelectedIndex].Value.ToString());
            }
            catch (Exception ex)
            {
            }

            UpdateUserEmail(student.Email, userId);
            UpdateUserName(student.Login, userId);

            table = new StudentTable();
            table.Update(student);
        }

        protected void saveStudent_Click(object sender, EventArgs e)
        {
            UpdateStudent();

            Response.Redirect(WebConstants.EditStudentResultUrl);
        }

        protected void departmentsList_DataBound(object sender, EventArgs e)
        {
            if (null != group)
            {
                DropDownList tempDepartmentsList = (DropDownList)sender;
                for (int i = 0; i < tempDepartmentsList.Items.Count; i++)
                {
                    if (Convert.ToInt32(tempDepartmentsList.Items[i].Value) == group.DepartmentId)
                    {
                        tempDepartmentsList.SelectedIndex = i;
                    }
                }
            }
        }

        protected void groupsList_DataBound(object sender, EventArgs e)
        {
            if (null != group)
            {
                DropDownList tempGroupsList = (DropDownList)sender;
                for (int i = 0; i < tempGroupsList.Items.Count; i++)
                {
                    if (Convert.ToInt32(tempGroupsList.Items[i].Value) == group.Id)
                    {
                        tempGroupsList.SelectedIndex = i;
                    }
                }
            }
        }
    }
}
