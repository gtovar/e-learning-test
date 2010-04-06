﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IChairRepository
    {
        IEnumerable<Chair> GetAll(string departmentAlias);
        bool IsEntryWithAliasExisted(string alias);
        Chair GetByAlias(string alias);
    }
}