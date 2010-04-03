using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IProfessorRepository : IRepository<Professor>
    {
        Professor GetByNickName(string NickName);
    }
}