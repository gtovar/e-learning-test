﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public interface IGroupTable : ITable
    {
        List<Obj> GetAllByDepartmentId(int departmentId);
        Obj GetByGroupTitle(string groupTitle);
    }
}
