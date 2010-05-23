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
            gt.VariantsCount = variantCount;
            gt.GeneratedDate = DateTime.Now;
            gt.QuestionsCount = questionCount;
            DataContext.GeneratedTests.InsertOnSubmit(gt);
            DataContext.SubmitChanges();

            //создаем каталог для хранения scorm-пакетов теста
            string testDir = @"VmkLearningKit\Uploads\Pacages" + "\\" + gt.Id;

            DirectoryInfo TestDir = new DirectoryInfo(testDir);
            if (TestDir.Exists)
                TestDir.Delete(true);
            TestDir.Create();

            int s = 1;

            for (int i = 0; i < gt.VariantsCount; i++)
            {
                GeneratedTestVariant gtv = new GeneratedTestVariant();
                gtv.GeneratedTestId = gt.Id;
                DataContext.GeneratedTestVariants.InsertOnSubmit(gtv);
                DataContext.SubmitChanges();

                ArrayList ExclusionList = new ArrayList(); // список групп-исключений
                ArrayList BlackList = new ArrayList(); // "черный" список
                ArrayList DoubleList = new ArrayList(); // список групп-дублеров

                foreach (Razdel raz in razdels)
                {
                    long count = raz.QuestionsCount;

                    // список вопросов раздела
                    IEnumerable<Question> li = DataContext.Questions.Where(t => t.RazdelId == raz.Id);

                    int kol = 0; // количество вопросов раздела

                    foreach (Question q in li)
                    {
                        kol++;
                    }

                    while ((count != 0) && (kol > 0))
                    {
                        bool k = true;

                        while (k)
                        {
                            // находим вопрос с минимальным счетчиком
                            int min = 10000;
                            int n_min = -1;
                            foreach (Question q in li)
                            {
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

                            Question question = questions[n_min];

                            // группа-исключений вопроса уникальна, а группа-дублеров имеет качественное значение
                            if ((ExclusionList.IndexOf(question.ExclusionGroup) == -1) && (question.DoubleGroup != -1))
                            {
                                // создаем вопрос для варианта

                                GeneratedQuestion gq = new GeneratedQuestion();
                                gq.GeneratedTestVariantId = gtv.Id;
                                gq.QuestionId = question.Id;

                                // увеличиваем счетчик
                                counter[n_min]++;

                                //добавляем вопрос в базу
                                DataContext.GeneratedQuestions.InsertOnSubmit(gq);
                                DataContext.SubmitChanges();

                                count--;

                                // добавляем группу исключений вопроса в список групп-исключений варианта
                                if (question.ExclusionGroup != -1)
                                    ExclusionList.Add(question.ExclusionGroup);

                                //добавляем вопрос в "черный" список
                                BlackList.Add(question.Id);
                                kol--;

                                // теперь находим и добавляем в вариант вопрос с такой же группой дублеров
                                
                                long group = question.DoubleGroup; //группа-дублеров вопроса

                                foreach (Question q in li)
                                {
                                    if ((q.DoubleGroup == group) && (q.Id != question.Id)
                                        && (ExclusionList.IndexOf(q.ExclusionGroup) == -1) && BlackList.IndexOf(q.Id) == -1)
                                    {
                                        // создаем вопрос-дублер для варианта

                                        GeneratedQuestion gq2 = new GeneratedQuestion();
                                        gq2.GeneratedTestVariantId = gtv.Id;
                                        gq2.QuestionId = q.Id;

                                        // увеличиваем счетчик
                                        counter[questions.IndexOf(q)]++;

                                        //добавляем вопрос в базу
                                        DataContext.GeneratedQuestions.InsertOnSubmit(gq2);
                                        DataContext.SubmitChanges();

                                        count--;

                                        // добавляем группу исключений вопроса в список групп-исключений варианта
                                        if (q.ExclusionGroup != -1)
                                            ExclusionList.Add(q.ExclusionGroup);

                                        //добавляем вопрос в "черный" список
                                        BlackList.Add(q.Id);
                                        kol--;
                                        break;
                                    }
                                }

                                //переход к поиску нового вопроса
                                k = false;
                            }

                            // группа-исключений вопроса уникальна, а группа-дублеров не имеет качественного значения
                            else if ((ExclusionList.IndexOf(question.ExclusionGroup) == -1) && question.DoubleGroup == -1)
                            {

                                // создаем вопрос для варианта

                                GeneratedQuestion gq = new GeneratedQuestion();
                                gq.GeneratedTestVariantId = gtv.Id;
                                gq.QuestionId = question.Id;

                                // увеличиваем счетчик
                                counter[n_min]++;

                                //добавляем вопрос в базу
                                DataContext.GeneratedQuestions.InsertOnSubmit(gq);
                                DataContext.SubmitChanges();

                                count--;

                                // добавляем группу исключений вопроса в список групп-исключений варианта
                                if (question.ExclusionGroup != -1)
                                    ExclusionList.Add(question.ExclusionGroup);

                                //добавляем вопрос в "черный" список
                                BlackList.Add(question.Id);
                                kol--;

                                //переход к поиску нового вопроса
                                k = false;
                            }

                            else
                            {
                                //добавляем вопрос в "черный" список
                                BlackList.Add(question.Id);
                                kol--;
                            }
                        }
                    }
                }

                // создаем scorm-пакет варианта

                //создаем каталог для хранения scorm-пакета варианта
                string Dir = testDir + "\\" + s;
                s++;

                DirectoryInfo ScormDir = new DirectoryInfo(Dir);
                ScormDir.Create();

                //создаём каталог для хранения файлов тестового варианта
                DirectoryInfo QuestionDir = new DirectoryInfo(Dir + "\\P1000");
                QuestionDir.Create();

                //создаём каталог для хранения изображений тестового варианта
                DirectoryInfo ImageDir = new DirectoryInfo(Dir + "\\Images");
                ImageDir.Create();

                // записываем файлы тестового варианта
                Builder imspage = new Builder("Imspage.htm", Dir + "\\P1000", gtv, s);
                imspage.WriteImsPage();

                Builder page = new Builder("page.htm", Dir + "\\P1000", gtv, s);
                page.WritePage();

                // записываем файл манифеста во временный каталог
                Manifest manifest = new Manifest();
                manifest.Write(Dir + "\\imsmanifest.xml");

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
