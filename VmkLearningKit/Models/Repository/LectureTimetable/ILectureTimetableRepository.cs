using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface ILectureTimetableRepository : IRepository<LectureTimetable>
    {
        IEnumerable<LectureTimetable> GetBySpecialityDisciplineId(long specialityDisciplineId);
        LectureTimetable Add(LectureTimetable obj);
        long GetMaxId();
    }
}
