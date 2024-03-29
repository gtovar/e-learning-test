﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;

public partial class Admin_Groups_ManageGroups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void departmentsList_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                int departmentID = Convert.ToInt32(Request.Params["DepartmentID"]);
                for (int i = 0; i < departmentsList.Items.Count; i++)
                {
                    if (Convert.ToInt32(departmentsList.Items[i].Value) == departmentID)
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
    protected void addGroup_Click(object sender, EventArgs e)
    {
        string url = UrlConstants.AddGroupUrl + "?DepartmentID=" + departmentsList.SelectedValue.ToString();
        Response.Redirect(url);
    }
}
