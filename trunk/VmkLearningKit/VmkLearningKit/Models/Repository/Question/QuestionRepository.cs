using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class QuestionRepository : Repository<Question>, IQuestionRepository
    {
        public QuestionRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        #region Get

        public IEnumerable<Question> GetQuestionsById(long id)
        {
            return DataContext.Questions.Where(t => t.Id == id);
        }

        public long GetRazdelIdByQuestionId(long id)
        {
            return GetById(id).RazdelId;
        }

        public Question GetById(long id)
        {
            return DataContext.Questions.SingleOrDefault(t => t.Id == id);
        }

        public IEnumerable<Question> GetAll()
        {
            return DataContext.Questions.AsEnumerable<Question>();
        }

        public IEnumerable<Question> GetAllQuestionsByRazdelId(long razdelId)
        {
            var result = (from c in DataContext.Questions
                          where c.RazdelId == razdelId
                          select c);

            return (IEnumerable<Question>)result;
        }

        public IEnumerable<Question> GetNotDeletedQuestionsByRazdelId(long razdelId)
        {
            var result = (from c in DataContext.Questions
                          where (c.RazdelId == razdelId && c.IsDeleted == VLKConstants.QUESTION_NOT_DELETED)
                          select c);

            return (IEnumerable<Question>)result;
        }

        public IEnumerable<Question> GetDeletedQuestionsByRazdelId(long razdelId)
        {
            var result = (from c in DataContext.Questions
                          where (c.RazdelId == razdelId && c.IsDeleted == VLKConstants.QUESTION_DELETED)
                          select c);

            return (IEnumerable<Question>)result;
        }

        public int GetQuestionType(long id)
        {
            return GetById(id).Type;
        }

        #endregion

        #region Set

        public long Add(long razdelId, string title, int type, string text, byte canCommented)
        {
            Question newQuestion = new Question();

            newQuestion.RazdelId            = razdelId;
            newQuestion.Title               = title;
            newQuestion.Type                = type;
            newQuestion.Text                = text;
            newQuestion.CanCommented        = canCommented;
            newQuestion.IsDeleted           = VLKConstants.QUESTION_NOT_DELETED;
            newQuestion.DoubleGroup         = VLKConstants.FAKE_VALUE;
            newQuestion.ExclusionGroup      = VLKConstants.FAKE_VALUE;
            newQuestion.AssignedCount       = VLKConstants.FAKE_VALUE;
            newQuestion.RightAnswersCount   = VLKConstants.FAKE_VALUE;
            newQuestion.WrongAnswersCount   = VLKConstants.FAKE_VALUE;

            Add(newQuestion);

            return newQuestion.Id;
        }

        public void Add(Question obj)
        {
            DataContext.Questions.InsertOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, string title, string text, byte CanCommented)
        {
            Question updatedObj = GetById(updatedObjId);

            updatedObj.Title        = title;
            updatedObj.Text         = text;
            updatedObj.CanCommented = CanCommented;

            DataContext.SubmitChanges();
        }

        public void ChangeIsDeletedState(long id, byte newDeletedState)
        {
            if (newDeletedState == VLKConstants.QUESTION_DELETED ||
                newDeletedState == VLKConstants.QUESTION_NOT_DELETED)
            {
                GetById(id).IsDeleted = newDeletedState;

                DataContext.SubmitChanges();
            }
        }

        public void ChangeCanCommentedState(long id, byte newCommentedState)
        {
            if (newCommentedState == VLKConstants.QUESTION_CAN_COMMENTED ||
                newCommentedState == VLKConstants.QUESTION_CAN_NOT_COMMENTED)
            {
                GetById(id).IsDeleted = newCommentedState;

                DataContext.SubmitChanges();
            }
        }

        #endregion

        #region Delete

        public void Delete(Question obj)
        {
            foreach (Answer answer in obj.Answers)
            {
                DataContext.Answers.DeleteOnSubmit(answer);
            }

            DataContext.Questions.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            foreach (Answer answer in GetById(id).Answers)
            {
                DataContext.Answers.DeleteOnSubmit(answer);
            }
            
            DataContext.Questions.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }

        #endregion
    }
}
