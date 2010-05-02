using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IAssignedTestVariantRepository : IRepository<AssignedTestVariant>
    {
        IEnumerable<AssignedTestVariant> GetAll(long studentId);
    }
}
