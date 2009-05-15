using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Students_AddStudent : System.Web.UI.Page
{
    static int groupID = UnnLearningKitLibrary.Constants.FAKE_ID;
    static int departmentID = UnnLearningKitLibrary.Constants.FAKE_ID;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void groupsList_DataBound(object sender, EventArgs e)
    {
        DropDownList groupsList = (DropDownList)sender;
        if (!IsPostBack)
        {
            try
            {
                int groupID = Convert.ToInt32(Request.Params["GroupID"]);
                for (int i = 0; i < groupsList.Items.Count; i++)
                {
                    if (Convert.ToInt32(groupsList.Items[i].Value) == groupID)
                    {
                        groupsList.SelectedIndex = i;
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        
        TextBox answer = (TextBox)createStudent.CreateUserStep.ContentTemplateContainer.FindControl(Resources.Constants.SecretAnswerControlName);
        answer.Text = groupsList.SelectedItem.Text;
    }
    protected void departmentsList_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                DropDownList departmentsList = (DropDownList)sender;
                int departmentID = Convert.ToInt32(Request.Params["DepartmentID"]);
                for (int i = 0; i < departmentsList.Items.Count; i++)
                {
                    if (Convert.ToInt32(departmentsList.Items[i].Value) == departmentID)
                    {
                        departmentsList.SelectedIndex = i;
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
    protected void createStudent_CreatedUser(object sender, EventArgs e)
    {
        string userId = GetCreatedUserId();
        string roleId = AspNetUsers.GetUsersRoleId();
        AspNetUsers.AddUserInRoles(userId, roleId);
        AddStudentToULKDB();
    }


    protected string GetCreatedUserId()
    {
        dataSetTableAdapters.UsersTableAdapter userAdapter = new dataSetTableAdapters.UsersTableAdapter();
        dataSet.UsersDataTable usersTable = userAdapter.GetUserId(createStudent.UserName);
        string user_id = usersTable.Rows[0].ItemArray[0].ToString();

        return user_id;
    }

    protected void AddStudentToULKDB()
    {
        string login = createStudent.UserName;
        string email = createStudent.Email;

        TextBox fullUserName = (TextBox)createStudent.CreateUserStep.ContentTemplateContainer.FindControl(Resources.Constants.FullUserNameControlName);
        string name = fullUserName.Text;

        DropDownList groupsList = (DropDownList)createStudent.CreateUserStep.ContentTemplateContainer.FindControl(Resources.Constants.GroupsListControlName);
        groupID = Convert.ToInt32(groupsList.SelectedValue);

        DropDownList departmentsList = (DropDownList)createStudent.CreateUserStep.ContentTemplateContainer.FindControl(Resources.Constants.DepartmentsListControlName);
        departmentID = Convert.ToInt32(departmentsList.SelectedValue);

        TextBox userDescription = (TextBox)createStudent.CreateUserStep.ContentTemplateContainer.FindControl(Resources.Constants.UserDescriptionControlName);
        string description = userDescription.Text;

        ITable table;
        table = new StudentTable();
        table.Add(new Student(UnnLearningKitLibrary.Constants.FAKE_ID, groupID, name, login, email, description));
    }

    protected void groupsList_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox answer = (TextBox)createStudent.CreateUserStep.ContentTemplateContainer.FindControl(Resources.Constants.SecretAnswerControlName);
        DropDownList groupsList = (DropDownList)sender;
        answer.Text = groupsList.SelectedItem.Text;
    }
    protected void redirectToManageStudents_Click(object sender, EventArgs e)
    {
        string url = UrlConstants.StudentsHomeUrl + "?DepartmentID=" + departmentID + "&GroupID=" + groupID;
        Response.Redirect(url);
    }
}
