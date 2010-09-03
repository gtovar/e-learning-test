using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IPracticeAndLabTimetableRepository : IRepository<PracticeAndLabTimetable>
    {
        IEnumerable<PracticeAndLabTimetable> GetBySpecialityDisciplineId(long specialityDisciplineId);
        PracticeAndLabTimetable Add(PracticeAndLabTimetable obj);
        long GetMaxId();
    }
}
