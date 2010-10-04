using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface ISpecializationRepository : IRepository<Specialization>
    {
        IEnumerable<Specialization> GetAll(string specialityAlias, string educationPlanAlias, string chairAlias);
        IEnumerable<Specialization> GetAllBySpecialityIdAndEducationPlanTitle(long specialityId, string educationPlanTitle);
        //bool IsEntryWithAliasExisted(string alias);
        Specialization GetByAlias(string alias);
        long GetMaxId();
        Specialization GetByTitle(string title);
        Specialization Add(Specialization obj);
        Specialization GetByAbbreviation(string abbreviation);
        IEnumerable<Specialization> Add(IEnumerable<Specialization> specializations);
        Specialization Update(Specialization obj);
    }
}
