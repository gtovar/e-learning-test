using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Globalization;
using System.IO;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.LearningComponents;
using Microsoft.LearningComponents.Storage;
using Schema = BasicWebPlayer.Schema;
using dataSetTableAdapters;

public partial class CreateAttempt : BasicWebPlayerBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void CreateAttemptButton_Click(object sender, EventArgs e)
    {
        QueriesTableAdapter testStatus = new QueriesTableAdapter();
        int test_id = Convert.ToInt32(OrganizationId.Value);
        int status = (int)testStatus.GetTestStatus(test_id);
        string path = testStatus.GetTestPath(test_id);

        if (status == 0)
        {
            testStatus.SetTestStatus(1, test_id);
            long activity_id = UploadPackage(path);

            AutoPostScript.Visible = false;

            PleaseWait.Visible = false;

            try
            {
                LStoreUserInfo currentUser = GetCurrentUserInfo();

                ActivityPackageItemIdentifier organizationId = new ActivityPackageItemIdentifier(
                    Convert.ToInt64(activity_id.ToString(), CultureInfo.InvariantCulture));

                StoredLearningSession session = StoredLearningSession.CreateAttempt(PStore,
                    currentUser.Id, organizationId, LoggingOptions.LogAll);

                AttemptId.Value = Convert.ToString(session.AttemptId.GetKey(), CultureInfo.InvariantCulture);
                testStatus.SetTestActivity(session.AttemptId.GetKey(), test_id);
                UpdateParentPageScript.Visible = true;
                CloseDialogScript.Visible = true;
            }
            catch (Exception ex)
            {
            }
        }
        else
        {
            AutoPostScript.Visible = false;

            long attemptId = (long)testStatus.GetTestActivity(test_id);

            PleaseWait.Visible = false;
            AttemptId.Value = Convert.ToString(attemptId.ToString(), CultureInfo.InvariantCulture);
            UpdateParentPageScript.Visible = true;
            CloseDialogScript.Visible = true;
        }
    }

    protected long UploadPackage(string test_file)
    {
        long activity_id = -1;

        try
        {
            LStoreUserInfo currentUser = GetCurrentUserInfo();

            PackageItemIdentifier packageId;
            ValidationResults importLog;
            FileStream testFileStream = new FileStream(test_file, FileMode.Open);
            using (PackageReader packageReader = PackageReader.Create(testFileStream))
            {
                AddPackageResult result = PStore.AddPackage(packageReader, new PackageEnforcement(false, false, false));
                packageId = result.PackageId;
                importLog = result.Log;
            }

            testFileStream.Close();

            FileInfo fi = new FileInfo(test_file);
            string fileName = fi.Name;

            LearningStoreJob job = LStore.CreateJob();
            Dictionary<string, object> properties = new Dictionary<string, object>();
            properties[Schema.PackageItem.Owner] = currentUser.Id;
            properties[Schema.PackageItem.FileName] = fileName; 
            properties[Schema.PackageItem.UploadDateTime] = DateTime.Now;
            job.UpdateItem(packageId, properties);
            job.Execute();

            job = LStore.CreateJob();
            RequestMyTraining(job, packageId);
            
            DataTable dataTable = job.Execute<DataTable>();
            foreach (DataRow dataRow in dataTable.Rows)
            {
                activity_id = ((LearningStoreItemIdentifier)dataRow.ItemArray[2]).GetKey();
            }

        }
        catch (PackageImportException ex)
        {
        }
        catch (Exception ex)
        {
        }

        return activity_id;
    }

}
