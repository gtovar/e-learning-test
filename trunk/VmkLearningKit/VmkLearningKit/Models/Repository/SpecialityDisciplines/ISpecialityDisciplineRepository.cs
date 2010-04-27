using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface ISpecialityDisciplineRepository : IRepository<SpecialityDiscipline>
    {
       IEnumerable<SpecialityDiscipline> GetAll(string specialityAlias);
       IEnumerable<SpecialityDiscipline> GetAllByProfessor(string professorNickName);
       IEnumerable<SpecialityDiscipline> GetBySpecialityId(long specialityId);
       SpecialityDiscipline GetdBySpecialityDisciplineTopicId(long specialityDisciplineTopicId);
       //bool IsEntryWithAliasExisted(string alias);
       SpecialityDiscipline GetByAlias(string alias);
       SpecialityDiscipline GetByTitle(string title);
       SpecialityDiscipline Add(SpecialityDiscipline obj);
       long GetMaxId();
       IEnumerable<SpecialityDiscipline> GetAll(string specialityAlias, string educationPlanAlias, string chairAlias, string professorNickName);
    }
}
