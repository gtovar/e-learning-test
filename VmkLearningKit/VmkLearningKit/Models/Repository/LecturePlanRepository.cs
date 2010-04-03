using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class LecturePlanRepository : Repository<LecturePlan>, IRepository<LecturePlan>
    {
        public LecturePlanRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public LecturePlan GetById(long id)
        {
            return DataContext.LecturePlans.SingleOrDefault(t => t.Id == id);
        }
    }
}
