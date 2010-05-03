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

        public bool IsNickNameExists(long id, string nickName)
        {
            try
            {
                User user = GetById(id);
                if (user.NickName.Trim().Equals(nickName.Trim()))
                {
                    return false;
                }
                IEnumerable<User> users = DataContext.Users.Where(u => u.NickName == nickName);
                if (null != users && users.Count() > 1)
                {
                    Utility.WriteToLog("!!!!IMPORTANT More than on entry exists in user table with the same nickNames: " + nickName, LogLevel.Error);
                    return true;
                }
                if (null == users || users.Count() == 0)
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get user by nickName: " + nickName, ex);
            }
            return true;
        }

        public bool ChangePassword(long id, string password)
        {
            try
            {
                User user = GetById(id);
                if (null != user)
                {
                    user.Password = password;
                    DataContext.SubmitChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't change user password by id: " + id + "!!!!", ex);
            }
            return false;
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

        public User Update(User obj)
        {
            try
            {
                User user = GetByLogin(obj.Login);
                if (null != user)
                {
                    DataContext.SubmitChanges();
                    return user;
                }
                return user;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("User can't add to database", ex);
            }
            return null;
        }

        public long GetMaxId()
        {
            try
            {
                IEnumerable<User> list = DataContext.Users.OrderByDescending(u => u.Id);
                if (null != list && list.Count() > 0)
                {
                    return list.First().Id;
                }
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!IMPORTANT Can't get max id from User table in database !!!!", ex);
            }
            return 0;
        }

        public IEnumerable<User> GetByGroupId(long id)
        {
            try
            {
                var res = from st in DataContext.Students
                          from u in DataContext.Users
                          where st.GroupId == id && u.Id == st.UserId
                          select u;
                return res;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("!!!!в базе данных нет студентов принадлежащих группе с id " + id + "!!!!", ex);

                return null;
            }
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
