using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface ICommentRepository : IRepository<Comment>
    {
        void DeleteAllByStudentId(long studentId);
    }
}
