﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface ISpecializationRepository : IRepository<Specialization>
    {
        IEnumerable<Specialization> GetAll(string specialityAlias, string educationPlanAlias, string chairAlias);
        bool IsEntryWithAliasExisted(string alias);
        Specialization GetByAlias(string alias);
    }
}