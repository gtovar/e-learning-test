using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface ISpecialityDisciplineTermRepository : IRepository<SpecialityDisciplineTerm>
    {
        long GetMaxId();
        SpecialityDisciplineTerm Add(SpecialityDisciplineTerm obj);
    }
}
