using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using VmkLearningKit.Core;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Controllers
{
    [HandleError]
    [AuthorizeFilter(Roles = "Admin, Professor, Metodist")]
    public class EditorController : AbstractController
    {
        /// <summary>
        /// Action 
        /// domain/Editor/Index/
        /// </summary>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// Action, отображающий полный список вопросов по разделу с идентификатором id
        /// domain/Editor/List/alias
        /// </summary>
        /// <param name="alias">идентификатор раздела</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult List(long alias)
        {
            ViewData["QuestionsList"] = repositoryManager.GetQuestionRepository.GetNotDeletedQuestionsByRazdelId(alias);

            return View();
        }

        /// <summary>
        /// Action, отображающий подробную информацию (с возможностью редактировани€) дл€ вопроса с идентификатором alias
        /// </summary>
        /// <param name="alias">идентификатор вопроса</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(long alias)
        {
            ViewData["QuestionData"] = repositoryManager.GetQuestionRepository.GetById(alias);
            ViewData["AnswerData"]   = repositoryManager.GetAnswerRepository.GetAllAnswersByQuestionId(alias);

            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(long alias, Question question, IEnumerable<Answer> answerList)
        {
            return View();
        }

        public ActionResult Delete(long alias)
        {
            long razdelId = repositoryManager.GetQuestionRepository.GetRazdelIdByQuestionId(alias);

            repositoryManager.GetQuestionRepository.DeleteById(alias);

            return RedirectToAction("Edit", new { alias = razdelId });
        }

        public ActionResult DeleteAnswer(long alias)
        {
            long questionId = repositoryManager.GetAnswerRepository.GetQuestionIdByAnswerId(alias);

            repositoryManager.GetAnswerRepository.DeleteById(alias);

            return RedirectToAction("Edit", new { alias = questionId });
        }

        public ActionResult CreateAnswer(long alias)
        {
            Answer answer = new Answer();

            answer.QuestionId = alias;
            answer.Question   = repositoryManager.GetQuestionRepository.GetById(alias);
            answer.Score      = 0;
            answer.Text       = "“екст ответа";

            repositoryManager.GetAnswerRepository.Add(answer);

            return RedirectToAction("Edit", new { alias = alias });
        }
    }
}
