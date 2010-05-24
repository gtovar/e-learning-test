using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IGeneratedTestRepository : IRepository<GeneratedTest>
    {
        IEnumerable<GeneratedTest> GetAllGeneratedTestsBySpecialityDisciplineTopicId(int specialityDisciplineTopicId);
        long GetGeneratedTestIdByGeneratedTestVariantId(long generatedTestVariantId);
        GeneratedTest Add(long specialityDisciplineTopicId, int variantCount, int questionCount);
        GeneratedTest GetLastGeneratedTestByTopicId(long topicId);
        IEnumerable<GeneratedTest> GetAllGeneratedTestsByTopicId(long topicId);
        
    }
}
