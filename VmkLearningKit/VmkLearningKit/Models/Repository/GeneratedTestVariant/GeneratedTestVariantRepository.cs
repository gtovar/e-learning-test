using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class GeneratedTestVariantRepository : Repository<GeneratedTestVariant>, IGeneratedTestVariantRepository
    {
        public GeneratedTestVariantRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        #region Get

        public GeneratedTestVariant GetById(long id)
        {
            return DataContext.GeneratedTestVariants.SingleOrDefault(t => t.Id == id);
        }

        public IEnumerable<GeneratedTestVariant> GetAllGeneratedTestVariantsByGeneratedTestId(long generatedTestId)
        {
            var result = (from c in DataContext.GeneratedTestVariants
                          where c.GeneratedTestId == generatedTestId
                          select c);

            return (IEnumerable<GeneratedTestVariant>)result;
        }

        #endregion

        #region Set

        public GeneratedTestVariant Add(long testId)
        {
            GeneratedTestVariant gtv = new GeneratedTestVariant();
            gtv.GeneratedTestId = testId;

            return gtv;
        }

        #endregion

        #region Delete

        public void Delete(GeneratedTestVariant obj)
        {
            DataContext.GeneratedTestVariants.DeleteOnSubmit(obj);
            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.GeneratedTestVariants.DeleteOnSubmit(GetById(id));
            DataContext.SubmitChanges();
        }

        #endregion
    }
}
