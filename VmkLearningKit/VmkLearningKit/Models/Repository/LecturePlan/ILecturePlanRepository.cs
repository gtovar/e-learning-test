using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface ILecturePlanRepository : IRepository<LecturePlan>
    {
        LecturePlan SetDateTime(long id, DateTime dateTime);
        IEnumerable<LecturePlan> GetBySpecialityDisciplineTopicId(long specialityDisciplineTopicId);
        IEnumerable<LecturePlan> GetBySpecialityDisciplineId(long specialityDisciplineId);
        LecturePlan Add(LecturePlan obj);
    }
}
