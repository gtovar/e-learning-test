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
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult List(long alias)
        {
            try
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
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        /// <summary>
        /// Action, отображающий подробную информацию (с возможностью редактирования) для вопроса 
        /// с идентификатором alias
        /// </summary>
        /// <param name="alias">идентификатор вопроса</param>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(long alias)
        {
            try
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
                            ViewData["AnswerData"]         = repositoryManager.GetAnswerRepository.GetAllAnswersByQuestionId(alias).FirstOrDefault<Answer>();
                            ViewData["QuestionTypeString"] = "простой";
                            
                            break;
                        }
                    case VLKConstants.QUESTION_TYPE_FORMULA:
                        {
                            ViewData["AnswerData"] = repositoryManager.GetAnswerRepository.GetAllAnswersByQuestionId(alias).FirstOrDefault<Answer>();
                            ViewData["QuestionTypeString"] = "формула";

                            break;
                        }
                    case VLKConstants.QUESTION_TYPE_ALTERNATIVE:
                        {
                            ViewData["AnswerData"] = repositoryManager.GetAnswerRepository.GetAllAnswersByQuestionId(alias);
                            ViewData["QuestionTypeString"] = "альтернативный";

                            break;
                        }
                    case VLKConstants.QUESTION_TYPE_DISTRIBUTIVE:
                        {
                            ViewData["AnswerData"] = repositoryManager.GetAnswerRepository.GetAllAnswersByQuestionId(alias);
                            ViewData["QuestionTypeString"] = "дистрибутивный";

                            break;
                        }
                    default: break;
                }

                return View();
            }
            catch (Exception exc)
            {
                return RedirectToAction("PartialViewError", "Home");
            }
        }

        /// <summary>
        /// Action, выполняющий изменение вопроса с идентификатором alias
        /// </summary>
        /// <param name="alias">идентификатор вопроса</param>
        /// <param name="form">форма, отправленная на сервер</param>
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(long alias, FormCollection form)
        {
            try
            {
                Question updatedQuestion = repositoryManager.GetQuestionRepository.GetById(alias);

                string title = HttpUtility.HtmlDecode(form["Title"]);
                string text  = HttpUtility.HtmlDecode(form["Text"]);
                
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
                                                                         HttpUtility.HtmlDecode(form[VLKConstants.VARIANT_ANSWER_TEXT + answer.Id.ToString()]),
                                                                         Convert.ToDouble(form[VLKConstants.VARIANT_ANSWER_SCORE + answer.Id.ToString()]));
                    }
                    else
                    {
                        repositoryManager.GetAnswerRepository.Delete(answer);
                    }
                }

                foreach (string key in form.AllKeys)
                {
                    if (key.StartsWith(VLKConstants.NEW_VARIANT_ANSWER_TEXT))
                    {
                        string number = key.Substring(VLKConstants.NEW_VARIANT_ANSWER_TEXT.Length);

                        repositoryManager.GetAnswerRepository.Add(alias,
                                                                  HttpUtility.HtmlDecode(form[key]),
                                                                  Convert.ToDouble(form[VLKConstants.NEW_VARIANT_ANSWER_SCORE + number]));
                    }
                }

                return RedirectToAction("List", new { alias = updatedQuestion.RazdelId });
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        /// <summary>
        /// Action, выполняющий удаление вопроса с идентификатором alias
        /// </summary>
        /// <param name="alias">идентификатор вопроса</param>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Delete(long alias)
        {
            try
            {
                long razdelId = repositoryManager.GetQuestionRepository.GetRazdelIdByQuestionId(alias);

                repositoryManager.GetQuestionRepository.ChangeIsDeletedState(alias, VLKConstants.QUESTION_DELETED);

                return RedirectToAction("List", new { alias = razdelId });
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        /// <summary>
        /// Action, отображающий главную форму для создания вопроса (в разделе с идентификатором alias)
        /// </summary>
        /// <param name="alias">идентификатор раздела</param>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Create(long alias)
        {
            try
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
            catch (Exception exc)
            {
                return RedirectToAction("PartialViewError", "Home");
            }
        }

        /// <summary>
        /// Action, загружающий форму для создания простого вопроса
        /// </summary>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateSimple()
        {
            try
            {
                return PartialView();
            }
            catch (Exception exc)
            {
                return RedirectToAction("PartialViewError", "Home");
            }
        }

        /// <summary>
        /// Action, загружающий форму для создания дистрибутивного вопроса
        /// </summary>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateDistributive()
        {
            try
            {
                return PartialView();
            }
            catch (Exception exc)
            {
                return RedirectToAction("PartialViewError", "Home");
            }
        }

        /// <summary>
        /// Action, загружающий форму для создания альтернативного вопроса
        /// </summary>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateAlternative()
        {
            try
            {
                return PartialView();
            }
            catch (Exception exc)
            {
                return RedirectToAction("PartialViewError", "Home");
            }
        }

        /// <summary>
        /// Action, загружающий форму для создания вопроса типа "формула"
        /// </summary>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateFormula()
        {
            try
            {
                return PartialView();
            }
            catch (Exception exc)
            {
                return RedirectToAction("PartialViewError", "Home");
            }
        }

        /// <summary>
        /// Action, выполняющий создание вопроса (в разделе с идентификатором alias)
        /// </summary>
        /// <param name="alias">идентификатор раздела</param>
        /// <param name="form">форма, отправленная на сервер</param>
        [ValidateInput(false)]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(long alias, FormCollection form)
        {
            try
            {
                string title = HttpUtility.HtmlDecode(form["Title"]);
                string text  = HttpUtility.HtmlDecode(form["Text"]);
                int    type  = Convert.ToInt32(form["QuestionTypeList"]);

                byte canCommented = 1;

                if (form["CanCommented"].ToLower().Equals(false.ToString().ToLower()))
                {
                    canCommented = 0;
                }
                
                long questionId = repositoryManager.GetQuestionRepository.Add(alias, title, type, text, canCommented);

                foreach (string key in form.AllKeys)
                {
                    if (key.StartsWith(VLKConstants.NEW_VARIANT_ANSWER_TEXT))
                    {
                        string number = key.Substring(VLKConstants.NEW_VARIANT_ANSWER_TEXT.Length);

                        string ll = form[key];
                        repositoryManager.GetAnswerRepository.Add(questionId,
                                                                  HttpUtility.HtmlDecode(form[key]),
                                                                  Convert.ToDouble(form[VLKConstants.NEW_VARIANT_ANSWER_SCORE + number]));
                    }
                }

                return RedirectToAction("List", new { alias = alias });
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        /// <summary>
        /// Action, выполняющий загрузку и разбор word-документов 
        /// (подготвленный преподавателем список тестовых вопросов)
        /// </summary>
        /// <param name="alias">идентификатор раздела</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Upload(long alias)
        {
            try
            {
                DirectoryInfo targetDir = new DirectoryInfo(HttpContext.Server.MapPath("/Uploads/Word"));
                long docIndex           = targetDir.GetFiles("*.doc").Length;
                
                foreach (string inputTagName in Request.Files)
                {
                    HttpPostedFileBase file = Request.Files[inputTagName];
                    if (file.ContentLength > 0 && file.FileName.EndsWith(".doc"))
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
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        /// <summary>
        /// Action, выполняющий удаление ответа с идентификатором alias
        /// </summary>
        /// <param name="alias">идентификатор ответа</param>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AnswerDelete(long alias)
        {
            try
            {
                long razdelId = repositoryManager.GetAnswerRepository.GetById(alias).Question.RazdelId; ;

                repositoryManager.GetAnswerRepository.DeleteById(alias);

                return RedirectToAction("List", new { alias = razdelId });
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home"); 
            }
        }

        /// <summary>
        /// Action, выполняющий загрузку изображений на сервер
        /// </summary>
        /// <returns>ссылка на загруженное изображение или ошибка</returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult ImageUpload()
        {
            try
            {
                DirectoryInfo targetDir = new DirectoryInfo(HttpContext.Server.MapPath("/Uploads/Images"));

                long imageIndex         = 0;

                long imageNumber        = 0;

                foreach (FileInfo image in targetDir.GetFiles("Image*"))
                {
                    imageNumber = Convert.ToInt64(image.Name.Substring(5,
                                                                       image.Name.LastIndexOf(image.Extension) - 5));


                    if (imageNumber > imageIndex)
                    {
                        imageIndex = imageNumber;
                    }
                }

                ++imageIndex;

                string imageLink = "Используйте файлы jpg | png | gif";

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
                        }
                        else if (file.FileName.EndsWith(".gif"))
                        {
                            string filePath = HttpContext.Server.MapPath("/Uploads/Images") + "\\Image" + (imageIndex).ToString() + ".gif";
                            file.SaveAs(filePath);

                            imageLink = Request.Url.AbsoluteUri.ToLower().Replace("editor/imageupload", "Uploads/Images/Image" + (imageIndex).ToString() + ".gif");
                        }
                        else if (file.FileName.EndsWith(".png"))
                        {
                            string filePath = HttpContext.Server.MapPath("/Uploads/Images") + "\\Image" + (imageIndex).ToString() + ".png";
                            file.SaveAs(filePath);

                            imageLink = Request.Url.AbsoluteUri.ToLower().Replace("editor/imageupload", "Uploads/Images/Image" + (imageIndex).ToString() + ".png");
                        }

                        ++imageIndex;
                    }
                }

                return new JsonResult
                {
                    ContentType = "text/html",

                    Data = imageLink
                };
            }
            catch (Exception exc)
            {
                return new JsonResult
                {
                    ContentType = "text/html",

                    Data = "Ошибка на сервере"
                };
            }
        }

        /// <summary>
        /// Action, отображающий список вопросов с атрибутом IsDeleted == 1 (удаленные вопросы)
        /// с возможностью их восстановления
        /// </summary>
        /// <param name="alias">идентификатор раздела</param>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Restore(long alias)
        {
            try
            {
                GeneralMenu();
                
                ViewData[Constants.PAGE_TITLE] = "Редактор тестовых вопросов";

                ViewData["QuestionsList"]       = repositoryManager.GetQuestionRepository.GetDeletedQuestionsByRazdelId(alias);
                ViewData["RazdelId"]            = alias;
                ViewData["DisciplineTitle"]     = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineTitle(alias);
                ViewData["TopicTitle"]          = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineTopicTitle(alias);
                ViewData["RazdelTitle"]         = repositoryManager.GetRazdelRepository.GetTitle(alias);
                ViewData["ProfessorNickName"]   = repositoryManager.GetRazdelRepository.GetProfessorNickNameByRazdelId(alias);
                ViewData["DisciplineAlias"]     = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineAlias(alias);
                ViewData["TopicId"]             = repositoryManager.GetRazdelRepository.GetById(alias).SpecialityDisciplineTopicId;

                return View();
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home"); 
            }
        }

        /// <summary>
        /// Action, выполняющий восстановление вопроса с идентификатором alias
        /// </summary>
        /// <param name="alias">идентификатор вопроса</param>
        [AcceptVerbs(HttpVerbs.Post)]
        public void RestoreQuestion(long alias)
        {
            try
            {
                repositoryManager.GetQuestionRepository.ChangeIsDeletedState(alias, VLKConstants.QUESTION_NOT_DELETED);
            }
            catch (Exception exc)
            {
            }
        }

        /// <summary>
        /// Action, выполняющий отображение вопроса с идентификатором alias
        /// </summary>
        /// <param name="alias">идентификатор вопроса</param>
        public ActionResult Question(long alias)
        {
            try
            {
                GeneralMenu();

                ViewData[Constants.PAGE_TITLE] = "Редактор тестовых вопросов";

                long razdelId = repositoryManager.GetQuestionRepository.GetRazdelIdByQuestionId(alias);
                
                ViewData["QuestionType"]        = repositoryManager.GetQuestionRepository.GetQuestionType(alias);                
                ViewData["QuestionId"]          = alias;

                ViewData["RazdelId"]            = razdelId;
                ViewData["DisciplineTitle"]     = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineTitle(razdelId);
                ViewData["TopicTitle"]          = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineTopicTitle(razdelId);
                ViewData["RazdelTitle"]         = repositoryManager.GetRazdelRepository.GetTitle(razdelId);
                ViewData["ProfessorNickName"]   = repositoryManager.GetRazdelRepository.GetProfessorNickNameByRazdelId(razdelId);
                ViewData["DisciplineAlias"]     = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineAlias(razdelId);
                ViewData["TopicId"]             = repositoryManager.GetRazdelRepository.GetById(razdelId).SpecialityDisciplineTopicId;

                return View();
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }
    }
}