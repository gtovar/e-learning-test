using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class SpecialityDisciplinesRepository : Repository<SpecialityDiscipline>, ISpecialityDisciplinesRepository
    {
        public SpecialityDisciplinesRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public SpecialityDiscipline GetById(long id)
        {
            return DataContext.SpecialityDisciplines.SingleOrDefault(s => s.Id == id);
        }

        public IEnumerable<SpecialityDiscipline> GetAll(string specialityAlias)
        {
            return DataContext.SpecialityDisciplines.Where(s => s.Speciality.Alias == specialityAlias);
        }

        public bool IsEntryWithAliasExisted(string alias)
        {
            SpecialityDiscipline specialityDiscipline = DataContext.SpecialityDisciplines.SingleOrDefault(s => s.Alias == alias);
            if (null != specialityDiscipline)
            {
                return true;
            }
            return false;
        }

        public SpecialityDiscipline GetByAlias(string alias)
        {
            return DataContext.SpecialityDisciplines.SingleOrDefault(s => s.Alias == alias);
        }

        public void Delete(SpecialityDiscipline obj)
        {
            DataContext.SpecialityDisciplines.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.SpecialityDisciplines.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
