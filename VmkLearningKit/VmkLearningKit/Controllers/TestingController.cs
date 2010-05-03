using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VmkLearningKit.Models.Repository;
using VmkLearningKit.Core;

namespace VmkLearningKit.Controllers
{
    [HandleError]
    [AuthorizeFilter(Roles = "Admin, Professor, Metodist")]
    [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
    public class TestingController : AbstractController
    {
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index(long alias)
        {
            GeneralMenu();
            
            ViewData[Constants.PAGE_TITLE] = "Тестирование"; 

            ViewData["RazdelsList"]       = repositoryManager.GetRazdelRepository.GetAllBySpecialityDisciplineTopicId(alias);
            ViewData["DisciplineTitle"]   = repositoryManager.GetSpecialityDisciplineTopicRepository.GetSpecialityDisciplineTitleByTopicId(alias);
            ViewData["TopicTitle"]        = repositoryManager.GetSpecialityDisciplineTopicRepository.GetTitle(alias);
            ViewData["TopicId"]           = alias;
            ViewData["DisciplineAlias"]   = repositoryManager.GetSpecialityDisciplineTopicRepository.GetSpecialityDisciplineAliasByTopicId(alias);
            ViewData["ProfessorNickName"] = repositoryManager.GetSpecialityDisciplineTopicRepository.GetProfessorNickNameByTopicId(alias);
            

            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult EditRazdel(long alias)
        {
            ViewData[Constants.PAGE_TITLE] = "Тестирование"; 

            ViewData["RazdelTitle"] = repositoryManager.GetRazdelRepository.GetTitle(alias);
            ViewData["RazdelId"]    = alias;

            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditRazdel(long alias, FormCollection form)
        {
            long    topicId         = repositoryManager.GetRazdelRepository.GetById(alias).SpecialityDisciplineTopicId;
            string  newRazdelTitle  = form["Title"];

            repositoryManager.GetRazdelRepository.UpdateById(alias, newRazdelTitle);

            return RedirectToAction("Index", new { alias = topicId });
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteRazdel(long alias)
        {
            long topicId = repositoryManager.GetRazdelRepository.GetById(alias).SpecialityDisciplineTopicId;

            repositoryManager.GetRazdelRepository.DeleteById(alias);

            return RedirectToAction("Index", new { alias = topicId });
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddRazdel(long alias, FormCollection form)
        {
            repositoryManager.GetRazdelRepository.Add(alias, form["NewRazdelTitle"]);

            return RedirectToAction("Index", new { alias = alias });
        }
    }
}
