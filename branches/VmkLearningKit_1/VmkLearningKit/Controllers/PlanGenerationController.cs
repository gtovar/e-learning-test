using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VmkLearningKit.Models.Repository;
using System.Collections;

namespace VmkLearningKit.Controllers
{
    public class PlanGenerationController : AbstractController
    {
        /// <summary>
        /// Action, отображающий план генерации тестовых вариантов по каждой теме
        /// domain/PlanGeneration/GetPlanGeneration/alias
        /// </summary>
        /// <param name="alias">идентификатор темы</param>
        /// <returns></returns>
        public ActionResult GetPlanGeneration(long alias)
        {
            long topicId = alias;
            ViewData[Constants.PAGE_TITLE] = "Генератор тестовых вариантов";

            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IRazdelRepository razdelRepository                                       = 
                repositoryManager.GetRazdelRepository;
            ISpecialityDisciplineTopicRepository specialityDisciplineTopicRepository =
                repositoryManager.GetSpecialityDisciplineTopicRepository;
            ISpecialityDisciplineRepository           specialityDisciplineRepository =
                repositoryManager.GetSpecialityDisciplineRepository;

            ViewData["SpecialityDiscipline"]                                  = 
                specialityDisciplineRepository.GetdBySpecialityDisciplineTopicId(topicId);
            ViewData["SpecialityDisciplineTopic"]                             = 
                specialityDisciplineTopicRepository.GetById(topicId);
            ViewData["AllRazdelsBySpecialityDisciplineTopic"]                 = 
                razdelRepository.GetAllRazdelsBySpecialityDisciplineTopicId(topicId);
            ViewData["QuestionCountBySpecialityDisciplineTopic"]              = 
                specialityDisciplineTopicRepository.GetQuestionCountBySpecialityDisciplineTopicId(topicId);
            ViewData["QuestionCountInTestVariantBySpecialityDisciplineTopic"] = 
                specialityDisciplineTopicRepository.GetQuestionCountInTestVariantBySpecialityDisciplineTopicId(topicId);
            ViewData["VariantCount"]                                          = 
                specialityDisciplineTopicRepository.GetVariantCount();
            ViewData["RazdelCountBySpecialityDisciplineTopic"]                = 
                specialityDisciplineTopicRepository.GetRazdelCountBySpecialityDisciplineTopicId(topicId);
            ViewData["TopicId"]                                               = 
                topicId;

            ArrayList QuestionCountByRazdels = new ArrayList();

            foreach (Razdel r in (IEnumerable<Razdel>)ViewData["AllRazdelsBySpecialityDisciplineTopic"])
            {
                QuestionCountByRazdels.Add(razdelRepository.GetQuestionCountByRazdelId(r.Id));
            }

            ViewData["QuestionCountByRazdels"] = QuestionCountByRazdels;


            return View();
        }

        /// <summary>
        /// Action, генерирующий тест по теме с заданными количествами тестовых вариантов и вопросов в каждом варианте 
        /// </summary>
        /// <param name="topicId">идентификатор темы</param>
        /// <param name="variantCount">количество вариантов</param>
        /// <param name="questionCount">количество вопросов в варианте</param>
        /// <returns></returns>
        public ActionResult AddTest(long topicId, int variantCount, int questionCount)
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedTestRepository generatedTestRepository = repositoryManager.GetGeneratedTestRepository;

            generatedTestRepository.Add(topicId, variantCount, questionCount);

            return RedirectToAction("GetGeneratedTests", "Tests", new { alias = topicId });
        }

        /// <summary>
        /// Action, отображающий план генерации тестовых вариантов по каждой теме (с возможностью редактирования)
        /// </summary>
        /// <param name="topicId"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(long topicId)
        {
            return RedirectToAction("GetPlanGeneration", "PlanGeneration", new { alias = topicId });
        }

        /// <summary>
        /// Action, выполняющий изменения плана генерации каждой темы
        /// </summary>
        /// <param name="topicId">идентификатор темы</param>
        /// <param name="form">отправленная форма</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(long topicId, FormCollection form)
        {
            try
            {

                RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

                IRazdelRepository razdelRepository = repositoryManager.GetRazdelRepository;

                IEnumerable<Razdel> razdels = razdelRepository.GetAllRazdelsBySpecialityDisciplineTopicId(topicId);

                int count = 0;

                foreach (Razdel r in razdels)
                {
                    string name = form.GetKey(count);
                    if (Convert.ToInt32(form.Get(count)) >= 0)
                        razdelRepository.UpdateById(r.Id, Convert.ToInt32(form.Get(count)));
                    count++;
                }

                ISpecialityDisciplineTopicRepository specialityDisciplineTopicRepository = repositoryManager.GetSpecialityDisciplineTopicRepository;

                specialityDisciplineTopicRepository.SetVariantCount(Convert.ToInt32(form["variantCount"]));

                return RedirectToAction("GetPlanGeneration", "PlanGeneration", new { alias = topicId });
            }

            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }

    }
}
