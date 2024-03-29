﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface ISpecialityRepository : IRepository<Speciality>
    {
        IEnumerable<Speciality> GetAll(string departmentAlias);
        //bool IsEntryWithAliasExisted(string alias);
        Speciality GetByAlias(string alias);
        long GetMaxId();
        //Speciality GetByTitle(string title);
        Speciality GetByAbbreviation(string abbreviation);
        Speciality Add(Speciality obj);
    }
}
