using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IQuestionRepository : IRepository<Question>
    {
        long GetRazdelIdByQuestionId(long id);
        int GetQuestionType(long id);
        IEnumerable<Question> GetQuestionsById(long id);
        IEnumerable<Question> GetAll();
        IEnumerable<Question> GetAllQuestionsByRazdelId(long razdelId);
        IEnumerable<Question> GetNotDeletedQuestionsByRazdelId(long razdelId);
        IEnumerable<Question> GetDeletedQuestionsByRazdelId(long razdelId);
        long Add(long razdelId, string title, int type, string text, byte canCommented);
        void Add(Question obj);
        void UpdateById(long updatedObjId, string title, string text, byte CanCommented);
        void ChangeIsDeletedState(long id, byte newDeletedState);
        void ChangeCanCommentedState(long id, byte newCommentedState);
    }
}
