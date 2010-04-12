using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IAnswerRepository : IRepository<Answer>
    {
        IEnumerable<Answer> GetAll();
        IEnumerable<Answer> GetAllAnswersByQuestionId(long questionId);
        long GetQuestionIdByAnswerId(long id);
        void Add(Answer obj);
        void Add(long questionId, string text, double score);
        void Update(Answer answer);
        void UpdateById(long updatedObjId, long newObjQuestionId, string newObjText, double newObjScore);
        void UpdateById(long updatedObjId, string newObjText, double newObjScore);
    }
}
