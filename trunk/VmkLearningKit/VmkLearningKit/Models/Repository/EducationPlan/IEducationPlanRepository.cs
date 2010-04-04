using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IEducationPlanRepository : IRepository<EducationPlan>
    {
        IEnumerable<EducationPlan> GetAll();
    }
}
