using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VmkLearningKit.Models.Repository;
using System.Collections;

namespace VmkLearningKit.Controllers
{
    public class PlanGenerationController : Controller
    {
        public ActionResult GetPlanGeneration(long topicId)
        {
            ViewData[Constants.PAGE_TITLE] = "Генератор тестовых вариантов";

            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IRazdelRepository razdelRepository = repositoryManager.GetRazdelRepository;
            ISpecialityDisciplineTopicRepository specialityDisciplineTopicRepository = repositoryManager.GetSpecialityDisciplineTopicRepository;
            ISpecialityDisciplineRepository specialityDisciplineRepository = repositoryManager.GetSpecialityDisciplineRepository;

            ViewData["SpecialityDiscipline"] = specialityDisciplineRepository.GetdBySpecialityDisciplineTopicId(topicId);
            ViewData["SpecialityDisciplineTopic"] = specialityDisciplineTopicRepository.GetById(topicId);
            ViewData["AllRazdelsBySpecialityDisciplineTopic"] = razdelRepository.GetAllRazdelsBySpecialityDisciplineTopicId(topicId);
            ViewData["QuestionCountBySpecialityDisciplineTopic"] = specialityDisciplineTopicRepository.GetQuestionCountBySpecialityDisciplineTopicId(topicId);
            ViewData["QuestionCountInTestVariantBySpecialityDisciplineTopic"] = specialityDisciplineTopicRepository.GetQuestionCountInTestVariantBySpecialityDisciplineTopicId(topicId);
            ViewData["VariantCount"] = specialityDisciplineTopicRepository.GetVariantCount();
            ViewData["RazdelCountBySpecialityDisciplineTopic"] = specialityDisciplineTopicRepository.GetRazdelCountBySpecialityDisciplineTopicId(topicId);
            ViewData["TopicId"] = topicId;

            ArrayList QuestionCountByRazdels = new ArrayList();

            foreach (Razdel r in (IEnumerable<Razdel>)ViewData["AllRazdelsBySpecialityDisciplineTopic"])
            {
                QuestionCountByRazdels.Add(razdelRepository.GetQuestionCountByRazdelId(r.Id));
            }

            ViewData["QuestionCountByRazdels"] = QuestionCountByRazdels;


            return View();
        }

        public ActionResult AddTest(long topicId, int variantCount, int questionCount)
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedTestRepository generatedTestRepository = repositoryManager.GetGeneratedTestRepository;

            generatedTestRepository.Add(topicId, variantCount, questionCount);

            return RedirectToAction("GetGeneratedTests", "Tests", new { topicId = topicId });
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(long topicId)
        {
            return RedirectToAction("GetPlanGeneration", "PlanGeneration", new { topicId = topicId });
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(long topicId, FormCollection form)
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
            IRazdelRepository razdelRepository = repositoryManager.GetRazdelRepository;

            IEnumerable<Razdel> razdels = razdelRepository.GetAllRazdelsBySpecialityDisciplineTopicId(topicId);
            int count = 0;
            foreach (Razdel r in razdels)
            { 
                string name = form.GetKey(count);
                razdelRepository.UpdateById(r.Id, Convert.ToInt32(form.Get(count)));
                count++;
            }

            ISpecialityDisciplineTopicRepository specialityDisciplineTopicRepository = repositoryManager.GetSpecialityDisciplineTopicRepository;

            specialityDisciplineTopicRepository.SetVariantCount(Convert.ToInt32(form["variantCount"]));

            return RedirectToAction("GetPlanGeneration", "PlanGeneration", new { topicId = topicId });
        }

    }
}
