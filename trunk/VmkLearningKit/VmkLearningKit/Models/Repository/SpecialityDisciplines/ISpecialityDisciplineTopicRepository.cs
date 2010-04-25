using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    public interface ISpecialityDisciplineTopicRepository : IRepository<SpecialityDisciplineTopic>
    {
        IEnumerable<SpecialityDisciplineTopic> GetAllBySpecialityDisciplineId(long specialityDisciplineId);
        //SpecialityDisciplineTopic GetByAlias(string alias);
        SpecialityDisciplineTopic GetByTitle(string title);
        SpecialityDisciplineTopic SetTitle(long id, string title);
        long GetMaxId();
        int GetRazdelCountBySpecialityDisciplineTopicId(long specialityDisciplineTopicId);
        int GetQuestionCountBySpecialityDisciplineTopicId(long specialityDisciplineTopicId);
        int GetQuestionCountInTestVariantBySpecialityDisciplineTopicId(long specialityDisciplineTopicId);
        SpecialityDisciplineTopic Add(SpecialityDisciplineTopic obj);
    }
}
