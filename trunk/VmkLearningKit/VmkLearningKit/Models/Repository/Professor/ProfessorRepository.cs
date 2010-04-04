using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class ProfessorRepository : Repository<Professor>, IProfessorRepository
    {
        public ProfessorRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public Professor GetById(long id)
        {
            return DataContext.Professors.SingleOrDefault(t => t.UserId == id);
        }

        public Professor GetByNickName(string NickName)
        {
            return DataContext.Professors.SingleOrDefault(s => s.User.NickName == NickName);
        }

        public void Delete(Professor obj)
        {
            DataContext.Professors.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Professors.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
