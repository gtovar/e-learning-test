using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using UnnLearningKitLibrary;

public partial class Admin_Groups_DeleteGroups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void deleteGroup_Click(object sender, EventArgs e)
    {
        try
        {
            int groupID = Convert.ToInt32(Request.Params["GroupID"]);
            ITable groupTable = new GroupTable();
            Group group = (Group)groupTable.GetById(groupID);
            groupTable.Delete(groupID);


            ITable studentTable = new StudentTable();
            ((StudentTable)studentTable).DeleteAllStudentByGroupId(groupID);

            string url = UrlConstants.GroupsHomeUrl + "?DepartmentID=" + group.DepartmentId;
            Response.Redirect(url);
        }
        catch (Exception ex)
        {
        }
    }
}
