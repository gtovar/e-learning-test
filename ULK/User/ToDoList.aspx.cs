using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ToDoList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string user_login = User.Identity.Name;
        userLoginHidden.Value = User.Identity.Name;
    }

    protected void disciplinesList_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                int disciplineID = Convert.ToInt32(Request.Params["DisciplineID"]);
                for (int i = 0; i < disciplinesList.Items.Count; i++)
                {
                    if (Convert.ToInt32(disciplinesList.Items[i].Value) == disciplineID)
                    {
                        disciplinesList.SelectedIndex = i;
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}
