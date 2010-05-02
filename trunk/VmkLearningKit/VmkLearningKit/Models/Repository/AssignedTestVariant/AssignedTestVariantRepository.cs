using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class AssignedTestVariantRepository : Repository<AssignedTestVariant>, IAssignedTestVariantRepository
    {
        public AssignedTestVariantRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public AssignedTestVariant GetById(long id)
        {
            return DataContext.AssignedTestVariants.SingleOrDefault(ch => ch.Id == id);
        }

        public IEnumerable<AssignedTestVariant> GetAll(long studentId)
        {
            return DataContext.AssignedTestVariants.Where(t => t.StudentId == studentId);
        }

        public void Delete(AssignedTestVariant obj)
        {
            DataContext.AssignedTestVariants.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.AssignedTestVariants.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
