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
    public partial class AddStudent : System.Web.UI.Page
    {
        ITable table;
        protected static string groupID = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void departmentsList_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void groupsList_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox answer = (TextBox)createStudent.CreateUserStep.ContentTemplateContainer.FindControl(WebConstants.SecretAnswerControlName);
            DropDownList groupsList = (DropDownList)sender;
            answer.Text = groupsList.Items[groupsList.SelectedIndex].Text;
        }

        protected void groupsList_DataBound(object sender, EventArgs e)
        {
            TextBox answer = (TextBox)createStudent.CreateUserStep.ContentTemplateContainer.FindControl(WebConstants.SecretAnswerControlName);
            DropDownList groupsList = (DropDownList)sender;
            answer.Text = groupsList.Items[groupsList.SelectedIndex].Text;
        }

        protected void createStudent_CreatedUser(object sender, EventArgs e)
        {
            string userId = GetCreatedUserId();
            string roleId = GetUsersGroupRoleId();
            AddUserInRoles(userId, roleId);
            AddStudentToDB();
        }


        protected string GetCreatedUserId()
        {
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            dataSet.UsersDataTable usersTable = userAdapter.GetUserId(createStudent.UserName);
            string user_id = usersTable.Rows[0].ItemArray[0].ToString();

            return user_id;
        }

        protected string GetUsersGroupRoleId()
        {
            RolesTableAdapter rolesAdapter = new RolesTableAdapter();
            dataSet.RolesDataTable rolesTable = rolesAdapter.GetRoleByRoleName(WebConstants.UsersGroupRoleName);
            string role_id = rolesTable.Rows[0].ItemArray[0].ToString();

            return role_id;
        }

        protected void AddUserInRoles(string userId, string roleId)
        {
            Guid userGuid = new Guid(userId);
            Guid roleGuid = new Guid(roleId);
            UsersInRolesTableAdapter usersInRolesAdapter = new UsersInRolesTableAdapter();
            usersInRolesAdapter.AddUsersInRoles(userGuid, roleGuid);
        }

        protected void AddStudentToDB()
        {
            string login = createStudent.UserName;
            string email = createStudent.Email;
            
            TextBox fullUserName = (TextBox)createStudent.CreateUserStep.ContentTemplateContainer.FindControl(WebConstants.FullUserNameControlName);
            string name = String.Empty;
            try
            {
                name = fullUserName.Text;
            }
            catch (Exception ex)
            {
            }
            
            DropDownList groupsList = (DropDownList)createStudent.CreateUserStep.ContentTemplateContainer.FindControl(WebConstants.GroupsListControlName);
            int group_id = Constants.FAKE_ID;
            try
            {
                group_id = Convert.ToInt32(groupsList.SelectedValue);
                groupID = group_id.ToString();
            }
            catch (Exception ex)
            {
            }

            TextBox userDescription = (TextBox)createStudent.CreateUserStep.ContentTemplateContainer.FindControl(WebConstants.UserDescriptionControlName);
            string description = String.Empty;
            try
            {
                description = userDescription.Text;
            }
            catch (Exception ex)
            {
            }

            table = new StudentTable();
            table.Add(new Student(Constants.FAKE_ID, group_id, name, login, email, description));

        }

        protected void redirectToAddStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect(WebConstants.AddStudentUrl + groupID);
        }

        protected void redirectToManageStudents_Click(object sender, EventArgs e)
        {
            Response.Redirect(WebConstants.StudentsUrl + groupID);
        }
    }
}
