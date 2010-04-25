using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VmkLearningKit.Models.Repository;
using System.Collections;

namespace VmkLearningKit.Controllers
{
    public class TestsController : Controller
    {
        public ActionResult GetGeneratedTests()
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedTestRepository generatedTestRepository = repositoryManager.GetGeneratedTestRepository;

            ViewData["AllGeneratedTestsBySpecialityDisciplineTopic"] = generatedTestRepository.GetAllGeneratedTestsBySpecialityDisciplineTopicId(22);

            return View();
        }

        public ActionResult GetTest(long id)
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedTestVariantRepository generatedTestVariantRepository = repositoryManager.GetGeneratedTestVariantRepository;
            IGeneratedQuestionRepository generatedQuestionRepository = repositoryManager.GetGeneratedQuestionRepository;

            ViewData["AllGeneratedTestVariantsByGeneratedTest"] = generatedTestVariantRepository.GetAllGeneratedTestVariantsByGeneratedTestId(id);

            ArrayList list = new ArrayList();
            ArrayList temp = new ArrayList();

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

    }

}
