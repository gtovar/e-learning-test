using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class TrainingInfo
{
    public Int64 TrainingId { get; set; }
    public string PackagePath { get; set; }
    public Int64 PackageId { get; set; }
    public bool IsStudent { get; set; }
    public bool IsLector { get; set; }

    public TrainingInfo()
    {
        TrainingId  = 0;
        PackageId   = 0;
        IsStudent   = false;
        IsLector    = false;
    }
}

public interface ITrainings
{
    void SetScore(long TrainingId, int Score);
    void SetState(long TrainingId, int State);
    void SetPackageId(long TrainingId, long PackageId);
    TrainingInfo GetTrainingInfo(string Key);
}