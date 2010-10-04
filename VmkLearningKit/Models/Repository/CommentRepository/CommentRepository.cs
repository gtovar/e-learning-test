using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class CommentRepository : Repository<Comment>, ICommentRepository
    {
        public CommentRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public Comment GetById(long id)
        {
            return DataContext.Comments.SingleOrDefault(ch => ch.Id == id);
        }

        public void Delete(Comment obj)
        {
            DataContext.Comments.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Comments.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }

        public void DeleteAllByStudentId(long studentId)
        {
            try
            {
                foreach (Comment comment in DataContext.Comments)
                {
                    if (comment.StudentId == studentId) DataContext.Comments.DeleteOnSubmit(comment);
                }

                DataContext.SubmitChanges();
            }
            catch (Exception exc)
            {
                Utility.WriteToLog("ERROR!");
            }
        }
    }
}
