using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class SpecializationRepository : Repository<Specialization>, ISpecializationRepository
    {
        public SpecializationRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public Specialization GetById(long id)
        {
            return DataContext.Specializations.SingleOrDefault(s => s.Id == id);
        }

        public IEnumerable<Specialization> GetAll(string specialityAlias, string educationPlanAlias, string chairAlias)
        {
            return DataContext.Specializations.Where(s => s.Speciality.Alias == specialityAlias &&
                                                          s.EducationPlan.Alias == educationPlanAlias &&
                                                          s.Chair.Alias == chairAlias);
        }

        public bool IsEntryWithAliasExisted(string alias)
        {
            Specialization specialization = DataContext.Specializations.SingleOrDefault(s => s.Alias == alias);
            if (null != specialization)
            {
                return true;
            }
            return false;
        }

        public Specialization GetByAlias(string alias)
        {
            return DataContext.Specializations.SingleOrDefault(s => s.Alias == alias);
        }

        public void Delete(Specialization obj)
        {
            DataContext.Specializations.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Specializations.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
