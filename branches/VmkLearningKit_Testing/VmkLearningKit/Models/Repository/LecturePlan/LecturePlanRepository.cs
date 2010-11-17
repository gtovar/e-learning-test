using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class LecturePlanRepository : Repository<LecturePlan>, ILecturePlanRepository
    {
        public LecturePlanRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public LecturePlan GetById(long id)
        {
            return DataContext.LecturePlans.SingleOrDefault(t => t.Id == id);
        }

        public void DeleteByTopicIdAndDate(long topicId, DateTime date)
        {
            LecturePlan plan = GetBySpecialityDisciplineTopicId(topicId).SingleOrDefault(t => t.Date.Value == date);

            Delete(plan);
        }

        public LecturePlan GetByTopicIdAndDate(long topicId, DateTime date)
        {
            return GetBySpecialityDisciplineTopicId(topicId).SingleOrDefault(t => t.Date.Value == date);
        }

        public LecturePlan SetDateTime(long id, DateTime dateTime)
        {
            try
            {
                LecturePlan lecturePlan = GetById(id);
                if (null != lecturePlan)
                {
                    lecturePlan.Date = dateTime;
                    DataContext.SubmitChanges();
                    return lecturePlan;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get lecturePlan by id: " + id + "!!!!", ex);
            }
            return null;
        }

        public IEnumerable<LecturePlan> GetBySpecialityDisciplineTopicId(long specialityDisciplineTopicId)
        {
            try
            {
                return DataContext.LecturePlans.Where(lp => lp.SpecialityDisciplineTopicId == specialityDisciplineTopicId);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get lecturePlans by specialityDisciplineTopicId: " + specialityDisciplineTopicId, ex);
            }
            return null;
        }

        public IEnumerable<LecturePlan> GetBySpecialityDisciplineId(long specialityDisciplineId)
        {
            try
            {
                return DataContext.LecturePlans.Where(lp => lp.SpecialityDisciplineId == specialityDisciplineId);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get lecturePlans by specialityDisciplineId: " + specialityDisciplineId, ex);
            }
            return null;
        }

        public LecturePlan Add(LecturePlan obj)
        {
            DataContext.LecturePlans.InsertOnSubmit(obj);
            DataContext.SubmitChanges();
            return obj;
        }

        public void Delete(LecturePlan obj)
        {
            DataContext.LecturePlans.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.LecturePlans.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
