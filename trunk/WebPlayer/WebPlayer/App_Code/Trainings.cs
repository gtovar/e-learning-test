using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;
using System.Data.Linq;
using System.Web.Configuration;

public class Trainings : ITrainings
{
    [Table(Name = "dbo.AssignedTestVariants")]
    private class TrainingsTable
    {
        [Column(IsPrimaryKey = true, Name = "Id")]
        public Int64 TrainingId;
        [Column(Name = "State")]
        public int State;
        [Column(Name = "Score")]
        public int Score;
        [Column(Name = "StudentKey")]
        public string StudentKey;
        [Column(Name = "ProfessorKey")]
        public string LectorKey;
        [Column(Name = "Path")]
        public string PackagePath;
        [Column(Name = "PackageId")]
        public Int64 PackageId;
    }

    private DataContext db;
    private Table<TrainingsTable> trainingsTable;

    public Trainings()
	{
        db = new DataContext(WebConfigurationManager.AppSettings["vlkConnnectionString"]);
        trainingsTable = db.GetTable<TrainingsTable>();
	}

    public void SetScore(long TrainingId, int Score)
    {
        db.ExecuteCommand("UPDATE dbo.AssignedTestVariants SET Score = {0} WHERE Id = {1}", Score, TrainingId);
        db.SubmitChanges();
    }

    public void SetState(long TrainingId, int State)
    {
        db.ExecuteCommand("UPDATE dbo.AssignedTestVariants SET State = {0} WHERE Id = {1}", State, TrainingId);
        db.SubmitChanges();
    }

    public void SetPackageId(long TrainingId, long PackageId)
    {
        db.ExecuteCommand("UPDATE dbo.AssignedTestVariants SET PackageId = {0} WHERE Id = {1}", PackageId, TrainingId);
        db.SubmitChanges();
    }

    public TrainingInfo GetTrainingInfo(string Key)
    {
        TrainingInfo trainingInfo = new TrainingInfo();

        var training = trainingsTable.SingleOrDefault(t => t.StudentKey == Key);

        if (training == null)
        {
            trainingInfo.IsStudent = false;

            training = trainingsTable.SingleOrDefault(t => t.LectorKey == Key);

            if (training == null)
            {
                trainingInfo.IsLector = false;
            }
            else
            {
                trainingInfo.IsLector = true;
            }
        }
        else
        {
            trainingInfo.IsStudent = true;
        }

        if (!trainingInfo.IsLector && !trainingInfo.IsStudent)
        {
            return null;
        }

        trainingInfo.TrainingId = training.TrainingId;
        trainingInfo.PackageId = training.PackageId;
        trainingInfo.PackagePath = training.PackagePath;

        return trainingInfo;
    }
}