using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IGeneratedQuestionRepository : IRepository<GeneratedQuestion>
    {
        IEnumerable<GeneratedQuestion> GetAllGeneratedQuestionsByGeneratedTestVariantId(long generatedTestVariantId);
    }
}
