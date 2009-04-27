using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public interface IDisciplineTable : ITable
    {
        List<Obj> GetAllByDepartmentId(int departmentId);
    }
}
