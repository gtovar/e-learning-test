using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.LearningComponents.Storage;
using Schema = WebPlayer.Schema;
using LearningComponentsHelper;
using System.Collections.ObjectModel;
using System.Data;
using System.IO;

namespace Microsoft.LearningComponents.Frameset
{
    public partial class Execute : FramesetPage
    {
        public string PageTitle = "Тест";
        public string LoadingMsg = "Идёт загрузка теста";
        public string TestUrl = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string Key = Page.Request["Key"];

            if (Key == null || Key == "")
            {
                RegisterError("Не указан ключ", "Укажите ключ для доступа к тесту", false);
            }
            else
            {
                ITrainings trainings = new Trainings();
                TrainingInfo trainingInfo = trainings.GetTrainingInfo(Key);

                if (trainingInfo == null)
                {
                    RegisterError("Тест не найден", "Возможно задан не верный ключ", false);
                }
                else
                {
                    
                        PackageItemIdentifier packageId;

                        LearningStoreJob job = LStore.CreateJob();
                        RequestCurrentUserInfo(job);
                        ReadOnlyCollection<object> results = job.Execute();
                        LStoreUserInfo currentUser = GetCurrentUserInfoResults((DataTable)results[0]);

                        if (trainingInfo.PackageId == 0)
                        {
                            FileInfo file = new FileInfo(trainingInfo.PackagePath);

                            Stream fileStream = new FileStream(trainingInfo.PackagePath, FileMode.Open);

                            using (PackageReader packageReader = PackageReader.Create(fileStream))
                            {
                                AddPackageResult result = PStore.AddPackage(packageReader, new PackageEnforcement(false, false, false));
                                packageId = result.PackageId;
                            }

                            job = LStore.CreateJob();
                            Dictionary<string, object> properties = new Dictionary<string, object>();
                            properties[Schema.PackageItem.Owner] = currentUser.Id;
                            properties[Schema.PackageItem.FileName] = file.Name;
                            properties[Schema.PackageItem.UploadDateTime] = DateTime.Now;
                            job.UpdateItem(packageId, properties);
                            job.Execute();

                            trainings.SetPackageId(trainingInfo.TrainingId, packageId.GetKey());
                            trainingInfo.PackageId = packageId.GetKey();
                        }
                        else
                        {
                            packageId = new PackageItemIdentifier(trainingInfo.PackageId);
                        }

                        job = LStore.CreateJob();
                        RequestMyTraining(job, packageId);
                        results = job.Execute();
                        DataRow dataRow = ((DataTable)results[0]).Rows[0];

                        AttemptItemIdentifier attemptId;
                        LStoreHelper.Cast(dataRow[Schema.MyAttemptsAndPackages.AttemptId], out attemptId);

                        ActivityPackageItemIdentifier organizationId;
                        LStoreHelper.CastNonNull(dataRow[Schema.MyAttemptsAndPackages.OrganizationId], out organizationId);

                        if (attemptId == null)
                        {
                            StoredLearningSession session = StoredLearningSession.CreateAttempt(PStore, currentUser.Id, organizationId, LoggingOptions.None);
                            attemptId = session.AttemptId;
                            trainings.SetState(trainingInfo.TrainingId, 2);
                        }

                        Application["TrainingId"] = trainingInfo.TrainingId;

                        TestUrl = "./Frameset/Frameset.aspx?View=0&AttemptId=" + attemptId.GetKey();
                    
                 

                }
            }
        }

        protected void RequestMyTraining(LearningStoreJob job, PackageItemIdentifier packageId)
        {
            LearningStoreQuery query = LStore.CreateQuery(Schema.MyAttemptsAndPackages.ViewName);
            query.AddColumn(Schema.MyAttemptsAndPackages.PackageId);
            query.AddColumn(Schema.MyAttemptsAndPackages.PackageFileName);
            query.AddColumn(Schema.MyAttemptsAndPackages.OrganizationId);
            query.AddColumn(Schema.MyAttemptsAndPackages.OrganizationTitle);
            query.AddColumn(Schema.MyAttemptsAndPackages.AttemptId);
            query.AddColumn(Schema.MyAttemptsAndPackages.UploadDateTime);
            query.AddColumn(Schema.MyAttemptsAndPackages.AttemptStatus);
            query.AddColumn(Schema.MyAttemptsAndPackages.TotalPoints);
            query.AddSort(Schema.MyAttemptsAndPackages.UploadDateTime,
                LearningStoreSortDirection.Ascending);
            query.AddSort(Schema.MyAttemptsAndPackages.OrganizationId,
                LearningStoreSortDirection.Ascending);
            if (packageId != null)
            {
                query.AddCondition(Schema.MyAttemptsAndPackages.PackageId,
                    LearningStoreConditionOperator.Equal, packageId);
            }
            job.PerformQuery(query);
        }
    }
}