using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface ISpecialityDisciplineProgramRepository : IRepository<SpecialityDisciplineProgram>
    {
        SpecialityDisciplineProgram Add(SpecialityDisciplineProgram obj);
        List<string> GetTable(long disciplineProgramId, int fl);
        List<string> GetTable2(long disciplineProgramId, out List<string> table2);
        List<string> GetLiterature(long disciplineProgramId, out List<string> second);
        List<string> GetQuestions(long disciplineProgramId);
    }
}
