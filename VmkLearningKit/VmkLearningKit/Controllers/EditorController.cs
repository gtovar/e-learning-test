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
            ViewData["RazdelId"]      = alias;

            return View();
        }

        /// <summary>
        /// Action, отображающий подробную информацию (с возможностью редактирования) для вопроса с идентификатором alias
        /// </summary>
        /// <param name="alias">идентификатор вопроса</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(long alias)
        {
            Question question = repositoryManager.GetQuestionRepository.GetById(alias);
            int questionType  = question.Type;
            ViewData["QuestionData"] = question;
            ViewData["QuestionType"] = questionType;

            switch (questionType)
            {
                case VLKConstants.QUESTION_TYPE_SIMPLE:
                    {
                        ViewData["AnswerData"] = repositoryManager.GetAnswerRepository.GetAllAnswersByQuestionId(alias).FirstOrDefault<Answer>();
                        break;
                    }
                case VLKConstants.QUESTION_TYPE_FORMULA:
                    {
                        ViewData["AnswerData"] = repositoryManager.GetAnswerRepository.GetAllAnswersByQuestionId(alias).FirstOrDefault<Answer>();
                        break;
                    }
                case VLKConstants.QUESTION_TYPE_ALTERNATIVE:
                    {
                        ViewData["AnswerData"] = repositoryManager.GetAnswerRepository.GetAllAnswersByQuestionId(alias);
                        break;
                    }
                case VLKConstants.QUESTION_TYPE_DISTRIBUTIVE:
                    {
                        ViewData["AnswerData"] = repositoryManager.GetAnswerRepository.GetAllAnswersByQuestionId(alias);
                        break;
                    }
                default: break;
            }

            return View();
        }

        /// <summary>
        /// Action, выполняющий изменение вопроса с идентификатором alias
        /// </summary>
        /// <param name="alias">идентификатор вопроса</param>
        /// <param name="form">форма, отправленная на сервер</param>
        /// <returns></returns>
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(long alias, FormCollection form)
        {
            Question updatedQuestion = repositoryManager.GetQuestionRepository.GetById(alias);

            string title = form["Title"];
            string text  = form["Text"];
            byte canCommented = 1;

            if (form["CanCommented"].ToLower().Equals(false.ToString().ToLower()))
            {
                canCommented = 0;
            }

            repositoryManager.GetQuestionRepository.UpdateById(alias, title, text, canCommented);

            foreach (Answer answer in repositoryManager.GetAnswerRepository.GetAllAnswersByQuestionId(alias))
            {
                if (null != form[VLKConstants.VARIANT_ANSWER_TEXT + answer.Id.ToString()])
                {
                    repositoryManager.GetAnswerRepository.UpdateById(answer.Id,
                                                                     form[VLKConstants.VARIANT_ANSWER_TEXT + answer.Id.ToString()],
                                                                     Convert.ToDouble(form[VLKConstants.VARIANT_ANSWER_SCORE + answer.Id.ToString()]));
                }
                else
                {
                    repositoryManager.GetAnswerRepository.Delete(answer);
                }
            }

            long newVariantAnswerIndex = 0;
            while (null != form[VLKConstants.NEW_VARIANT_ANSWER_TEXT + newVariantAnswerIndex.ToString()])
            {
                repositoryManager.GetAnswerRepository.Add(alias,
                                                          form[VLKConstants.NEW_VARIANT_ANSWER_TEXT + newVariantAnswerIndex.ToString()],
                                                          Convert.ToDouble(form[VLKConstants.NEW_VARIANT_ANSWER_SCORE + newVariantAnswerIndex.ToString()]));

                ++newVariantAnswerIndex;
            }

            return RedirectToAction("List", new { alias = updatedQuestion.RazdelId });
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Delete(long alias)
        {
            long razdelId = repositoryManager.GetQuestionRepository.GetRazdelIdByQuestionId(alias);

            repositoryManager.GetQuestionRepository.ChangeIsDeletedState(alias, VLKConstants.QUESTION_DELETED);

            return RedirectToAction("List", new { alias = razdelId });
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Create(long alias)
        {
            ViewData["RazdelId"] = alias;

            List<SelectListItem> QuestionTypeList = new List<SelectListItem>();

            SelectListItem itemSimple = new SelectListItem();
            itemSimple.Text  = "Простой";
            itemSimple.Value = VLKConstants.QUESTION_TYPE_SIMPLE.ToString();
            QuestionTypeList.Add(itemSimple);

            SelectListItem itemAlternative = new SelectListItem();
            itemAlternative.Text  = "Альтернативный";
            itemAlternative.Value = VLKConstants.QUESTION_TYPE_ALTERNATIVE.ToString();
            QuestionTypeList.Add(itemAlternative);

            SelectListItem itemDistributive = new SelectListItem();
            itemDistributive.Text  = "Дистрибутивный";
            itemDistributive.Value = VLKConstants.QUESTION_TYPE_DISTRIBUTIVE.ToString();
            QuestionTypeList.Add(itemDistributive);

            SelectListItem itemFormula = new SelectListItem();
            itemFormula.Text  = "Формула";
            itemFormula.Value = VLKConstants.QUESTION_TYPE_FORMULA.ToString();
            QuestionTypeList.Add(itemFormula);

            ViewData["QuestionTypeList"] = QuestionTypeList.AsEnumerable<SelectListItem>();

            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateSimple()
        {
            return PartialView();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateDistributive()
        {
            return PartialView();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateAlternative()
        {
            return PartialView();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateFormula()
        {
            return PartialView();
        }

        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(long alias, FormCollection form)
        {
            string title = form["Title"];
            string text  = form["Text"];
            int    type  = Convert.ToInt32(form["QuestionTypeList"]);

            byte canCommented = 1;

            if (form["CanCommented"].ToLower().Equals(false.ToString().ToLower()))
            {
                canCommented = 0;
            }
            
            long questionId = repositoryManager.GetQuestionRepository.Add(alias, title, type, text, canCommented);

            long newVariantAnswerIndex = 0;
            while (null != form[VLKConstants.NEW_VARIANT_ANSWER_TEXT + newVariantAnswerIndex.ToString()])
            {
                repositoryManager.GetAnswerRepository.Add(questionId,
                                                          form[VLKConstants.NEW_VARIANT_ANSWER_TEXT + newVariantAnswerIndex.ToString()],
                                                          Convert.ToDouble(form[VLKConstants.NEW_VARIANT_ANSWER_SCORE + newVariantAnswerIndex.ToString()]));

                ++newVariantAnswerIndex;
            }

            return RedirectToAction("List", new { alias = alias });
        }

        public ActionResult Upload()
        {
            string targetPath = HttpContext.Server.MapPath(Request["folder"]) + "\\";
            string targetFile = targetPath + Request.Files["Filedata"].FileName;

            Request.Files["Filedata"].SaveAs(targetFile);

            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AnswerDelete(long alias)
        {
            long razdelId = repositoryManager.GetAnswerRepository.GetById(alias).Question.RazdelId;;
            
            repositoryManager.GetAnswerRepository.DeleteById(alias);

            return RedirectToAction("List", new { alias = razdelId });
        }
    }
}