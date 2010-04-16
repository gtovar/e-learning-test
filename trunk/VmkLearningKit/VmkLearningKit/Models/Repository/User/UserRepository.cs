using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class UserRepository: Repository<User>, IUserRepository
    {
        public UserRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public User GetById(long id)
        {
            return DataContext.Users.SingleOrDefault(t => t.Id == id);
        }

        public User GetByLogin(string login)
        {
            return DataContext.Users.SingleOrDefault(t => t.Login == login);
        }

        public User Add(User obj)
        {
            try
            {
                User user = GetByLogin(obj.Login);
                if (null == user)
                {
                    DataContext.Users.InsertOnSubmit(obj);
                    DataContext.SubmitChanges();
                    return obj;
                }
                return user;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("User can't add to database", ex);
            }
            return null;
        }

        public void Delete(User obj)
        {
            DataContext.Users.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Users.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
