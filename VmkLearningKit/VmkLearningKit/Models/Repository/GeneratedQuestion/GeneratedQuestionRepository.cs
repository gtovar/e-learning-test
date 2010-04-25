using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class GeneratedQuestionRepository : Repository<GeneratedQuestion>, IGeneratedQuestionRepository
    {
        public GeneratedQuestionRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        #region Get

        public GeneratedQuestion GetById(long id)
        {
            return DataContext.GeneratedQuestions.SingleOrDefault(t => t.Id == id);
        }

        public IEnumerable<GeneratedQuestion> GetAllGeneratedQuestionsByGeneratedTestVariantId(long generatedTestVariantId)
        {
            var result = (from c in DataContext.GeneratedQuestions
                          where c.GeneratedTestVariantId == generatedTestVariantId
                          select c);

            return (IEnumerable<GeneratedQuestion>)result;
        }

        #endregion

        #region Delete

        public void Delete(GeneratedQuestion obj)
        {
            DataContext.GeneratedQuestions.DeleteOnSubmit(obj);
            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.GeneratedQuestions.DeleteOnSubmit(GetById(id));
            DataContext.SubmitChanges();
        }

        #endregion
    }
}
