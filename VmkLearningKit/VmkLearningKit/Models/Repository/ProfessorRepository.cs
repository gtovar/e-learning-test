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
    }
}
