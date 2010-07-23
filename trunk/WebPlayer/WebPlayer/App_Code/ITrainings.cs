using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class TrainingInfo
{
    public Int64 TrainingId { get; set; }
    public string StudentKey { get; set; }
    public string LectorKey { get; set; }
    public string PackagePath { get; set; }
    public Int64 PackageId { get; set; }
}

public interface ITrainings
{
    void SetScore(long TrainingId, int Score);
    void SetState(long TrainingId, int State);
    void SetPackageId(long TrainingId, long PackageId);
    TrainingInfo GetTrainingInfo(string Key);
}