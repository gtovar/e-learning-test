using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace VmkLearningKit.Models.Repository
{
    class QuestionRepository : Repository<Question>, IQuestionRepository
    {
        public QuestionRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        #region Get

        public int GetDifferentDoubleGroupsCountInRazdel(long razdelId)
        {
            var result = (from c in DataContext.Questions
                          where (c.RazdelId == razdelId &&
                                 c.DoubleGroup != VLKConstants.FAKE_VALUE)
                          select c.DoubleGroup);

            return result.Distinct<int>().Count<int>();
        }

        public int GetDifferentExclusionGroupsCountInRazdel(long razdelId)
        {
            var result = (from c in DataContext.Questions
                          where (c.RazdelId == razdelId &&
                                 c.ExclusionGroup != VLKConstants.FAKE_VALUE)
                          select c.ExclusionGroup);

            return result.Distinct<int>().Count<int>();
        }

        public IEnumerable<Question> GetQuestionsById(long id)
        {
            return DataContext.Questions.Where(t => t.Id == id);
        }

        public double GetMaxScoreQuestionByQuestionId(long questionId)
        {
            double maxScore = 0;

            IEnumerable<Answer> answers = DataContext.Answers.Where(t => t.QuestionId == questionId);
            foreach (Answer a in answers)
            {
                if (a.Score > 0) maxScore += a.Score;
            }

            return maxScore;
        }

        /*
        // локальный id в списке вопросов темы
        public int GetQuestionLocalIdByQuestionId(long questionId)
        {              
            // получаем вопрос
            Question q = DataContext.Questions.SingleOrDefault(t => t.Id == questionId);

            // получаем раздел
            Razdel r = DataContext.Razdels.SingleOrDefault(t => t.Id == q.RazdelId);

            // получаем тему
            SpecialityDisciplineTopic sdt = DataContext.SpecialityDisciplineTopics.SingleOrDefault(t => t.Id == r.SpecialityDisciplineTopicId);

            //получаем список разделов по теме
            IEnumerable<Razdel> raz = DataContext.Razdels.Where(t => t.SpecialityDisciplineTopicId == sdt.Id);

            List<Question> questions = new List<Question>();

            //получаем список вопросов по теме
            foreach (Razdel ra in raz)
            {
                IEnumerable<Question> ques = DataContext.Questions.Where(t => t.RazdelId == ra.Id);
                foreach (Question qu in ques)
                {
                    questions.Add(qu);
                }
            }

            int localId = 0;
            int numerator = 1;

            foreach (Question qu in questions)
            {
                if (qu.Id == questionId) localId = numerator;
                numerator++;
            }

            return localId;
        }*/

        // локальный id в списке вопросов раздела
        public int GetQuestionLocalIdByQuestionId(long questionId)
        {
            // получаем вопрос
            Question q = DataContext.Questions.SingleOrDefault(t => t.Id == questionId);

            // получаем раздел
            Razdel r = DataContext.Razdels.SingleOrDefault(t => t.Id == q.RazdelId);

            //получаем список вопросов по разделу
            IEnumerable<Question> _questions = DataContext.Questions.Where(t => t.RazdelId == r.Id);

            //получаем список неудаленных вопросов по разделу
            List<Question> questions = new List<Question>();

            foreach (Question _q in _questions)
            {
                if (_q.IsDeleted == 0)
                    questions.Add(_q);
            }

            int localId = 0;
            int numerator = 1;

            foreach (Question qu in questions)
            {
                if (qu.Id == questionId)
                {
                    localId = numerator;
                    break;
                }
                numerator++;
            }

            return localId;

        }

        public string GetFullQuestionLocalIdByQuestionId(long questionId)
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
            IRazdelRepository razdelRepository = repositoryManager.GetRazdelRepository;

            int localId = GetQuestionLocalIdByQuestionId(questionId);
            long razdelId = GetRazdelIdByQuestionId(questionId);
            int localRazdelId = razdelRepository.GetRazdelLocalIdByRazdelId(razdelId);
            string s = localId + "(" + localRazdelId + ")";
            return s;
        }

        public long GetRazdelIdByQuestionId(long id)
        {
            return GetById(id).RazdelId;
        }

        public Question GetById(long id)
        {
            return DataContext.Questions.SingleOrDefault(t => t.Id == id);
        }

        public int GetAnswersCountByQuestionId(long questionId)
        {
            int count = 0;

            foreach (Answer an in DataContext.Answers.Where(t => t.QuestionId == questionId))
            {
                count++;
            }

            return count;
        }

        public IEnumerable<Answer> GetAllAnswersByQuestionId(long questionId)
        {
            var result = (from c in DataContext.Answers
                          where c.QuestionId == questionId
                          select c);

            return (IEnumerable<Answer>)result;
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

        public IEnumerable<Question> GetNotDeletedQuestionsByRazdelIdSortedByDoubleGroup(long razdelId)
        {
            var result = (from c in DataContext.Questions
                          where (c.RazdelId == razdelId && 
                                 c.IsDeleted == VLKConstants.QUESTION_NOT_DELETED && 
                                 c.DoubleGroup != VLKConstants.FAKE_VALUE) 
                          orderby c.DoubleGroup
                          select c);

            return (IEnumerable<Question>)result;
        }

        public IEnumerable<Question> GetNotDeletedQuestionsByRazdelIdSortedByExclusionGroup(long razdelId)
        {
            var result = (from c in DataContext.Questions
                          where (c.RazdelId == razdelId &&
                                 c.IsDeleted == VLKConstants.QUESTION_NOT_DELETED &&
                                 c.ExclusionGroup != VLKConstants.FAKE_VALUE)
                          orderby c.ExclusionGroup
                          select c);

            return (IEnumerable<Question>)result;
        }

        public IEnumerable<Question> GetNotDeletedQuestionsByRazdelIdWithFakeDoubleGroup(long razdelId)
        {
            var result = (from c in DataContext.Questions
                          where (c.RazdelId == razdelId &&
                                 c.IsDeleted == VLKConstants.QUESTION_NOT_DELETED &&
                                 c.DoubleGroup == VLKConstants.FAKE_VALUE)
                          select c);

            return (IEnumerable<Question>)result;
        }

        public IEnumerable<Question> GetNotDeletedQuestionsByRazdelIdWithFakeExclusionGroup(long razdelId)
        {
            var result = (from c in DataContext.Questions
                          where (c.RazdelId == razdelId &&
                                 c.IsDeleted == VLKConstants.QUESTION_NOT_DELETED &&
                                 c.ExclusionGroup == VLKConstants.FAKE_VALUE)
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

        public int GetMaxQuestionDoubleGroupInRazdel(long razdelId)
        {
            var result = (from c in DataContext.Questions
                          where (c.RazdelId == razdelId && c.IsDeleted == VLKConstants.QUESTION_NOT_DELETED)
                          select c.DoubleGroup);

            return ((IEnumerable<int>)result).Max();
        }

        public int GetMaxQuestionExclusionGroupInRazdel(long razdelId)
        {
            var result = (from c in DataContext.Questions
                          where (c.RazdelId == razdelId && c.IsDeleted == VLKConstants.QUESTION_NOT_DELETED)
                          select c.ExclusionGroup);

            return ((IEnumerable<int>)result).Max();
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

        public void ChangeDoubleGroup(long id, int groupIndex)
        {
            GetById(id).DoubleGroup = groupIndex;

            DataContext.SubmitChanges();
        }

        public void ChangeExclusionGroup(long id, int groupIndex)
        {
            GetById(id).ExclusionGroup = groupIndex;

            DataContext.SubmitChanges();
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
