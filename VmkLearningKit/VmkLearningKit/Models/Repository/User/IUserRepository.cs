﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IUserRepository : IRepository<User>
    {
        User GetByLogin(string login);
        long GetMaxId();
        bool ChangePassword(long id, string password);
        User Add(User obj);
        User Update(User obj);
        bool IsNickNameExists(long id, string nickName);
        IEnumerable<User> GetByGroupId(long id);
    }
}
