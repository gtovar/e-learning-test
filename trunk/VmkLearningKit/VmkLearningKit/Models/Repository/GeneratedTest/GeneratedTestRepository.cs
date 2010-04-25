using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class GeneratedTestRepository : Repository<GeneratedTest>, IGeneratedTestRepository
    {
        public GeneratedTestRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        #region Get

        public GeneratedTest GetById(long id)
        {
            return DataContext.GeneratedTests.SingleOrDefault(t => t.Id == id);
        }

        public IEnumerable<GeneratedTest> GetAllGeneratedTestsBySpecialityDisciplineTopicId(int specialityDisciplineTopicId)
        {
            var result = (from c in DataContext.GeneratedTests
                          where c.SpecialityDisciplineTopicId == specialityDisciplineTopicId
                          select c);
            return (IEnumerable<GeneratedTest>)result;
        }

        #endregion

        #region Set

        public GeneratedTest Add(long specialityDisciplineTopicId)
        {
            IEnumerable<Razdel> razdels = (IEnumerable<Razdel>)DataContext.Razdels.Where(t => t.SpecialityDisciplineTopicId == specialityDisciplineTopicId); // список разделов

            List<Question> questions = new List<Question>(); // список всех вопросов темы
            List<int> counter = new List<int>(); // счетчик вопросов

            IEnumerable<Question> Questions = (IEnumerable<Question>)DataContext.Questions; // общий список вопросов

            foreach (Razdel r in razdels)
            {
                long k = r.Id;

                foreach (Question q in Questions)
                {
                    if (q.RazdelId == k) questions.Add(q);
                }
            }

            foreach (Question q in questions)
            {
                counter.Add(0);
            }

            GeneratedTest gt = new GeneratedTest();
            gt.SpecialityDisciplineTopicId = specialityDisciplineTopicId;
            gt.VariantsCount = 3;
            gt.GeneratedDate = DateTime.Now;
            gt.QuestionsCount = 11;
            DataContext.GeneratedTests.InsertOnSubmit(gt);
            DataContext.SubmitChanges();


            for (int i = 0; i < gt.VariantsCount; i++)
            {
                GeneratedTestVariant gtv = new GeneratedTestVariant();
                gtv.GeneratedTestId = gt.Id;
                DataContext.GeneratedTestVariants.InsertOnSubmit(gtv);
                DataContext.SubmitChanges();

                foreach (Razdel raz in razdels)
                {
                    long count = raz.QuestionsCount;
                    IEnumerable<Question> li = DataContext.Questions.Where(t => t.RazdelId == raz.Id);

                    while (count != 0)
                    {
                        // находим вопрос с минимальным счетчиком

                        int min = 10000;
                        int n_min = -1;
                        foreach (Question q in li)
                        {
                            int index = questions.IndexOf(q); // индекс вопроса в общем списке вопросов
                            if (counter[index] < min)
                            {
                                min = counter[index];
                                n_min = index;
                            }
                        }
                        // создаем вопрос для варианта

                        GeneratedQuestion gq = new GeneratedQuestion();
                        gq.GeneratedTestVariantId = gtv.Id;
                        Question question = questions[n_min];
                        gq.QuestionId = question.Id;

                        // увеличиваем счетчик
                        counter[n_min]++;

                        //добавляем вопрос в базу
                        DataContext.GeneratedQuestions.InsertOnSubmit(gq);
                        DataContext.SubmitChanges();

                        count--;
                    }
                }
            }

            return gt;

        }

        #endregion

        #region Delete

        public void Delete(GeneratedTest obj)
        {
            DataContext.GeneratedTests.DeleteOnSubmit(obj);
            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.GeneratedTests.DeleteOnSubmit(GetById(id));
            DataContext.SubmitChanges();
        }

        #endregion
    }
}
