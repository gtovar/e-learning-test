using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface ISpecialityDisciplinesProfessorRepository : IRepository<SpecialityDisciplinesProfessor>
    {
        SpecialityDisciplinesProfessor Add(SpecialityDisciplinesProfessor obj);
        bool Exist(long professorId, long specialityDisciplineId);
    }
}
