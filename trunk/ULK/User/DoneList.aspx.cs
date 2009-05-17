using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.LearningComponents;
using Microsoft.LearningComponents.Storage;
using Schema = BasicWebPlayer.Schema;
using dataSetTableAdapters;

public partial class User_DoneList : BasicWebPlayerBase // System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        userLoginHidden.Value = User.Identity.Name;

        LearningStoreJob job = LStore.CreateJob();
        RequestMyTraining(job, null);

        DataTable dataTable = job.Execute<DataTable>();
        foreach (DataRow dataRow in dataTable.Rows)
        {
            long activity_id = ((LearningStoreItemIdentifier)dataRow.ItemArray[4]).GetKey();
            int status = (int)dataRow.ItemArray[6];
            object score_obj = (object)dataRow.ItemArray[7];
            float score = 0;
            if (score_obj is float)
                score = (float)score_obj;
            if (status == 2)
            {
                QueriesTableAdapter testStatus = new QueriesTableAdapter();
                try
                {
                    int test_id = (int)testStatus.GetTestIdByActivity(activity_id);
                    testStatus.SetTestCompleted(test_id);
                    testStatus.SetTestStatus(2, test_id);
                    testStatus.SetTestScore(score, test_id);
                }
                catch (Exception ex)
                {
                }
            }

        }
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

    protected void disciplinesList_DataBinding(object sender, EventArgs e)
    {
        userLoginHidden.Value = User.Identity.Name;
    }
}
