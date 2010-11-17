using System;
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
        IEnumerable<User> Add(IEnumerable<User> users);
        User Update(User obj);
        bool IsNickNameExists(long id, string nickName);
        IEnumerable<User> GetByGroupId(long id);
        User GetByFIO(string firstName, string lastName, string patronymic);
        IEnumerable<User> GetAll();
        bool DeleteStudent(long id);
        bool DeleteProfessor(long id);
        User GetProfessorByLastName(string lastName);
    }
}
