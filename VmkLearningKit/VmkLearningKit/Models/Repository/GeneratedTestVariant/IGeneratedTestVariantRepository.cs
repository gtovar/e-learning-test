using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IGeneratedTestVariantRepository : IRepository<GeneratedTestVariant>
    {
        IEnumerable<GeneratedTestVariant> GetAllGeneratedTestVariantsByGeneratedTestId(long testId);
        //int GetGeneratedTestVariantLocalIdByGeneratedTestVariantId(long generatedTestVariantId);
        GeneratedTestVariant Add(long testId);
        IEnumerable<GeneratedTestVariant> GetCurrentVariantsTestByTopicId(long topicId);
        long GetCountCurrentTopicTestVariants(long topicId);
        long GetLocalNumGeneratedTestVariant(long idGeneratedTestVariant);
        IEnumerable<GeneratedTestVariant> GetAllGeneratedTestVariantsByTopicId(long topicId);
         
        
    }
}
