using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UnnLearningKit.Admin.Students
{
    public partial class ManageStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                try
                {
                    int groupId = Convert.ToInt32(Request.Params["GroupID"]);
                    for (int i = 0; i < groupsList.Items.Count; i++)
                    {
                        if (Convert.ToInt32(groupsList.Items[i].Value) == groupId)
                        {
                            groupsList.SelectedIndex = i;
                        }
                    }
                }
                catch (Exception ex)
                {
                }
            }
        }

        protected void groupsList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int groupId = Convert.ToInt32(groupsList.SelectedValue);
                Response.Redirect(WebConstants.StudentsUrl + groupId);
            }
            catch (Exception ex)
            {
            }
        }

        protected void addStudent_Click(object sender, EventArgs e)
        {
            try
            {
                int groupId = Convert.ToInt32(groupsList.SelectedValue);
                Response.Redirect(WebConstants.AddStudentUrl + groupId);
            }
            catch (Exception ex)
            {
            }
        }
    }
}
