using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RememberMe_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void redirectToHomePage_Click(object sender, EventArgs e)
    {
        if (User.IsInRole(Constants.AdminRoleName))
        {
            Response.Redirect(UrlConstants.AdminHomeUrl);
        }
        if (User.IsInRole(Constants.MetodistRoleName))
        {
            Response.Redirect(UrlConstants.MetodistHomeUrl);
        }
        if (User.IsInRole(Constants.UserRoleName))
        {
            Response.Redirect(UrlConstants.UserHomeUrl);
        }
    }
    protected void loginView_ViewChanged(object sender, EventArgs e)
    {

    }
}
