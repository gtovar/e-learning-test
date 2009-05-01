using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UnnLearningKitLibrary;
using UnnLearningKit.App_Code.dataSetTableAdapters;
using UnnLearningKit.App_Code;
using UnnLearningKit.Code;

namespace UnnLearningKit.Admin.Students
{
    public partial class AddStudent : System.Web.UI.Page
    {
        ITable table;
        protected static string groupID = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
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
            string roleId = AspNet_Users.GetUsersGroupRoleId();
            AspNet_Users.AddUserInRoles(userId, roleId);
            AddStudentToDB();
        }


        protected string GetCreatedUserId()
        {
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            dataSet.UsersDataTable usersTable = userAdapter.GetUserId(createStudent.UserName);
            string user_id = usersTable.Rows[0].ItemArray[0].ToString();

            return user_id;
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
    }
}
