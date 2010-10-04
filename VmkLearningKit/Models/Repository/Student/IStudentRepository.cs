﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IStudentRepository : IRepository<Student>
    {
        Student GetByNickName(string NickName);
        IEnumerable<Student> GetAll(string groupAlias);
        IEnumerable<Student> GetAll();
        long GetMaxId();
        Student Add(Student obj);
        IEnumerable<Student> Add(IEnumerable<Student> students);
        Student Update(Student obj);
    }
}