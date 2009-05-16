using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Accounts_ManageAccounts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void addAccount_Click(object sender, EventArgs e)
    {
        string url = UrlConstants.AddAccountUrl + "?RoleName=" + rolesList.SelectedValue;
        Response.Redirect(url);
    }
    protected void rolesList_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string roleName = Request.Params["RoleName"];
                for (int i = 0; i < rolesList.Items.Count; i++)
                {
                    if (roleName.Equals(rolesList.Items[i].Value))
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
}
