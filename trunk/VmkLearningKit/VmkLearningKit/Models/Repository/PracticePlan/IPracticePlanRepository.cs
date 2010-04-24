using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IPracticePlanRepository : IRepository<PracticePlan>
    {
        PracticePlan SetDateTime(long id, DateTime dateTime);
        IEnumerable<PracticePlan> GetBySpecialityDisciplineTopicId(long specialityDisciplineTopicId);
        IEnumerable<PracticePlan> GetByGroupId(long groupId);
        IEnumerable<PracticePlan> GetBySpecialityDisciplineTopicIdAndGroupId(long specialityDisciplineTopicId, long groupId);
        PracticePlan Add(PracticePlan obj);
    }
}
