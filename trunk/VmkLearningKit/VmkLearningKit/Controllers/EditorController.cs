using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using VmkLearningKit.Core;
using VmkLearningKit.Models.Repository;
using System.IO;

namespace VmkLearningKit.Controllers
{
    [HandleError]
    [AuthorizeFilter(Roles = "Admin, Professor, Metodist")]
    [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
    public class EditorController : AbstractController
    {
        /// <summary>
        /// Action, отображающий полный список вопросов по разделу с идентификатором id
        /// domain/Editor/List/alias
        /// </summary>
        /// <param name="alias">идентификатор раздела</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult List(long alias)
        {
            GeneralMenu();
            
            ViewData[Constants.PAGE_TITLE] = "Редактор тестовых вопросов";
            
            ViewData["QuestionsList"]     = repositoryManager.GetQuestionRepository.GetNotDeletedQuestionsByRazdelId(alias);
            ViewData["RazdelId"]          = alias;
            ViewData["DisciplineTitle"]   = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineTitle(alias);
            ViewData["TopicTitle"]        = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineTopicTitle(alias);
            ViewData["RazdelTitle"]       = repositoryManager.GetRazdelRepository.GetTitle(alias);
            ViewData["ProfessorNickName"] = repositoryManager.GetRazdelRepository.GetProfessorNickNameByRazdelId(alias);
            ViewData["DisciplineAlias"]   = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineAlias(alias);
            ViewData["TopicId"]           = repositoryManager.GetRazdelRepository.GetById(alias).SpecialityDisciplineTopicId;

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
            GeneralMenu();
            
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
            GeneralMenu();
            
            ViewData[Constants.PAGE_TITLE] = "Редактор тестовых вопросов";

            ViewData["DisciplineTitle"]     = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineTitle(alias);
            ViewData["TopicTitle"]          = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineTopicTitle(alias);
            ViewData["RazdelTitle"]         = repositoryManager.GetRazdelRepository.GetTitle(alias);
            ViewData["ProfessorNickName"]   = repositoryManager.GetRazdelRepository.GetProfessorNickNameByRazdelId(alias);
            ViewData["DisciplineAlias"]     = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineAlias(alias);
            ViewData["TopicId"]             = repositoryManager.GetRazdelRepository.GetById(alias).SpecialityDisciplineTopicId;
            ViewData["RazdelId"]            = alias;

            List<SelectListItem> QuestionTypeList = new List<SelectListItem>();

            SelectListItem itemDefault = new SelectListItem();
            itemDefault.Text = "Тип вопроса";
            itemDefault.Value = VLKConstants.FAKE_VALUE.ToString();
            QuestionTypeList.Add(itemDefault);

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

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Upload(long alias)
        {
            DirectoryInfo targetDir = new DirectoryInfo(HttpContext.Server.MapPath("/Uploads/Word"));
            long docIndex           = targetDir.GetFiles("*.doc").Length;
            
            foreach (string inputTagName in Request.Files)
            {
                HttpPostedFileBase file = Request.Files[inputTagName];
                if (file.ContentLength > 0)
                {
                    string filePath = HttpContext.Server.MapPath("/Uploads/Word") + "\\" + (docIndex).ToString() + ".doc";
                    file.SaveAs(filePath);

                    QWord.QReader reader = new QWord.QReader(HttpContext.Server.MapPath("/Uploads/Word") + "\\" + docIndex.ToString() + ".doc", HttpContext.Server.MapPath("/Uploads/Images"), Request.Url.AbsoluteUri.ToLower().Replace("editor/upload/" + alias.ToString(), "Uploads/Images"));

                    reader.SaveAllImages();

                    QWord.TestQuestionList testQuestionList = reader.ReadWordDocument();

                    for (int i = 0; i < testQuestionList.Count; i++)
                    {
                        QWord.TestQuestion testQuestion = testQuestionList[i];

                        int type = -1;
                        switch (testQuestion.Type)
                        {
                            case QWord.QType.Simple:       type = VLKConstants.QUESTION_TYPE_SIMPLE;       break;
                            case QWord.QType.Alternative:  type = VLKConstants.QUESTION_TYPE_ALTERNATIVE;  break;
                            case QWord.QType.Distributive: type = VLKConstants.QUESTION_TYPE_DISTRIBUTIVE; break;
                            case QWord.QType.Formula:      type = VLKConstants.QUESTION_TYPE_FORMULA;      break;

                            default: return RedirectToAction("List", new { alias = alias });
                        }

                        long questionId = repositoryManager.GetQuestionRepository.Add(alias, VLKConstants.TITLE_IS_ABSENT, type, testQuestion.Question.Text, VLKConstants.QUESTION_CAN_NOT_COMMENTED);

                        for (int j = 0; j < testQuestion.Answers.Count; j++)
                        {
                            repositoryManager.GetAnswerRepository.Add(questionId, testQuestion.Answers[j].Text, (double)testQuestion.Answers[j].Score);
                        }

                        ++docIndex;
                    }
                }
            }

            return RedirectToAction("List", new { alias = alias });
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AnswerDelete(long alias)
        {
            long razdelId = repositoryManager.GetAnswerRepository.GetById(alias).Question.RazdelId;;
            
            repositoryManager.GetAnswerRepository.DeleteById(alias);

            return RedirectToAction("List", new { alias = razdelId });
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult ImageUpload()
        {
            DirectoryInfo targetDir = new DirectoryInfo(HttpContext.Server.MapPath("/Uploads/Images"));
            long imageIndex         = targetDir.GetFiles("*.jpg").Length;

            string imageLink = "Данный тип файла не поддерживается. Используйте изображения в формате JPEG (*.jpg)";
            
            foreach (string inputTagName in Request.Files)
            {
                HttpPostedFileBase file = Request.Files[inputTagName];

                if (file.ContentLength > 0 && inputTagName.Equals("UploadedImage"))
                {
                    if (file.FileName.EndsWith(".jpg"))
                    {
                        string filePath = HttpContext.Server.MapPath("/Uploads/Images") + "\\Image" + (imageIndex).ToString() + ".jpg";
                        file.SaveAs(filePath);
                        
                        imageLink = Request.Url.AbsoluteUri.ToLower().Replace("editor/imageupload", "Uploads/Images/Image" + (imageIndex).ToString() + ".jpg");

                        ++imageIndex;
                    }
                }
            }
            
            return new JsonResult
            {
                ContentType = "text/html",
                Data = imageLink
            };
        }
    }
}