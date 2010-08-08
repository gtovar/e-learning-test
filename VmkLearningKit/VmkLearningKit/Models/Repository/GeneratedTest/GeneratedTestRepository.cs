using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Collections;
using ICSharpCode.SharpZipLib.Zip;
using VmkLearningKit.Core;

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

        public long GetGeneratedTestIdByGeneratedTestVariantId(long generatedTestVariantId)
        {
            GeneratedTestVariant gtv = DataContext.GeneratedTestVariants.SingleOrDefault(t => t.Id == generatedTestVariantId);
            return gtv.GeneratedTestId;
        }

        public IEnumerable<GeneratedTest> GetAllGeneratedTestsBySpecialityDisciplineTopicId(int specialityDisciplineTopicId)
        {
            var result = (from c in DataContext.GeneratedTests
                          where c.SpecialityDisciplineTopicId == specialityDisciplineTopicId
                          select c);
            return (IEnumerable<GeneratedTest>)result;
        }

        public GeneratedTest GetLastGeneratedTestByTopicId(long topicId)
        {
            try
            {
                GeneratedTest res = GetAllGeneratedTestsByTopicId(topicId).OrderBy(o => o.GeneratedDate).Last();
                return res;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("нет сгенерированных тестов(GeneratedTest) по теме " + topicId.ToString());
                return null;
            }

        }
        public IEnumerable<GeneratedTest> GetAllGeneratedTestsByTopicId(long topicId)
        {
            try
            {
                var result = (from c in DataContext.GeneratedTests
                              where c.SpecialityDisciplineTopicId == topicId
                              select c);
                return (IEnumerable<GeneratedTest>)result;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("в базе данных нет сгенерированных тест по теме с id= " + topicId.ToString() + ex.ToString());
                return null;
            }
        }


        #endregion

        #region Set

        public GeneratedTest Add(long specialityDisciplineTopicId, int variantCount, int questionCount)
        {
            // список всех разделов темы
            IEnumerable<Razdel> razdels = (IEnumerable<Razdel>)DataContext.Razdels.Where(t => t.SpecialityDisciplineTopicId == specialityDisciplineTopicId);

            List<Question> questions = new List<Question>(); // список всех вопросов темы
            List<int> counter = new List<int>(); // счетчик для всех вопросов темы

            IEnumerable<Question> Questions = (IEnumerable<Question>)DataContext.Questions; // общий список всех вопросов

            // поиск и добавление всех вопросов темы
            foreach (Razdel r in razdels)
            {
                long k = r.Id;

                foreach (Question q in Questions)
                {
                    if ((q.RazdelId == k) && (q.IsDeleted == 0)) questions.Add(q);
                }
            }

            // установка начальных значений счетчиков
            foreach (Question q in questions)
            {
                counter.Add(0);
            }

            //создаем объект сгенерированного тестового варианта
            GeneratedTest gt = new GeneratedTest();
            gt.SpecialityDisciplineTopicId = specialityDisciplineTopicId;
            gt.VariantsCount = variantCount;
            gt.GeneratedDate = DateTime.Now;
            gt.QuestionsCount = questionCount;
            DataContext.GeneratedTests.InsertOnSubmit(gt);
            DataContext.SubmitChanges();

            //создаем каталог для хранения ims-пакетов теста
            string currentPath = Directory.GetCurrentDirectory();
            string testDir = currentPath + @"\VmkLearningKit\Uploads\Packages" + "\\" + gt.Id;
            DirectoryInfo TestDir = new DirectoryInfo(testDir);
            if (TestDir.Exists)
                TestDir.Delete(true);
            TestDir.Create();

            // добавление в сгенерированный тест вариантов с вопросами
            for (int i = 0; i < gt.VariantsCount; i++)
            {
                //создаем объект сгенерированного тестового варианта
                GeneratedTestVariant gtv = new GeneratedTestVariant();
                gtv.GeneratedTestId = gt.Id;
                DataContext.GeneratedTestVariants.InsertOnSubmit(gtv);
                DataContext.SubmitChanges();

                ArrayList BlackList = new ArrayList(); // "черный" список тестовонго варианта

                //добавление вопросов в вариант по разделам
                foreach (Razdel raz in razdels)
                {
                    long count = raz.QuestionsCount; // число вопросов в варианте из раздела

                    // список вопросов раздела
                    IEnumerable<Question> _li = DataContext.Questions.Where(t => t.RazdelId == raz.Id);
                    
                    // список неудаленных вопросов раздела
                    List<Question> li = new List<Question>();

                    int kol = 0; // количество вопросов раздела
                    foreach (Question q in _li)
                    {
                        if (q.IsDeleted == 0)
                        {
                            li.Add(q);
                            kol++;
                        }
                    }

                    while ((count > 0) && (kol > 0))
                    {
                        bool k = true;

                        while (k)
                        {
                            // находим вопрос с минимальным счетчиком
                            int min = 10000;
                            int n_min = -1;
                            foreach (Question q in li)
                            {
                                // проверка на наличие в "черном" списке
                                if (BlackList.IndexOf(q.Id) == -1)
                                {
                                    int index = questions.IndexOf(q); // индекс вопроса в общем списке вопросов
                                    if (counter[index] < min)
                                    {
                                        min = counter[index];
                                        n_min = index;
                                    }
                                }
                            }
                            // подходящий для добавления вопрос
                            Question question = questions[n_min];

                            // добавляем вопрос в вариант
                            GeneratedQuestion gq = new GeneratedQuestion();
                            gq.GeneratedTestVariantId = gtv.Id;
                            gq.QuestionId = question.Id;
                            DataContext.GeneratedQuestions.InsertOnSubmit(gq);
                            DataContext.SubmitChanges();
                            
                            // увеличиваем счетчик вопроса
                            counter[n_min]++;
                             
                            //уменьшаем счетчик нужных вопросов раздела
                            count--;

                            //добавляем вопрос в "черный" список
                            BlackList.Add(question.Id);
                            
                            //уменьшаем счетчик вопросов раздела
                            kol--;

                            //добавляем в черный список все вопросы с такой же группой-исключений 
                            if (question.ExclusionGroup != -1)
                            {
                                foreach (Question q in li)
                                {
                                    if (BlackList.IndexOf(q.Id) == -1)
                                    {
                                        if (q.ExclusionGroup == question.ExclusionGroup) BlackList.Add(q.Id);
                                    }
                                }   
                            }

                            //добавляем в черный список все вопросы с такой же группой-дублеров
                            //один такой дублер добавляем в вариант

                            long d_question = -1; //id вопроса-дублера
                            if (question.DoubleGroup != -1)
                            {
                                foreach (Question q in li)
                                {
                                    if (BlackList.IndexOf(q.Id) == -1)
                                    {
                                        if (q.DoubleGroup == question.DoubleGroup) { BlackList.Add(q.Id); d_question = q.Id; }
                                    }
                                }
                            }

                            // добавление дублера
                            if (d_question != -1)
                            {
                                // добавляем вопрос в вариант
                                GeneratedQuestion d_gq = new GeneratedQuestion();
                                d_gq.GeneratedTestVariantId = gtv.Id;
                                d_gq.QuestionId = d_question;
                                DataContext.GeneratedQuestions.InsertOnSubmit(d_gq);
                                DataContext.SubmitChanges();

                                // увеличиваем счетчик вопроса
                                Question qu = (Question)DataContext.Questions.SingleOrDefault(t => t.Id == d_question);
                                counter[questions.IndexOf(qu)]++;

                                //уменьшаем счетчик нужных вопросов раздела
                                count--;

                                //добавляем вопрос в "черный" список
                                BlackList.Add(d_question);

                                //уменьшаем счетчик вопросов раздела
                                kol--;
                            }

                            //переход к поиску нового вопроса
                            k = false;                                                                            
                        }
                    }
                }

                // создаем scorm-пакет варианта

                //создаем каталог для хранения scorm-пакета варианта
                string Dir = testDir + "\\" + (i+1);

                DirectoryInfo ScormDir = new DirectoryInfo(Dir);
                ScormDir.Create();

                //создаём каталог для хранения файлов тестового варианта
                DirectoryInfo QuestionDir = new DirectoryInfo(Dir + "\\P1000");
                QuestionDir.Create();

                //создаём каталог для хранения изображений тестового варианта
                DirectoryInfo ImageDir = new DirectoryInfo(Dir + "\\Images");
                ImageDir.Create();

                // записываем файлы тестового варианта
                /*Builder imspage = new Builder("Imspage.htm", Dir + "\\P1000", gtv, s);
                imspage.WriteImsPage();*/

                Builder page = new Builder("page.htm", Dir + "\\P1000", gtv, i+1);
                page.WritePage();

                // записываем файл индекса во временный каталог
                Index index1 = new Index();
                index1.Write(Dir + "\\Index.xml");

                // записываем файл темы во временный каталог
                DirectoryInfo ThemeDir = new DirectoryInfo(Dir + "\\Shared");
                if (ThemeDir.Exists)
                    ThemeDir.Delete(true);
                ThemeDir.Create();
                Theme theme = new Theme();
                theme.Write(Dir + "\\Shared\\themes.css");

                // упаковываем временный каталог в zip архив
                FastZip fz = new FastZip();
                fz.CreateEmptyDirectories = true;
                fz.CreateZip(Dir + ".zip", Dir, true, "");
                fz = null;
                ScormDir.Delete(true);
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
