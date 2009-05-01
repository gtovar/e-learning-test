using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UnnLearningKitLibrary;

namespace UnnLearningKit.Admin
{
    public partial class ManageDepartments : System.Web.UI.Page
    {
        ITable table = null;

        protected void Page_Load(object sender, EventArgs e)
        {
           departmentStatus.Text = Messages.EmptyMessage;
           departmentStatus.CssClass = WebConstants.HideMessageCssClass;
        }

        protected void addDepartment_Click(object sender, EventArgs e)
        {
            table = new DepartmentTable();
            if (!String.IsNullOrEmpty(departmentTitle.Text))
            {
                table.Add(new Department(Constants.FAKE_ID, departmentTitle.Text));
                
                departmentStatus.Text = Messages.AddDepartmentSuccessfully;
                departmentStatus.CssClass = WebConstants.ShowMessageCssClass;
                
                departmentTitle.Text = String.Empty;

                viewDepartments.DataBind();
            }
        }
    }
}
