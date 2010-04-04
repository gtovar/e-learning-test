using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IStudentRepository : IRepository<Student>
    {
        Student GetByNickName(string NickName);
    }
}