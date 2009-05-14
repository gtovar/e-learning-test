using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public interface IChairTable : ITable
    {
        List<Obj> GetAllByDepartmentId(int departmentId);
    }
}
