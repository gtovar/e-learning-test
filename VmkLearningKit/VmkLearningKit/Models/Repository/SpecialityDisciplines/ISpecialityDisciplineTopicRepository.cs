using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    public interface ISpecialityDisciplineTopicRepository : IRepository<SpecialityDisciplineTopic>
    {
        IEnumerable<SpecialityDisciplineTopic> GetAll();
        //SpecialityDisciplineTopic GetByAlias(string alias);
        SpecialityDisciplineTopic GetByTitle(string title);
        long GetMaxId();
        SpecialityDisciplineTopic Add(SpecialityDisciplineTopic obj);
    }
}
