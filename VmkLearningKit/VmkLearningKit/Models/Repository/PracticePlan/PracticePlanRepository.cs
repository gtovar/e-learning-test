using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class PracticePlanRepository : Repository<PracticePlan>, IPracticePlanRepository
    {
        public PracticePlanRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public PracticePlan GetById(long id)
        {
            return DataContext.PracticePlans.SingleOrDefault(t => t.Id == id);
        }

        public PracticePlan SetDateTime(long id, DateTime dateTime)
        {
            try
            {
                PracticePlan practicePlan = GetById(id);
                if (null != practicePlan)
                {
                    practicePlan.Date = dateTime;
                    DataContext.SubmitChanges();
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get practicePlan by id: " + id + "!!!!", ex);
            }
            return null;
        }


        public IEnumerable<PracticePlan> GetBySpecialityDisciplineTopicId(long specialityDisciplineTopicId)
        {
            try
            {
                return DataContext.PracticePlans.Where(pr => pr.SpecialityDisciplineTopicId == specialityDisciplineTopicId);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get practicePlans by specialityDisciplineTopicId: " + specialityDisciplineTopicId, ex);
            }
            return null;
        }

        public IEnumerable<PracticePlan> GetBySpecialityDisciplineTopicIdAndGroupId(long specialityDisciplineTopicId, long groupId)
        {
            try
            {
                return DataContext.PracticePlans.Where(pr => pr.SpecialityDisciplineTopicId == specialityDisciplineTopicId && pr.GroupId == groupId);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get practicePlans by specialityDisciplineTopicId and groupId: " + specialityDisciplineTopicId + " - " + groupId, ex);
            }
            return null;
        }

        public IEnumerable<PracticePlan> GetByGroupId(long groupId)
        {
            try
            {
                return DataContext.PracticePlans.Where(pr => pr.GroupId == groupId);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get practicePlans by groupId: " + groupId, ex);
            }
            return null;
        }

        public PracticePlan Add(PracticePlan obj)
        {
            IEnumerable<PracticePlan> practicePlans = null;
            if (obj.GroupId.HasValue)
            {
                practicePlans = GetBySpecialityDisciplineTopicIdAndGroupId(obj.SpecialityDisciplineTopicId, obj.GroupId.Value);
            }
            else
            {
                practicePlans = GetBySpecialityDisciplineTopicId(obj.SpecialityDisciplineTopicId);
            }
            if (null == practicePlans || practicePlans.Count() == 0)
            {
                DataContext.PracticePlans.InsertOnSubmit(obj);
                DataContext.SubmitChanges();
            }
            return obj;
        }

        public void Delete(PracticePlan obj)
        {
            try
            {
                DataContext.PracticePlans.DeleteOnSubmit(obj);
                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Cant't delete practicePlan by id: " + obj.Id, ex);
            }
        }

        public void DeleteById(long id)
        {
            try
            {
                DataContext.PracticePlans.DeleteOnSubmit(GetById(id));
                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Cant't delete practicePlan by id: " + id, ex);
            }
        }
    }
}