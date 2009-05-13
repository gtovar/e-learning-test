using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public interface IStudentTable : ITable
    {
        int GetStudentIdByName(string name);
    }
}
