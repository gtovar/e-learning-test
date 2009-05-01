using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UnnLearningKit.Admin.Groups
{
    public partial class ManageGroups : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    int departmentId = Convert.ToInt32(Request.Params["DepartmentID"]);
                    for (int i = 0; i < departmentsList.Items.Count; i++)
                    {
                        if (Convert.ToInt32(departmentsList.Items[i].Value) == departmentId)
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

        protected void departmentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int departmentID = Convert.ToInt32(departmentsList.SelectedValue);
                Response.Redirect(WebConstants.GroupsUrl + departmentID);
            }
            catch (Exception ex)
            {
            }
        }
    }
}
