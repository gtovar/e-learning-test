using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IRazdelRepository : IRepository<Razdel>
    {
        IEnumerable<Razdel> GetAll();
        IEnumerable<Razdel> GetAllRazdelsBySpecialityDisciplineTopicId(long specialityDisciplineTopicId);
        int GetQuestionCountByRazdelId(long razdelId);
        string GetTitle(long id);
        void Add(Razdel obj);
        void UpdateById(long updatedObjId, long newObjTopicId, string newObjTitle, int newObjQuestionsCount);
        void UpdateById(long updatedObjId, string newObjTitle);
    }
}
