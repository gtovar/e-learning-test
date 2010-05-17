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
        /// <summary>
        /// Действие, отображающее список разделов по теме
        /// </summary>
        /// <param name="alias">Идентификатор темы</param>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index(long alias)
        {
            try 
            {
                ViewData[Constants.PAGE_TITLE] = "Тестирование";
                
                GeneralMenu();
                
                ViewData["RazdelsList"]       = 
                    repositoryManager.GetRazdelRepository.GetAllBySpecialityDisciplineTopicId(alias);
                
                ViewData["DisciplineTitle"]   = 
                    HttpUtility.HtmlEncode(repositoryManager.GetSpecialityDisciplineTopicRepository.GetSpecialityDisciplineTitleByTopicId(alias));
                
                ViewData["TopicTitle"]        = 
                    repositoryManager.GetSpecialityDisciplineTopicRepository.GetTitle(alias);
                
                ViewData["TopicId"]           = alias;

                ViewData["DisciplineAlias"]   = 
                    repositoryManager.GetSpecialityDisciplineTopicRepository.GetSpecialityDisciplineAliasByTopicId(alias);
                
                ViewData["ProfessorNickName"] = 
                    repositoryManager.GetSpecialityDisciplineTopicRepository.GetProfessorNickNameByTopicId(alias);
                
                return View();
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        /// <summary>
        /// Действие для редактирования раздела 
        /// </summary>
        /// <param name="alias">Идентификатор раздела</param>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult EditRazdel(long alias)
        {
            try
            {
                ViewData["RazdelTitle"] = HttpUtility.HtmlEncode(repositoryManager.GetRazdelRepository.GetTitle(alias));
                ViewData["RazdelId"]    = alias;

                return View();
            }
            catch (Exception exc)
            {
                return RedirectToAction("PartialViewError", "Home");
            }
        }

        /// <summary>
        /// Действие для обработки изменений о разделе
        /// </summary>
        /// <param name="alias">Идентификатор раздела</param>
        /// <param name="form">Полученная форма</param>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditRazdel(long alias, FormCollection form)
        {
            try
            {
                long topicId          =
                    repositoryManager.GetRazdelRepository.GetById(alias).SpecialityDisciplineTopicId;

                string newRazdelTitle = HttpUtility.HtmlDecode(form["Title"]);

                repositoryManager.GetRazdelRepository.UpdateById(alias, newRazdelTitle);

                return RedirectToAction("Index", new { alias = topicId });
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        /// <summary>
        /// Действие для удаления раздела
        /// </summary>
        /// <param name="alias">Идентификатор раздела</param>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteRazdel(long alias)
        {
            try
            {
                long topicId = repositoryManager.GetRazdelRepository.GetById(alias).SpecialityDisciplineTopicId;

                repositoryManager.GetRazdelRepository.DeleteById(alias);

                return RedirectToAction("Index", new { alias = topicId });
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        /// <summary>
        /// Действие для добавления нового раздела
        /// </summary>
        /// <param name="alias">Идентификатор темы</param>
        /// <param name="form">Полученная форма</param>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddRazdel(long alias, FormCollection form)
        {
            try
            {
                string newRazdelTitle = HttpUtility.HtmlDecode(form["NewRazdelTitle"]);

                repositoryManager.GetRazdelRepository.Add(alias, newRazdelTitle);

                return RedirectToAction("Index", new { alias = alias });
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }
    }
}
