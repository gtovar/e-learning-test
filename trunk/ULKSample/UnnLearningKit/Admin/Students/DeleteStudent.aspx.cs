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

        protected string GetUserId(string userName)
        {
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            dataSet.UsersDataTable usersTable = userAdapter.GetUserId(userName);
            string user_id = usersTable.Rows[0].ItemArray[0].ToString();

            return user_id;
        }

        protected void DeleteUserProfile(string userId)
        {
            Guid userGuid = new Guid(userId);
            ProfileTableAdapter profileAdapter = new ProfileTableAdapter();
            profileAdapter.DeleteUserProfile(userGuid);
        }

        protected void DeleteUserMembership(string userId)
        {
            Guid userGuid = new Guid(userId);
            MembershipTableAdapter membershipAdapter = new MembershipTableAdapter();
            membershipAdapter.DeleteUserMembership(userGuid);
        }

        protected void DeleteUserRoles(string userId)
        {
            Guid userGuid = new Guid(userId);
            UsersInRolesTableAdapter userRolesAdapter = new UsersInRolesTableAdapter();
            userRolesAdapter.DeleteUserRoles(userGuid);
        }

        protected void DeleteUserPersonalization(string userId)
        {
            Guid userGuid = new Guid(userId);
            PersonalizationPerUserTableAdapter userPersonalizationAdapter = new PersonalizationPerUserTableAdapter();
            userPersonalizationAdapter.DeleteUserPersonalization(userGuid);
        }

        protected void DeleteUser(string userId)
        {
            DeleteUserPersonalization(userId);
            DeleteUserRoles(userId);
            DeleteUserMembership(userId);
            DeleteUserProfile(userId);

            Guid userGuid = new Guid(userId);
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            userAdapter.DeleteUser(userGuid);
        }

        protected void deleteStudentConfirm_Click(object sender, EventArgs e)
        {
            table = new StudentTable();
            Student student = (Student)table.GetById(studentId);
            string userId = GetUserId(student.Login);

            DeleteUser(userId);
            table.Delete(studentId);

            Response.Redirect(WebConstants.DeleteStudentResultUrl);
        }
    }
}
