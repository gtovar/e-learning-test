using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    interface IStudentTable : ITable
    {
        List<Obj> GetAllStudentByGroupId(int groupId);
    }
}
