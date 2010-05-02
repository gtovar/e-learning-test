using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IGeneratedTestRepository : IRepository<GeneratedTest>
    {
        IEnumerable<GeneratedTest> GetAllGeneratedTestsBySpecialityDisciplineTopicId(int specialityDisciplineTopicId);
        GeneratedTest Add(long specialityDisciplineTopicId, int variantCount, int questionCount);
    }
}
