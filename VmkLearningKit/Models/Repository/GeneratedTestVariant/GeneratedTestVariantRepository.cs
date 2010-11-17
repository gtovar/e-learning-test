using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class GeneratedTestVariantRepository : Repository<GeneratedTestVariant>, IGeneratedTestVariantRepository
    {
        public GeneratedTestVariantRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        #region Get

        public int GetGeneratedTestVariantLocalIdByGeneratedTestVariantId(long generatedTestVariantId)
        {
            return 0;
        }

        public GeneratedTestVariant GetById(long id)
        {
            return DataContext.GeneratedTestVariants.SingleOrDefault(t => t.Id == id);
        }

       public IEnumerable<GeneratedTestVariant> GetAllGeneratedTestVariantsByGeneratedTestId(long generatedTestId)
        {
            try
            {
                var result = DataContext.GeneratedTestVariants.Where(c => c.GeneratedTestId == generatedTestId);
                return (IEnumerable<GeneratedTestVariant>)result;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("в бд нет сгенерированных тестовых вариантов с generatedTest id =" + generatedTestId.ToString());
                return null;
            }

        }
        public IEnumerable<GeneratedTestVariant> GetCurrentVariantsTestByTopicId(long topicId)
        {
            try
            {
                IEnumerable<GeneratedTest> res = (from gt in DataContext.GeneratedTests
                                                  where gt.SpecialityDisciplineTopicId == topicId
                                                  select gt).OrderBy(o => o.GeneratedDate);
                GeneratedTest _gt = res.Last();
                IEnumerable<GeneratedTestVariant> gtv =
                DataContext.GeneratedTestVariants.Where(t => t.GeneratedTestId == _gt.Id);
                return gtv;

            }

            catch (Exception ex)
            {
                // Utility.WriteToLog("в базе нет GeneratedTestVariant c GeneratedTest.ID=");
                return null;
            }

        }

        public long GetLocalNumGeneratedTestVariant(long idGeneratedTestVariant)
        {
            GeneratedTestVariant gt = DataContext.GeneratedTestVariants.Single(v => v.Id == idGeneratedTestVariant);
            IEnumerable<GeneratedTestVariant> gtv = DataContext.GeneratedTestVariants.Where(g => g.GeneratedTestId == gt.GeneratedTestId).OrderBy(o => o.Id);
            long firstIdGtv = gtv.First().Id;
            long lastIdGtv=gtv.Last().Id;
            if (idGeneratedTestVariant <= lastIdGtv && idGeneratedTestVariant >= firstIdGtv)
            {
                return idGeneratedTestVariant - firstIdGtv+1;
            }
            else { return -1; }
            /*Array tmp = gtv.ToArray<GeneratedTestVariant>();

            for (int i = 0; i < gtv.ToArray<GeneratedTestVariant>().Length; i++)
            {
                if ((gtv.ToArray<GeneratedTestVariant>()[i]).Id == idGeneratedTestVariant) return i;
            }
            return -1;
            */
        }

        public long GetCountCurrentTopicTestVariants(long topicId)
        {
            IEnumerable<GeneratedTestVariant> gtv = GetCurrentVariantsTestByTopicId(topicId);
            if (gtv != null)
                return gtv.Count();
            else return 0;
        }

        public IEnumerable<GeneratedTestVariant> GetAllGeneratedTestVariantsByTopicId(long topicId)
        {
            try
            {
                IEnumerable<GeneratedTestVariant> res = (from gt in DataContext.GeneratedTests
                                                         from gtv in DataContext.GeneratedTestVariants
                                                         where gt.SpecialityDisciplineTopicId == topicId
                                                         where gt.Id == gtv.GeneratedTestId
                                                         select gtv);
                return res;
            }
            catch (Exception ex)
            {
                // Utility.WriteToLog("в базе нет GeneratedTestVariant c GeneratedTest.ID=");
                return null;
            }
        }

        public double GetMaxGeneratedTestVariantScore(long id)
        {
            IEnumerable<GeneratedQuestion> testQuestions = DataContext.GeneratedQuestions.Where(gq => gq.GeneratedTestVariantId == id);
            double result=0;
            foreach (GeneratedQuestion genQ in testQuestions )
            {
                IEnumerable<Answer> allQuestionAnswers = DataContext.Answers.Where(Answer => Answer.QuestionId == genQ.Question.Id);
                foreach (Answer answ in allQuestionAnswers)
                {
                    if (answ.Score >= 0) result += answ.Score;
                }
            }
            return result;
        }



        #endregion

        #region Set

        public GeneratedTestVariant Add(long testId)
        {
            GeneratedTestVariant gtv = new GeneratedTestVariant();
            gtv.GeneratedTestId = testId;

            return gtv;
        }

        #endregion

        #region Delete

        public void Delete(GeneratedTestVariant obj)
        {
            DataContext.GeneratedTestVariants.DeleteOnSubmit(obj);
            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.GeneratedTestVariants.DeleteOnSubmit(GetById(id));
            DataContext.SubmitChanges();
        }

        #endregion
    }
}
