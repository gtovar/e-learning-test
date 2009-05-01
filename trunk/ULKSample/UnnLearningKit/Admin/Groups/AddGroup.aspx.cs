using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UnnLearningKitLibrary;

namespace UnnLearningKit.Admin.Groups
{
    public partial class AddGroup : System.Web.UI.Page
    {
        ITable table;   
        protected void Page_Load(object sender, EventArgs e)
        {
            groupStatus.Text = Messages.EmptyMessage;
            groupStatus.CssClass = WebConstants.HideMessageCssClass;

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

        protected void saveGroup_Click(object sender, EventArgs e)
        {
            int departmentId = Constants.FAKE_ID;
            try
            {
                departmentId = Convert.ToInt32(departmentsList.SelectedValue);
            }
            catch (Exception ex)
            {
            }
            string title = titleValue.Text;
            if (String.IsNullOrEmpty(title))
            {
                groupStatus.Text = Messages.AddGroupErrors;
                groupStatus.CssClass = WebConstants.ShowMessageCssClass;
                return;
            }
            string description = descriptionValue.Text;
            table = new GroupTable();
            table.Add(new Group(Constants.FAKE_ID, departmentId, title, description));

            groupStatus.Text = Messages.AddGroupSuccessfully;
            groupStatus.CssClass = WebConstants.ShowMessageCssClass;

            titleValue.Text = String.Empty;
            descriptionValue.Text = String.Empty;
        }

        protected void cancelSaveGroup_Click(object sender, EventArgs e)
        {
            int departmentId = Constants.FAKE_ID;
            try
            {
                departmentId = Convert.ToInt32(departmentsList.SelectedValue);
            }
            catch (Exception ex)
            {
            }
            Response.Redirect(WebConstants.GroupsUrl + departmentId);
        }
    }
}
