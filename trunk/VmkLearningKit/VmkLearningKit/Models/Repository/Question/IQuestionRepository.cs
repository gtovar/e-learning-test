using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IQuestionRepository : IRepository<Question>
    {
        int GetDifferentDoubleGroupsCountInRazdel(long razdelId);
        int GetDifferentExclusionGroupsCountInRazdel(long razdelId);
        long GetRazdelIdByQuestionId(long id);
        int GetQuestionType(long id);
        int GetAnswersCountByQuestionId(long questionId);
        int GetQuestionLocalIdByQuestionId(long questionId);
        double GetMaxScoreQuestionByQuestionId(long questionId);
        string GetFullQuestionLocalIdByQuestionId(long questionId);
        IEnumerable<Answer> GetAllAnswersByQuestionId(long questionId);
        IEnumerable<Question> GetQuestionsById(long id);
        IEnumerable<Question> GetAll();
        IEnumerable<Question> GetAllQuestionsByRazdelId(long razdelId);
        IEnumerable<Question> GetNotDeletedQuestionsByRazdelIdSortedByDoubleGroup(long razdelId);
        IEnumerable<Question> GetNotDeletedQuestionsByRazdelIdWithFakeDoubleGroup(long razdelId);
        IEnumerable<Question> GetNotDeletedQuestionsByRazdelIdSortedByExclusionGroup(long razdelId);
        IEnumerable<Question> GetNotDeletedQuestionsByRazdelIdWithFakeExclusionGroup(long razdelId);        
        IEnumerable<Question> GetNotDeletedQuestionsByRazdelId(long razdelId);
        IEnumerable<Question> GetDeletedQuestionsByRazdelId(long razdelId);
        int GetMaxQuestionDoubleGroupInRazdel(long razdelId);
        int GetMaxQuestionExclusionGroupInRazdel(long razdelId);
        long Add(long razdelId, string title, int type, string text, byte canCommented);
        void Add(Question obj);
        void UpdateById(long updatedObjId, string title, string text, byte CanCommented);
        void ChangeIsDeletedState(long id, byte newDeletedState);
        void ChangeCanCommentedState(long id, byte newCommentedState);
        void ChangeDoubleGroup(long id, int groupIndex);
        void ChangeExclusionGroup(long id, int groupIndex);
    }
}
