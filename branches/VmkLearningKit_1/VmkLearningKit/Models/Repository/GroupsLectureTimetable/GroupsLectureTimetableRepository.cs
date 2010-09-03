using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class GroupsLectureTimetableRepository : Repository<GroupsLectureTimetable>, IGroupsLectureTimetableRepository
    {
        public GroupsLectureTimetableRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public GroupsLectureTimetable GetById(long id)
        {
            return DataContext.GroupsLectureTimetables.SingleOrDefault(t => t.Id == id);
        }

        public GroupsLectureTimetable Add(GroupsLectureTimetable obj)
        {
            try
            {
                DataContext.GroupsLectureTimetables.InsertOnSubmit(obj);
                DataContext.SubmitChanges();
                return obj;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't add groupsLectureTimetable", ex);
            }
            return null;
        }

        public void Delete(GroupsLectureTimetable obj)
        {
            try
            {
                DataContext.GroupsLectureTimetables.DeleteOnSubmit(obj);

                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't delete groupsLectureTimetable with id: " + obj.Id, ex);
            }
        }

        public void DeleteById(long id)
        {
            try
            {
                DataContext.GroupsLectureTimetables.DeleteOnSubmit(GetById(id));

                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't delete groupsLectureTimetable by id: " + id, ex);
            }
        }
    }
}
