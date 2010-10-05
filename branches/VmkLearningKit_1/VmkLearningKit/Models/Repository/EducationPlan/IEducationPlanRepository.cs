using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IEducationPlanRepository : IRepository<EducationPlan>
    {
        IEnumerable<EducationPlan> GetAll();
        EducationPlan GetByAlias(string alias);
        EducationPlan GetByTitle(string title);
        long GetMaxId();
        EducationPlan Add(EducationPlan obj);
        void UpdateByAlias(string updatedObjId, EducationPlan newObj);
    }
}
