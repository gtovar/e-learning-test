using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class AnswerRepository : Repository<Answer>, IAnswerRepository
    {
        public AnswerRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        #region Get

        public Answer GetById(long id)
        {
            return DataContext.Answers.SingleOrDefault(t => t.Id == id);
        }

        public IEnumerable<Answer> GetAll()
        {
            return DataContext.Answers.AsEnumerable<Answer>();
        }

        public IEnumerable<Answer> GetAllAnswersByQuestionId(int questionId)
        {
            var result = (from c in DataContext.Answers
                          where c.QuestionId == questionId
                          select c);

            return (IEnumerable<Answer>)result;
        }

        #endregion

        #region Set

        public void Add(Answer obj)
        {
            DataContext.Answers.InsertOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, long newObjQuestionId, string newObjText, double newObjScore)
        {
            Answer updatedObj = GetById(updatedObjId);

            updatedObj.QuestionId = newObjQuestionId;
            updatedObj.Text       = newObjText;
            updatedObj.Score      = newObjScore;

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, string newObjText, double newObjScore)
        {
            Answer updatedObj = GetById(updatedObjId);

            updatedObj.Text       = newObjText;
            updatedObj.Score      = newObjScore;

            DataContext.SubmitChanges();
        }

        #endregion

        #region Delete

        public void Delete(Answer obj)
        {
            DataContext.Answers.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Answers.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }

        #endregion
    }
}
