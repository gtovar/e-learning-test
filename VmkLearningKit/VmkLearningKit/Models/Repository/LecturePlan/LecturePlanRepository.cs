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

        public LecturePlan SetDateTime(long id, DateTime dateTime)
        {
            try
            {
                LecturePlan lecturePlan = GetById(id);
                if (null != lecturePlan)
                {
                    lecturePlan.Date = dateTime;
                    DataContext.SubmitChanges();
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get lecturePlan by id: " + id + "!!!!", ex);
            }
            return null;
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
