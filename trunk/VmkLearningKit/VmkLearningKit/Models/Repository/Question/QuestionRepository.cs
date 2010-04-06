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

        #endregion

        #region Set

        public void Add(Question obj)
        {
            DataContext.Questions.InsertOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, 
                               long newObjRazdelId, 
                               int newObjType, 
                               string newObjText, 
                               int newObjDoubleGroup, 
                               int newObjExclusionGroup, 
                               byte newObjIsDeleted, 
                               byte newObjCanCommented)
        {
            Question updatedObj = GetById(updatedObjId);

            updatedObj.RazdelId         = newObjRazdelId;
            updatedObj.Type             = newObjType;
            updatedObj.Text             = newObjText;
            updatedObj.DoubleGroup      = newObjDoubleGroup;
            updatedObj.ExclusionGroup   = newObjExclusionGroup;
            updatedObj.IsDeleted        = newObjIsDeleted;
            updatedObj.CanCommented     = newObjCanCommented;

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId,
                               string newObjText,
                               int newObjDoubleGroup,
                               int newObjExclusionGroup,
                               byte newObjIsDeleted,
                               byte newObjCanCommented)
        {
            Question updatedObj = GetById(updatedObjId);

            updatedObj.Text             = newObjText;
            updatedObj.DoubleGroup      = newObjDoubleGroup;
            updatedObj.ExclusionGroup   = newObjExclusionGroup;
            updatedObj.IsDeleted        = newObjIsDeleted;
            updatedObj.CanCommented     = newObjCanCommented;

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
            DataContext.Questions.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Questions.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }

        #endregion
    }
}
