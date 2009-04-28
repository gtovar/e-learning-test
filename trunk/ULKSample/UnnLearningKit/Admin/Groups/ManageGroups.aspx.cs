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
                string departmentID = Request.Params["DepartmentID"];
                try
                {
                    departmentList.SelectedIndex = Convert.ToInt32(departmentID) - 1;
                }
                catch (Exception ex)
                {
                }
            }
        }

        protected void departmentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int departmentID = departmentList.SelectedIndex + 1;
            Response.Redirect(WebConstants.GroupsUrl + departmentID);
        }

        protected void addGroup_Click(object sender, EventArgs e)
        {
            int departmentID = departmentList.SelectedIndex + 1;
            Response.Redirect(WebConstants.AddGroupUrl + departmentID);
        }
    }
}
