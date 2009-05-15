using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public interface IDisciplinePartTable : ITable
    {
        void DeleteAllDisciplinePartsByDisciplineId(int disciplineID);
    }
}
