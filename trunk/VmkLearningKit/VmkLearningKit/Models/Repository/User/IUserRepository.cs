using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IUserRepository : IRepository<User>
    {
        User GetByLogin(string login);
    }
}
