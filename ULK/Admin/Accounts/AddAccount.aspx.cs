using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Accounts_AddAccount : System.Web.UI.Page
{
    static string roleName = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void createAccount_CreatedUser(object sender, EventArgs e)
    {
        DropDownList rolesList = (DropDownList)createAccount.CreateUserStep.ContentTemplateContainer.FindControl(Resources.Constants.RolesListControlName);
        string userId = GetCreatedUserId();
        string roleId = rolesList.SelectedValue.ToString();
        roleName = rolesList.SelectedItem.Text;
        AspNetUsers.AddUserInRoles(userId, roleId);
    }

    protected string GetCreatedUserId()
    {
        dataSetTableAdapters.UsersTableAdapter userAdapter = new dataSetTableAdapters.UsersTableAdapter();
        dataSet.UsersDataTable usersTable = userAdapter.GetUserId(createAccount.UserName);
        string user_id = usersTable.Rows[0].ItemArray[0].ToString();

        return user_id;
    }

    protected void rolesList_DataBound(object sender, EventArgs e)
    {
        DropDownList rolesList = (DropDownList)sender;
        if (!IsPostBack)
        {
            try
            {
                string roleName = Request.Params["RoleName"];
                for (int i = 0; i < rolesList.Items.Count; i++)
                {
                    if (roleName.Equals(rolesList.Items[i].Text))
                    {
                        rolesList.SelectedIndex = i;
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
    protected void redirectToManageAccounts_Click(object sender, EventArgs e)
    {
        string url = UrlConstants.AccountsHomeUrl + "?RoleName=" + roleName;
        Response.Redirect(url);
    }
}
