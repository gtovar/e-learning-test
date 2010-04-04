using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class SpecialityRepository : Repository<Speciality>, ISpecialityRepository
    {
        public SpecialityRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public Speciality GetById(long id)
        {
            return DataContext.Specialities.SingleOrDefault(s => s.Id == id);
        }

        public IEnumerable<Speciality> GetAll(string departmentTitle)
        {
            return DataContext.Specialities.Where(s => s.Department.Title == departmentTitle);

        }

        public bool IsEntryWithAliasExisted(string alias)
        {
            Speciality speciality = DataContext.Specialities.SingleOrDefault(s => s.Alias == alias);
            if (null != speciality)
            {
                return true;
            }
            return false;
        }

        public Speciality GetByAlias(string alias)
        {
            return DataContext.Specialities.SingleOrDefault(s => s.Alias == alias);
        }

        public void Delete(Speciality obj)
        {
            DataContext.Specialities.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Specialities.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
