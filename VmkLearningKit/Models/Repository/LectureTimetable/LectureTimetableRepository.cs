using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class LectureTimetableRepository : Repository<LectureTimetable>, ILectureTimetableRepository
    {
        public LectureTimetableRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public LectureTimetable GetById(long id)
        {
            return DataContext.LectureTimetables.SingleOrDefault(t => t.Id == id);
        }

        public IEnumerable<LectureTimetable> GetBySpecialityDisciplineId(long specialityDisciplineId)
        {
            try
            {
                return DataContext.LectureTimetables.Where(lt => lt.SpecialityDisciplineId == specialityDisciplineId);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get lectureTimetables by specialityDisciplineId: " + specialityDisciplineId, ex);
            }
            return null;
        }

        public long GetMaxId()
        {
            try
            {
                IEnumerable<LectureTimetable> list = DataContext.LectureTimetables.OrderByDescending(lp => lp.Id);
                if (null != list && list.Count() > 0)
                {
                    return list.First().Id;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get max id from LectureTimetable table in database !!!!", ex);
            }
            return 0;
        }

        public LectureTimetable Add(LectureTimetable obj)
        {
            try
            {
                DataContext.LectureTimetables.InsertOnSubmit(obj);
                DataContext.SubmitChanges();
                return obj;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't add lectureTimetable", ex);
            }
            return null;
        }

        public void Delete(LectureTimetable obj)
        {
            try
            {
                DataContext.LectureTimetables.DeleteOnSubmit(obj);

                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't delete lectureTimetable with id: " + obj.Id, ex);
            }
        }

        public void DeleteById(long id)
        {
            try
            {
                DataContext.LectureTimetables.DeleteOnSubmit(GetById(id));

                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't delete lectureTimetable by id: " + id, ex);
            }
        }

        public LectureTimetable Get(long specialityDisciplineId, string dayOfWeek, string time)
        {
            return DataContext.LectureTimetables.SingleOrDefault(t => (t.SpecialityDisciplineId == specialityDisciplineId && t.Day == dayOfWeek && t.Time == time));
        }

        public LectureTimetable Get(long specialityDisciplineId, long professorId)
        {
            return DataContext.LectureTimetables.SingleOrDefault(t => (t.SpecialityDisciplineId == specialityDisciplineId && t.ProfessorId == professorId));
        }

        public void DeleteAll(long departmentId)
        {
            foreach (LectureTimetable lt in DataContext.LectureTimetables)
            {
                if (lt.SpecialityDiscipline.Speciality.DepartmentId == departmentId)
                {
                    foreach (GroupsLectureTimetable obj in DataContext.GroupsLectureTimetables.Where(t=>t.LectureTimetableId == lt.Id))
                    {
                        DataContext.GroupsLectureTimetables.DeleteOnSubmit(obj);
                    }
                    DataContext.LectureTimetables.DeleteOnSubmit(lt);
                }
            }

            DataContext.SubmitChanges();
        }
    }
}
