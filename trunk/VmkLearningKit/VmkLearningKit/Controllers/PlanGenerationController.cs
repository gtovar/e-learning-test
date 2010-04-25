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
        public ActionResult GetPlanGeneration()
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IRazdelRepository razdelRepository = repositoryManager.GetRazdelRepository;
            ISpecialityDisciplineTopicRepository specialityDisciplineTopicRepository = repositoryManager.GetSpecialityDisciplineTopicRepository;

            ViewData["AllRazdelsBySpecialityDisciplineTopic"] = razdelRepository.GetAllRazdelsBySpecialityDisciplineTopicId(22);
            ViewData["QuestionCountBySpecialityDisciplineTopic"] = specialityDisciplineTopicRepository.GetQuestionCountBySpecialityDisciplineTopicId(22);
            ViewData["QuestionCountInTestVariantBySpecialityDisciplineTopic"] = specialityDisciplineTopicRepository.GetQuestionCountInTestVariantBySpecialityDisciplineTopicId(22);
            ViewData["RequiredVariantCount"] = 4;
            ViewData["RazdelCountBySpecialityDisciplineTopic"] = specialityDisciplineTopicRepository.GetRazdelCountBySpecialityDisciplineTopicId(22);

            ArrayList QuestionCountByRazdels = new ArrayList();

            foreach (Razdel r in (IEnumerable<Razdel>)ViewData["AllRazdelsBySpecialityDisciplineTopic"])
            {
                QuestionCountByRazdels.Add(razdelRepository.GetQuestionCountByRazdelId(r.Id));
            }

            ViewData["QuestionCountByRazdels"] = QuestionCountByRazdels;


            return View();
        }

        public ActionResult AddTest()
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            IGeneratedTestRepository generatedTestRepository = repositoryManager.GetGeneratedTestRepository;

            generatedTestRepository.Add(22);

            return RedirectToAction("GetGeneratedTests", "Tests");
        }

    }
}
