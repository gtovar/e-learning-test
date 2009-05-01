using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using UnnLearningKit.App_Code.dataSetTableAdapters;
using UnnLearningKit.App_Code;
using UnnLearningKit.Code;

namespace UnnLearningKit
{
    public partial class Register : System.Web.UI.Page
    { 
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string GetCreatedUserId()
        {
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            dataSet.UsersDataTable usersTable = userAdapter.GetUserId(createUserWizard.UserName);
            string user_id = usersTable.Rows[0].ItemArray[0].ToString();

            return user_id;
        }

        protected string GetChoosingRoleId()
        {
            DropDownList rolesList = (DropDownList)createUserWizard.CreateUserStep.ContentTemplateContainer.FindControl(WebConstants.RolesListControlName);
            return rolesList.Items[rolesList.SelectedIndex].Value;
        }

        protected void createUserWizard_CreatedUser(object sender, EventArgs e)
        {
            string userId = GetCreatedUserId();
            string roleId = GetChoosingRoleId();
            AspNet_Users.AddUserInRoles(userId, roleId);
        }
    }
}
