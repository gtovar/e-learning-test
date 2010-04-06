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
        /// domain/Editor/Index/id
        /// </summary>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// Action, отображающий полный список вопросов по разделу с идентификатором id
        /// domain/Editor/List/id
        /// </summary>
        /// <param name="id">идентификатор раздела</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult List(long id)
        {
            ViewData["QuestionsList"] = repositoryManager.GetQuestionRepository.GetNotDeletedQuestionsByRazdelId(id);
            
            return View();
        }

        /// <summary>
        /// Action, отображающий подробную информацию (с возможностью редактировани€) дл€ вопроса с идентификатором id
        /// </summary>
        /// <param name="id">идентификатор вопроса</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(long id)
        {
            ViewData["QuestionData"] = repositoryManager.GetQuestionRepository.GetById(id);
            ViewData["AnswerData"]   = repositoryManager.GetAnswerRepository.GetAllAnswersByQuestionId(id);

            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(long id, Question question, IEnumerable<Answer> answerList)
        {
            return View();
        }

        public ActionResult Delete(long id)
        {
            long razdelId = repositoryManager.GetQuestionRepository.GetRazdelIdByQuestionId(id);

            repositoryManager.GetQuestionRepository.DeleteById(id);

            return RedirectToAction("Edit", new { id = razdelId });
        }

        public ActionResult DeleteAnswer(long id)
        {
            long questionId = repositoryManager.GetAnswerRepository.GetQuestionIdByAnswerId(id);

            repositoryManager.GetAnswerRepository.DeleteById(id);

            return RedirectToAction("Edit", new { id = questionId });
        }

        public ActionResult CreateAnswer(long id)
        {
            Answer answer = new Answer();

            answer.QuestionId = id;
            answer.Question   = repositoryManager.GetQuestionRepository.GetById(id);
            answer.Score      = 0;
            answer.Text       = "“екст ответа";

            repositoryManager.GetAnswerRepository.Add(answer);

            return RedirectToAction("Edit", new { id = id });
        }
    }
}
