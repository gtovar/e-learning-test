using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IGroupsLectureTimetableRepository : IRepository<GroupsLectureTimetable>
    {
        GroupsLectureTimetable Add(GroupsLectureTimetable obj);
    }
}
