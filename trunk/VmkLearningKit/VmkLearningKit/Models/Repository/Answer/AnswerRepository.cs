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

        public IEnumerable<Answer> GetAllAnswersByQuestionId(long questionId)
        {
            var result = (from c in DataContext.Answers
                          where c.QuestionId == questionId
                          select c);

            return (IEnumerable<Answer>)result;
        }

        public long GetQuestionIdByAnswerId(long id)
        {
            return GetById(id).QuestionId;
        }

        #endregion

        #region Set

        public void Add(Answer obj)
        {
            DataContext.Answers.InsertOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void Add(long questionId, string text, double score)
        {
            Answer addedObj = new Answer();

            addedObj.Text = text;
            addedObj.Score = score;
            addedObj.QuestionId = questionId;

            Add(addedObj);
        }

        public void UpdateById(long updatedObjId, long newObjQuestionId, string newObjText, double newObjScore)
        {
            Answer updatedObj = GetById(updatedObjId);

            updatedObj.QuestionId = newObjQuestionId;
            updatedObj.Text = newObjText;
            updatedObj.Score = newObjScore;

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, string newObjText, double newObjScore)
        {
            Answer updatedObj = GetById(updatedObjId);

            updatedObj.Text = newObjText;
            updatedObj.Score = newObjScore;

            DataContext.SubmitChanges();
        }

        public void Update(Answer answer)
        {
            Answer updatedObj = GetById(answer.Id);

            updatedObj.Text = answer.Text;
            updatedObj.Score = answer.Score;

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
