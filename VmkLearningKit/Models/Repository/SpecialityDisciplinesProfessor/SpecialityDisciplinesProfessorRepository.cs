using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class SpecialityDisciplinesProfessorRepository : Repository<SpecialityDisciplinesProfessor>, ISpecialityDisciplinesProfessorRepository
    {
        public SpecialityDisciplinesProfessorRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public SpecialityDisciplinesProfessor GetById(long id)
        {
            return null;
        }


        public SpecialityDisciplinesProfessor Add(SpecialityDisciplinesProfessor obj)
        {
            SpecialityDisciplinesProfessor objWithTheSameParams = DataContext.SpecialityDisciplinesProfessors.SingleOrDefault(t => (t.ProfessorId == obj.ProfessorId && t.SpecialityDisciplineId == obj.SpecialityDisciplineId));
            if (null != objWithTheSameParams)
            {
                return objWithTheSameParams;
            }

            DataContext.SpecialityDisciplinesProfessors.InsertOnSubmit(obj);
            DataContext.SubmitChanges();
            return obj;
        }

        public void Delete(SpecialityDisciplinesProfessor obj)
        {
            DataContext.SpecialityDisciplinesProfessors.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
        }

        public bool Exist(long professorId, long specialityDisciplineId)
        {
            if (null == DataContext.SpecialityDisciplinesProfessors.SingleOrDefault(t => (t.ProfessorId == professorId && t.SpecialityDisciplineId == specialityDisciplineId)))
                return false;

            return true;
        }
    }
}
