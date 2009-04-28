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

            string departmentId = Request.Params["DepartmentID"];
            try
            {
                departmentList.SelectedIndex = Convert.ToInt32(departmentId) - 1;
            }
            catch (Exception ex)
            {
            }
        }

        protected void saveGroup_Click(object sender, EventArgs e)
        {
            table = new GroupTable();

            string title = titleValue.Text;
            string description = descriptionValue.Text;
            int departmentId = departmentList.SelectedIndex + 1;

            if (String.Empty == title)
            {
                groupStatus.Text = Messages.AddGroupErrors;
                groupStatus.CssClass = WebConstants.ShowMessageCssClass;
                return;
            }

            if (String.Empty == description)
            {
                table.Add(new Group(Constants.FAKE_ID, departmentId, title));
            }
            else
            {
                table.Add(new Group(Constants.FAKE_ID, departmentId, title, description));
            }

            groupStatus.Text = Messages.AddGroupSuccessfully;
            groupStatus.CssClass = WebConstants.ShowMessageCssClass;

            titleValue.Text = String.Empty;
            descriptionValue.Text = String.Empty;
        }

        protected void cancelSaveGroup_Click(object sender, EventArgs e)
        {
            int departmentId = departmentList.SelectedIndex + 1;
            Response.Redirect(WebConstants.GroupsUrl + departmentId);
        }
    }
}
