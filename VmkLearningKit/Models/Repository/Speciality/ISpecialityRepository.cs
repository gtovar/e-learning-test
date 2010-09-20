﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface ISpecialityRepository : IRepository<Speciality>
    {
        IEnumerable<Speciality> GetAll(string departmentAlias);
        List<Speciality> GetAllByEducationPlanTitle(string title);
        //bool IsEntryWithAliasExisted(string alias);
        Speciality GetByAlias(string alias);
        long GetMaxId();
        //Speciality GetByTitle(string title);
        Speciality GetByAbbreviation(string abbreviation);
        Speciality Add(Speciality obj);
        IEnumerable<Speciality> Add(IEnumerable<Speciality> specialities);
        Speciality GetByCode(string code);
    }
}