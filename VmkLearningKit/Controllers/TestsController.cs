using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VmkLearningKit.Models.Repository;
using System.Collections;
using System.IO;
using VmkLearningKit.Core;

namespace VmkLearningKit.Controllers
{
    [HandleError]
    [AuthorizeFilter(Roles = "Admin, Professor, Metodist")]
    public class TestsController : AbstractController
    {
        /// <summary>
        /// Action, отображающий все сгенерированные тесты по каждой теме
        /// domain/Tests/GetGeneratedTests/alias
        /// </summary>
        /// <param name="alias">идентификатор темы</param>
        /// <returns></returns>
        public ActionResult GetGeneratedTests(long alias)
        {
            GeneralMenu();

            long topicId = alias;

            ViewData[Constants.PAGE_TITLE] = "Генератор тестовых вариантов";

            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedTestRepository generatedTestRepository = repositoryManager.GetGeneratedTestRepository;

            ViewData["AllGeneratedTestsBySpecialityDisciplineTopic"] = 
                generatedTestRepository.GetAllGeneratedTestsBySpecialityDisciplineTopicId((int)topicId);
            ViewData["TopicId"] = topicId;

            return View();
        }

        /// <summary>
        /// Action, отображающий информацию о сгенерированном тесте, в том числе распределение вопросов по вариантам,
        /// а также частота использования вопросов в вариантах
        /// domain/Tests/GetTest/alias
        /// </summary>
        /// <param name="alias">идентификатор сгенерированного теста</param>
        /// <returns></returns>
        public ActionResult GetTest(long alias)
        {
            GeneralMenu();

            long id = alias;

            ViewData[Constants.PAGE_TITLE] = "Генератор тестовых вариантов";

            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedTestVariantRepository generatedTestVariantRepository           = 
                repositoryManager.GetGeneratedTestVariantRepository;
            IGeneratedQuestionRepository generatedQuestionRepository                 = 
                repositoryManager.GetGeneratedQuestionRepository;
            ISpecialityDisciplineTopicRepository specialityDisciplineTopicRepository = 
                repositoryManager.GetSpecialityDisciplineTopicRepository;
            IRazdelRepository razdelRepository                                       = 
                repositoryManager.GetRazdelRepository;

            ViewData["AllGeneratedTestVariantsByGeneratedTest"] = 
                generatedTestVariantRepository.GetAllGeneratedTestVariantsByGeneratedTestId(id);
            ViewData["TopicId"]                                 = 
                specialityDisciplineTopicRepository.GetTopicIdByGeneratedTestId(id);
            ViewData["AllRazdelsByTopic"]                       = 
                razdelRepository.GetAllRazdelsBySpecialityDisciplineTopicId(Convert.ToInt64(ViewData["TopicId"]));

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

        /// <summary>
        /// Action, удаляющий сгененированный тест по заданному идентификатору.
        /// Вместе с тестом удаляются все сгенерированные варианты и вопросы этого теста.
        /// </summary>
        /// <param name="id">идентификатор сгенерированного теста</param>
        /// <returns></returns>
        public ActionResult DeleteTest(long alias)
        {
            long id = alias;

            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedTestRepository generatedTestRepository                         = 
                repositoryManager.GetGeneratedTestRepository;
            IGeneratedTestVariantRepository generatedTestVariantRepository           = 
                repositoryManager.GetGeneratedTestVariantRepository;
            IGeneratedQuestionRepository generatedQuestionRepository                 = 
                repositoryManager.GetGeneratedQuestionRepository;
            ISpecialityDisciplineTopicRepository specialityDisciplineTopicRepository =
                repositoryManager.GetSpecialityDisciplineTopicRepository;
            IAssignedTestVariantRepository assignedTestVariantRepository =
                repositoryManager.GetAssignedTestVariantRepository;
                 
            IEnumerable<GeneratedTestVariant> variants = 
                generatedTestVariantRepository.GetAllGeneratedTestVariantsByGeneratedTestId(id);

            foreach (GeneratedTestVariant var in variants)
            {
                IEnumerable<GeneratedQuestion> questions = 
                    generatedQuestionRepository.GetAllGeneratedQuestionsByGeneratedTestVariantId(var.Id);
                // удаляем все вопросы варианта
                foreach (GeneratedQuestion ques in questions)
                {
                    generatedQuestionRepository.DeleteById(ques.Id);
                }

                IEnumerable<AssignedTestVariant> assiggnedVariants =
                    assignedTestVariantRepository.GetAllByGeneratedTestVariantId(var.Id);
                // удаляем все назначенные тесты варианта
                foreach (AssignedTestVariant atv in assiggnedVariants)
                {
                    assignedTestVariantRepository.Delete(atv);
                }

                // удаляем вариант
                generatedTestVariantRepository.DeleteById(var.Id);
            }

            long topicId = specialityDisciplineTopicRepository.GetTopicIdByGeneratedTestId(id);

            // удаляем тест
            generatedTestRepository.DeleteById(id);

            return RedirectToAction("GetGeneratedTests", "Tests", new { alias = topicId });
        }

        /// <summary>
        /// Action, отображающий все сгенерированные вопросы по каждому тестовому варианту
        /// </summary>
        /// <param name="alias"></param>
        /// <returns></returns>
        public ActionResult GetTestVariant(long alias)
        {
            GeneralMenu();

            long id = alias;

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

        /// <summary>
        ////Action, отображающий внешнее представление сгенерированного тестоаого варианта
        /// </summary>
        /// <param name="alias"></param>
        /// <returns></returns>
        public ActionResult Show(long alias)
        {
            GeneralMenu();

            long id = alias;

            ViewData[Constants.PAGE_TITLE] = "Генератор тестовых вариантов";

            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedTestRepository generatedTestRepository               = repositoryManager.GetGeneratedTestRepository;
            IGeneratedTestVariantRepository generatedTestVariantRepository = repositoryManager.GetGeneratedTestVariantRepository;

            ViewData["Id"] = id;
            ViewData["TestNumber"] = generatedTestVariantRepository.GetLocalNumGeneratedTestVariant(id);
           
            ViewData["TestId"] = generatedTestRepository.GetGeneratedTestIdByGeneratedTestVariantId(id);
            return View();
        }

    }

}
