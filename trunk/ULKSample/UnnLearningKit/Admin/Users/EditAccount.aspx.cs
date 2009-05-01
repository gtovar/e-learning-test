using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UnnLearningKitLibrary;
using UnnLearningKit.App_Code;
using UnnLearningKit.Code;

namespace UnnLearningKit.Admin.Users
{
    public partial class EditAccount : System.Web.UI.Page
    {
        static string userId = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.Params["UserName"]))
                {
                    string userName = Request.Params["UserName"];
                    userId = AspNet_Users.GetUserId(userName);
                    SetUserInfoInFormFields(userName);
                }
            }
        }

        protected void SetUserInfoInFormFields(string userName)
        {
            loginValue.Text = userName;
            emailValue.Text = AspNet_Users.GetUserEmail(userId);
            string roleId = AspNet_Users.GetRoleId(userId);
            rolesList.SelectedValue = roleId;
        }

        protected void saveAccount_Click(object sender, EventArgs e)
        {
            string selectedRoleId = rolesList.SelectedValue;
            string userName = loginValue.Text;
            string email = emailValue.Text;
            AspNet_Users.UpdateUserEmail(userId, email);
            AspNet_Users.UpdateUserName(userId, userName);
            AspNet_Users.UpdateRoleId(userId, selectedRoleId);

            Response.Redirect(WebConstants.EditAccountResultUrl);
        }
    }
}
