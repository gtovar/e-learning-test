using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    /// <summary>
    /// Реализует набор методов, определенных в интерфейсах «IRepository<Razdel>» и «IRazdelRepository»
    /// </summary>
    class RazdelRepository : Repository<Razdel>, IRazdelRepository
    {
        public RazdelRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        #region Get

        public Razdel GetById(long id)
        {
            return DataContext.Razdels.SingleOrDefault(t => t.Id == id);
        }


        public IEnumerable<Razdel> GetAll()
        {
            return DataContext.Razdels.AsEnumerable<Razdel>();
        }

        public string GetTitle(long id)
        {
            Razdel razdel = GetById(id);

            if (razdel != null)
            {
                return razdel.Title;
            }

            return null;
        }

        public int GetRazdelLocalIdByRazdelId(long razdelId)
        {
            //получаем раздел
            Razdel r = DataContext.Razdels.SingleOrDefault(t => t.Id == razdelId);

            // получаем тему
            SpecialityDisciplineTopic sdt = DataContext.SpecialityDisciplineTopics.SingleOrDefault(t => t.Id == r.SpecialityDisciplineTopicId);

            //получаем список разделов темы
            IEnumerable<Razdel> razdels = DataContext.Razdels.Where(t => t.SpecialityDisciplineTopicId == sdt.Id);

            int numerator = 1;
            int localId = 0;

            foreach (Razdel raz in razdels)
            {
                if (raz.Id == razdelId)
                {
                    localId = numerator;
                    break;
                }
                numerator++;
            }

            return localId;
        }

        public string GetProfessorNickNameByRazdelId(long id)
        {
            Razdel razdel = GetById(id);

            if (razdel != null)
            {
                return razdel.SpecialityDisciplineTopic.SpecialityDiscipline.Professor.User.NickName;
            }

            return null;
        }

        public IEnumerable<Razdel> GetAllBySpecialityDisciplineTopicId(long topicId)
        {
            var razdelsList = (from c in DataContext.Razdels
                               where c.SpecialityDisciplineTopicId == topicId
                               select c);

            return (IEnumerable<Razdel>)razdelsList;
        }

        public string GetSpecialityDisciplineTitle(long id)
        {
            Razdel razdel = GetById(id);

            if (razdel != null)
            {
                return razdel.SpecialityDisciplineTopic.SpecialityDiscipline.Title;
            }

            return null;
        }

        public string GetSpecialityDisciplineAlias(long id)
        {
            Razdel razdel = GetById(id);

            if (razdel != null)
            {
                return razdel.SpecialityDisciplineTopic.SpecialityDiscipline.Alias;
            }

            return null;
        }

        public string GetSpecialityDisciplineTopicTitle(long id)
        {
            Razdel razdel = GetById(id);

            if (razdel != null)
            {
                return razdel.SpecialityDisciplineTopic.Title;
            }

            return null;
        }

        public IEnumerable<Razdel> GetAllRazdelsBySpecialityDisciplineTopicId(long specialityDisciplineTopicId)
        {
            var result = (from c in DataContext.Razdels
                          where c.SpecialityDisciplineTopicId == specialityDisciplineTopicId
                          select c);
            return (IEnumerable<Razdel>)result;
        }

        public int GetQuestionCountByRazdelId(long razdelId)
        {
            int count = 0;
            foreach (Question q in DataContext.Questions)
            {
                if (q.RazdelId == razdelId)
                    count++;
            }
            return count;
        }

        #endregion

        #region Set

        public void Add(Razdel obj)
        {
            DataContext.Razdels.InsertOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void Add(long newObjTopicId, string newObjTitle)
        {
            Razdel newRazdel = new Razdel();

            newRazdel.SpecialityDisciplineTopicId = newObjTopicId;
            newRazdel.Title = newObjTitle;
            newRazdel.QuestionsCount = VLKConstants.FAKE_VALUE;

            Add(newRazdel);
        }

        public void UpdateById(long updatedObjId, long newObjTopicId, string newObjTitle, int newObjQuestionsCount)
        {
            Razdel updatedObj = GetById(updatedObjId);

            updatedObj.SpecialityDisciplineTopicId = newObjTopicId;
            updatedObj.Title = newObjTitle;
            updatedObj.QuestionsCount = newObjQuestionsCount;

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, string newObjTitle)
        {
            Razdel updatedObj = GetById(updatedObjId);

            updatedObj.Title = newObjTitle;

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, int newObjQuestionsCount)
        {
            Razdel updatedObj = GetById(updatedObjId);

            updatedObj.QuestionsCount = newObjQuestionsCount;

            DataContext.SubmitChanges();
        }

        #endregion

        #region Delete

        public void Delete(Razdel obj)
        {
            foreach (Question question in obj.Questions)
            {
                foreach (Answer answer in question.Answers)
                {
                    DataContext.Answers.DeleteOnSubmit(answer);
                }

                DataContext.Questions.DeleteOnSubmit(question);
            }

            DataContext.Razdels.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            foreach (Question question in GetById(id).Questions)
            {
                foreach (Answer answer in question.Answers)
                {
                    DataContext.Answers.DeleteOnSubmit(answer);
                }

                DataContext.Questions.DeleteOnSubmit(question);
            }

            DataContext.Razdels.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }

        #endregion
    }
}
