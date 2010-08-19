using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IProfessorRepository : IRepository<Professor>
    {
        Professor GetByNickName(string nickName);
        Professor GetByFullName(string fullName);
        IEnumerable<Professor> GetAll(string chairAlias);
        long GetMaxId();
        Professor Add(Professor obj);
        Professor Update(Professor obj);
        IEnumerable<Professor> Add(IEnumerable<Professor> professors);
    }
}