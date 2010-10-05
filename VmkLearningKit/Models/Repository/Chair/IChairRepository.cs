﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IChairRepository : IRepository<Chair>
    {
        IEnumerable<Chair> GetAll(string departmentAlias);
        Chair GetByAlias(string alias);
        Chair GetByAbbreviation(string abbreviation);
        Chair Add(Chair obj);
        long GetMaxId();
        IEnumerable<Chair> Add(IEnumerable<Chair> chairs);
        Chair GetByAliasAndDepartment(string alias, long idDepartment);
        void UpdateByAlias(string updatedObjId, Chair newObj);
    }
}
