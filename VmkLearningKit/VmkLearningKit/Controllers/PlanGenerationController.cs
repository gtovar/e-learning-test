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
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IRazdelRepository razdelRepository = repositoryManager.GetRazdelRepository;
            ISpecialityDisciplineTopicRepository specialityDisciplineTopicRepository = repositoryManager.GetSpecialityDisciplineTopicRepository;
            ISpecialityDisciplineRepository specialityDisciplineRepository = repositoryManager.GetSpecialityDisciplineRepository;

            ViewData["SpecialityDiscipline"] = specialityDisciplineRepository.GetdBySpecialityDisciplineTopicId(topicId);
            ViewData["SpecialityDisciplineTopic"] = specialityDisciplineTopicRepository.GetById(topicId);
            ViewData["AllRazdelsBySpecialityDisciplineTopic"] = razdelRepository.GetAllRazdelsBySpecialityDisciplineTopicId(topicId);
            ViewData["QuestionCountBySpecialityDisciplineTopic"] = specialityDisciplineTopicRepository.GetQuestionCountBySpecialityDisciplineTopicId(topicId);
            ViewData["QuestionCountInTestVariantBySpecialityDisciplineTopic"] = specialityDisciplineTopicRepository.GetQuestionCountInTestVariantBySpecialityDisciplineTopicId(topicId);
            ViewData["RequiredVariantCount"] = 4;
            ViewData["RazdelCountBySpecialityDisciplineTopic"] = specialityDisciplineTopicRepository.GetRazdelCountBySpecialityDisciplineTopicId(topicId);

            ArrayList QuestionCountByRazdels = new ArrayList();

            foreach (Razdel r in (IEnumerable<Razdel>)ViewData["AllRazdelsBySpecialityDisciplineTopic"])
            {
                QuestionCountByRazdels.Add(razdelRepository.GetQuestionCountByRazdelId(r.Id));
            }

            ViewData["QuestionCountByRazdels"] = QuestionCountByRazdels;


            return View();
        }

        public ActionResult AddTest(long topicId)
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedTestRepository generatedTestRepository = repositoryManager.GetGeneratedTestRepository;

            generatedTestRepository.Add(topicId);

            return RedirectToAction("GetGeneratedTests", "Tests");
        }

    }
}
