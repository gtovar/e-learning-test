using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VmkLearningKit.Models.Repository;
using VmkLearningKit.Core;

namespace VmkLearningKit.Controllers
{
    /// <summary>
    /// Определяет набор действий для работы с разделами 
    /// для пользователей с ролями «Professor», «Metodist», «Admin»
    /// </summary>
    [HandleError]
    [AuthorizeFilter(Roles = "Admin, Professor, Metodist")]
    [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
    public class TestingController : AbstractController
    {
        /// <summary>
        /// Действие, отображающее список разделов по теме с идентификатором alias, 
        /// при выполнении GET-запроса по адресу /Testing/Index/alias
        /// </summary>
        /// <param name="alias">Идентификатор темы</param>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index(long alias)
        {
            try 
            {
                GeneralMenu();
                
                ViewData[Constants.PAGE_TITLE] = "Тестирование";
                
                ViewData["RazdelsList"]       = 
                    repositoryManager.GetRazdelRepository.GetAllBySpecialityDisciplineTopicId(alias);
                
                ViewData["DisciplineTitle"]   = 
                    repositoryManager.GetSpecialityDisciplineTopicRepository.GetSpecialityDisciplineTitleByTopicId(alias);
                
                ViewData["TopicTitle"]        = 
                    repositoryManager.GetSpecialityDisciplineTopicRepository.GetTitle(alias);
                
                ViewData["TopicId"]           = alias;

                ViewData["DisciplineAlias"]   = 
                    repositoryManager.GetSpecialityDisciplineTopicRepository.GetSpecialityDisciplineAliasByTopicId(alias);

                ViewData["ProfessorNickName"] =
                    ((User)Session[Constants.SESSION_USER]).NickName;
                
                return View();
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        /// <summary>
        /// Действие, отображающее форму для редактирования названия раздела с идентификатором alias, 
        /// при выполнении GET-запроса по адресу /Testing/EditRazdel/alias
        /// </summary>
        /// <param name="alias">Идентификатор раздела</param>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult EditRazdel(long alias)
        {
            try
            {
                ViewData["RazdelTitle"] = repositoryManager.GetRazdelRepository.GetTitle(alias);
                ViewData["RazdelId"]    = alias;

                return View();
            }
            catch (Exception exc)
            {
                return RedirectToAction("PartialViewError", "Home");
            }
        }

        /// <summary>
        /// Действие, выполняющее обработку изменений, сделанных на странице редактирования названия раздела, 
        /// при выполнении POST-запроса по адресу /Testing/EditRazdel/alias
        /// </summary>
        /// <param name="alias">Идентификатор раздела</param>
        /// <param name="form">Форма, отправленная на сервер</param>
        [ValidateInput(false)]
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
        /// Действие, выполняющее удаление раздела с идентификатором alias, 
        /// при выполнении POST-запроса по адресу /Testing/DeleteRazdel/alias. 
        /// Если удаляемый раздел содержит тестовые вопросы – соответствующие записи в таблицах 
        /// «Question» и «Answer» будут удалены
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
        /// Действие, выполняющее добавление раздела по теме с идентификатором alias, 
        /// при выполнении POST-запроса по адресу /Testing/AddRazdel/alias
        /// </summary>
        /// <param name="alias">Идентификатор темы</param>
        /// <param name="form">Форма, отправленная на сервер</param>
        [ValidateInput(false)]
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
