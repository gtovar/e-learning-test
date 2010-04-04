using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class PracticePlanRepository : Repository<PracticePlan>, IRepository<PracticePlan>
    {
        public PracticePlanRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public PracticePlan GetById(long id)
        {
            return DataContext.PracticePlans.SingleOrDefault(t => t.Id == id);
        }

        public void Delete(PracticePlan obj)
        {
            DataContext.PracticePlans.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.PracticePlans.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}