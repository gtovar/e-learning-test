using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Accounts_EditAccount : System.Web.UI.Page
{
    static string userId = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.Params["UserName"]))
            {
                string userName = Request.Params["UserName"];
                userId = AspNetUsers.GetUserId(userName);
                SetUserInfoInFormFields(userName);
            }
        }
    }
    protected void SetUserInfoInFormFields(string userName)
    {
        loginValue.Text = userName;
        emailValue.Text = AspNetUsers.GetUserEmail(userId);
        string roleId = AspNetUsers.GetRoleId(userId);
        rolesList.SelectedValue = roleId;
    }
    protected void saveAccount_Click(object sender, EventArgs e)
    {
        string selectedRoleId = rolesList.SelectedValue;
        string userName = loginValue.Text;
        string email = emailValue.Text;
        AspNetUsers.UpdateUserEmail(userId, email);
        AspNetUsers.UpdateUserName(userId, userName);
        AspNetUsers.UpdateRoleId(userId, selectedRoleId);

        string url = UrlConstants.AccountsHomeUrl + "?RoleName=" + rolesList.SelectedItem.Text;
        Response.Redirect(url);
    }
}
