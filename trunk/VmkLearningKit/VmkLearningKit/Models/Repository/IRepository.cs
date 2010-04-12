﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IRepository<T>
    {
        T GetById(long id);
        void DeleteById(long id);
        void Delete(T obj);
    }
}