using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Accounts_DeleteAccount : System.Web.UI.Page
{
    static string userName = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.Params["UserName"]))
            {
                userName = Request.Params["UserName"];
            }
        }
    }
    protected void deleteAccount_Click(object sender, EventArgs e)
    {
        string userId = AspNetUsers.GetUserId(userName);

        string roleId = AspNetUsers.GetRoleId(userId);
        string roleName = AspNetUsers.GetRoleName(roleId);
        AspNetUsers.DeleteUser(userId);

        string url = UrlConstants.AccountsHomeUrl + "?RoleName=" + roleName;
        Response.Redirect(url);
    }
}
