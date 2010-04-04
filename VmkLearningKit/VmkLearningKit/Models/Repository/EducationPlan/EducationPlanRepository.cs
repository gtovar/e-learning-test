using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class EducationPlanRepository : Repository<EducationPlan>, IEducationPlanRepository
    {
        public EducationPlanRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public EducationPlan GetById(long id)
        {
            return DataContext.EducationPlans.SingleOrDefault(ed => ed.Id == id);
        }

        public IEnumerable<EducationPlan> GetAll()
        {
            return DataContext.EducationPlans.OrderBy(ed => ed.Id);
        }

        public void Delete(EducationPlan obj)
        {
            DataContext.EducationPlans.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.EducationPlans.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
