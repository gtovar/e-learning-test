using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class PracticeAndLabTimetableRepository : Repository<PracticeAndLabTimetable>, IPracticeAndLabTimetableRepository
    {
        public PracticeAndLabTimetableRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public PracticeAndLabTimetable GetById(long id)
        {
            return DataContext.PracticeAndLabTimetables.SingleOrDefault(t => t.Id == id);
        }

        public IEnumerable<PracticeAndLabTimetable> GetBySpecialityDisciplineId(long specialityDisciplineId)
        {
            try
            {
                return DataContext.PracticeAndLabTimetables.Where(lt => lt.SpecialityDisciplineId == specialityDisciplineId);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get practiceAndLabTimetables by specialityDisciplineId: " + specialityDisciplineId, ex);
            }
            return null;
        }

        public long GetMaxId()
        {
            try
            {
                IEnumerable<PracticeAndLabTimetable> list = DataContext.PracticeAndLabTimetables.OrderByDescending(lp => lp.Id);
                if (null != list && list.Count() > 0)
                {
                    return list.First().Id;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get max id from PracticeAndLabTimetable table in database !!!!", ex);
            }
            return 0;
        }

        public PracticeAndLabTimetable Add(PracticeAndLabTimetable obj)
        {
            try
            {
                DataContext.PracticeAndLabTimetables.InsertOnSubmit(obj);
                DataContext.SubmitChanges();
                return obj;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't add practiceAndLabTimetable", ex);
            }
            return null;
        }

        public void Delete(PracticeAndLabTimetable obj)
        {
            try
            {
                DataContext.PracticeAndLabTimetables.DeleteOnSubmit(obj);

                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't delete practiceAndLabTimetable with id: " + obj.Id, ex);
            }
        }

        public void DeleteById(long id)
        {
            try
            {
                DataContext.PracticeAndLabTimetables.DeleteOnSubmit(GetById(id));

                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't delete practiceAndLabTimetable by id: " + id, ex);
            }
        }
    }
}
