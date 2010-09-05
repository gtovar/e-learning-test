using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface ISpecialityDisciplineProgramRepository : IRepository<SpecialityDisciplineProgram>
    {
        SpecialityDisciplineProgram Add(SpecialityDisciplineProgram obj);
        List<string> GetVolume(long disciplineProgramId);
    }
}
