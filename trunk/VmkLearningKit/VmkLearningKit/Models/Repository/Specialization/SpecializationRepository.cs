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
