using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VmkLearningKit.Models.Repository;
using System.Collections;
using System.IO;

namespace VmkLearningKit.Controllers
{
    public class TestsController : Controller
    {
        public ActionResult GetGeneratedTests(long topicId)
        {
            ViewData[Constants.PAGE_TITLE] = "Генератор тестовых вариантов";

            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedTestRepository generatedTestRepository = repositoryManager.GetGeneratedTestRepository;

            ViewData["AllGeneratedTestsBySpecialityDisciplineTopic"] = generatedTestRepository.GetAllGeneratedTestsBySpecialityDisciplineTopicId((int)topicId);
            ViewData["TopicId"] = topicId;

            return View();
        }

        public ActionResult GetTest(long id)
        {
            ViewData[Constants.PAGE_TITLE] = "Генератор тестовых вариантов";

            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedTestVariantRepository generatedTestVariantRepository = repositoryManager.GetGeneratedTestVariantRepository;
            IGeneratedQuestionRepository generatedQuestionRepository = repositoryManager.GetGeneratedQuestionRepository;
            ISpecialityDisciplineTopicRepository specialityDisciplineTopicRepository = repositoryManager.GetSpecialityDisciplineTopicRepository;
            IRazdelRepository razdelRepository = repositoryManager.GetRazdelRepository;

            ViewData["AllGeneratedTestVariantsByGeneratedTest"] = generatedTestVariantRepository.GetAllGeneratedTestVariantsByGeneratedTestId(id);
            ViewData["TopicId"] = specialityDisciplineTopicRepository.GetTopicIdByGeneratedTestId(id);
            ViewData["AllRazdelsByTopic"] = razdelRepository.GetAllRazdelsBySpecialityDisciplineTopicId(Convert.ToInt64(ViewData["TopicId"]));

            ArrayList list = new ArrayList();
            ArrayList localIdList = new ArrayList();

            foreach (GeneratedTestVariant gtv in (IEnumerable<GeneratedTestVariant>)ViewData["AllGeneratedTestVariantsByGeneratedTest"])
            {
                // получаем список сгенерированных вопросов

                list.Add(generatedQuestionRepository.GetAllGeneratedQuestionsByGeneratedTestVariantId(gtv.Id));

            }

            ViewData["AllGeneratedQuestionsByGeneratedTestVariant"] = list;

            return View();
        }

        public ActionResult GetTestVariant(long id)
        {
            ViewData[Constants.PAGE_TITLE] = "Генератор тестовых вариантов";

            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedQuestionRepository generatedQuestionRepository = repositoryManager.GetGeneratedQuestionRepository;
            IQuestionRepository questionRepository = repositoryManager.GetQuestionRepository;

            ViewData["AllGeneratedQuestionsByGeneratedTestVariant"] = generatedQuestionRepository.GetAllGeneratedQuestionsByGeneratedTestVariantId(id);

            ArrayList al = new ArrayList();

            foreach (GeneratedQuestion gq in (IEnumerable<GeneratedQuestion>)ViewData["AllGeneratedQuestionsByGeneratedTestVariant"])
            {
                al.Add(questionRepository.GetQuestionsById(gq.QuestionId));
            }

            ViewData["AllQuestionByGeneratedTestVariant"] = al;

            return View();
        }

        public ActionResult Show(long id)
        {
            ViewData[Constants.PAGE_TITLE] = "Генератор тестовых вариантов";

            /*RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedTestRepository generatedTestRepository = repositoryManager.GetGeneratedTestRepository;
            IGeneratedTestVariantRepository generatedTestVariantRepository = repositoryManager.GetGeneratedTestVariantRepository;

            long generatedTestId = generatedTestRepository.GetGeneratedTestIdByGeneratedTestVariantId(id);
            int localId = generatedTestVariantRepository.GetGeneratedTestVariantLocalIdByGeneratedTestVariantId(id);
            string Dir = @"file:///C:/Users/orlov.leonid/Desktop/Пакеты" + "/" + generatedTestId + "/" + localId + "/P1000/page.htm";
            //Response.Redirect(Dir);*/

            ViewData["Id"] = id;
            return View();
        }

    }

}
