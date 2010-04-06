using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IQuestionRepository : IRepository<Question>
    {
        long GetRazdelIdByQuestionId(long id);
        IEnumerable<Question> GetAll();
        IEnumerable<Question> GetAllQuestionsByRazdelId(long razdelId);
        IEnumerable<Question> GetNotDeletedQuestionsByRazdelId(long razdelId);
        IEnumerable<Question> GetDeletedQuestionsByRazdelId(long razdelId);
        void Add(Question obj);
        void UpdateById(long updatedObjId, long newObjRazdelId, int newObjType, string newObjText, int newObjDoubleGroup, int newObjExclusionGroup, byte newObjIsDeleted, byte newObjCanCommented);
        void UpdateById(long updatedObjId, string newObjText, int newObjDoubleGroup, int newObjExclusionGroup, byte newObjIsDeleted, byte newObjCanCommented);
        void ChangeIsDeletedState(long id, byte newDeletedState);
        void ChangeCanCommentedState(long id, byte newCommentedState);
    }
}
