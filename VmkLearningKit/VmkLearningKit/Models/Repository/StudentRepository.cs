using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class StudentRepository : Repository<Student>, IStudentRepository
    {
        public StudentRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public Student GetById(long id)
        {
            return DataContext.Students.SingleOrDefault(t => t.UserId == id);
        }

        public Student GetByNickName(string NickName)
        {
            return DataContext.Students.SingleOrDefault(s => s.User.NickName == NickName);
        }
    }
}
