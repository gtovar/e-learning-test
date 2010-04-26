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
        string GetSpecialityDisciplineTitle(long id);
        string GetSpecialityDisciplineAlias(long id);
        string GetSpecialityDisciplineTopicTitle(long id);
        string GetProfessorNickNameByRazdelId(long id);
        IEnumerable<Razdel> GetAllBySpecialityDisciplineTopicId(long topicId);
        void Add(Razdel obj);
        void Add(long newObjTopicId, string newObjTitle);
        void UpdateById(long updatedObjId, long newObjTopicId, string newObjTitle, int newObjQuestionsCount);
        void UpdateById(long updatedObjId, string newObjTitle);
    }
}
