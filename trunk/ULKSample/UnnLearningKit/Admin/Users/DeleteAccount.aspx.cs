using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UnnLearningKitLibrary;
using UnnLearningKit.App_Code;
using UnnLearningKit.Code;

namespace UnnLearningKit.Admin.Users
{
    public partial class DeleteAccount : System.Web.UI.Page
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
                }
            }
        }

        protected void deleteAcountConfirm_Click(object sender, EventArgs e)
        {
            AspNet_Users.DeleteUser(userId);
            Response.Redirect(WebConstants.DeleteAccountResultUrl);
        }
    }
}
