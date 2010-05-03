using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IChairRepository
    {
        IEnumerable<Chair> GetAll(string departmentAlias);
        Chair GetByAlias(string alias);
        Chair GetByAbbreviation(string abbreviation);
        Chair Add(Chair obj);
        long GetMaxId();
        Chair GetById(long id);
    }
}
