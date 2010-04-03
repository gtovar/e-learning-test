using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface ISpecialityDisciplinesRepository : IRepository<SpecialityDiscipline>
    {
       IEnumerable<SpecialityDiscipline> GetAll(string specialityAlias);
       bool IsEntryWithAliasExisted(string alias);
       SpecialityDiscipline GetByAlias(string alias);
    }
}
