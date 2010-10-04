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
    /// <summary>
    /// Определяет набор действий для пользователей с ролями «Professor», «Metodist», «Admin» для 
    /// редактора тестовых вопросов
    /// </summary>
    [HandleError]
    [AuthorizeFilter(Roles = "Admin, Professor, Metodist")]
    [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
    public class EditorController : AbstractController
    {
        /// <summary>
        /// Действие, отображающее список тестовых вопросов в разделе с идентификатором alias, 
        /// при выполнении GET-запроса по адресу /Editor/List/alias
        /// </summary>
        /// <param name="alias">Идентификатор раздела</param>
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
                ViewData["ProfessorNickName"] =  ((VmkLearningKit.Models.Domain.User)Session["user"]).DbUser.NickName;
                  
                   
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
        /// Действие, отображающее форму для редактирования тестового вопроса с идентификатором alias, 
        /// на странице списка тестовых вопросов по разделу (List), которому принадлежит тестовый вопрос, 
        /// при выполнении GET-запроса по адресу /Editor/Edit/alias
        /// </summary>
        /// <param name="alias">Идентификатор вопроса</param>
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
        /// Действие, выполняющее обработку изменений, сделанных на странице редактирования тестового вопроса 
        /// с идентификатором alias, при выполнении POST-запроса по адресу /Editor/Edit/alias
        /// </summary>
        /// <param name="alias">Идентификатор вопроса</param>
        /// <param name="form">Форма, отправленная на сервер</param>
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
        /// Действие, выполняющее удаление тестового вопроса с идентификатором alias, 
        /// при выполнении POST-запроса по адресу /Editor/Delete/alias
        /// </summary>
        /// <param name="alias">Идентификатор вопроса</param>
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
        /// Действие, отображающее форму для выбора типа создаваемого тестового вопроса в разделе с 
        /// идентификатором alias, при выполнении GET-запроса по адресу /Editor/Create/alias
        /// </summary>
        /// <param name="alias">Идентификатор раздела</param>
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
                ViewData["ProfessorNickName"] = ((VmkLearningKit.Models.Domain.User)Session["user"]).DbUser.NickName;
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
        /// Действие, отображающее форму для создания тестового вопроса типа «простой вопрос», 
        /// при выполнении POST-запроса по адресу /Editor/CreateSimple
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
        /// Действие, отображающее форму для создания тестового вопроса типа «дистрибутивный вопрос», 
        /// при выполнении POST-запроса по адресу /Editor/CreateDistributive
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
        /// Действие, отображающее форму для создания тестового вопроса типа «альтернативный вопрос», 
        /// при выполнении POST-запроса по адресу /Editor/CreateAlternative
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
        /// Действие, отображающее форму для создания тестового вопроса типа «вопрос-формула», 
        /// при выполнении POST-запроса по адресу /Editor/CreateFormula
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
        /// Действие, выполняющее обработку нового тестового вопроса в разделе с идентификатором alias, 
        /// при выполнении POST-запроса по адресу /Editor/Create/alias
        /// </summary>
        /// <param name="alias">Идентификатор раздела</param>
        /// <param name="form">Форма, отправленная на сервер</param>
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
        /// Действие, выполняющее загрузку на сервер выбранного пользователем файла (Word-документа), 
        /// содержащего список тестовых вопросов по разделу с идентификатором alias, 
        /// а также распознавание и обработку тестовых вопросов
        /// </summary>
        /// <param name="alias">Идентификатор раздела</param>
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

                        //reader.SaveAllImages();

                        QWord.TestQuestionList testQuestionList = reader.ReadWordDocument();

                        for (int i = 0; i < testQuestionList.Count; i++)
                        {
                            QWord.TestQuestion testQuestion = testQuestionList[i];

                            int type = VLKConstants.FAKE_VALUE;
                            switch (testQuestion.Type)
                            {
                                case QWord.QType.Simple:       type = VLKConstants.QUESTION_TYPE_SIMPLE;       break;
                                case QWord.QType.Alternative:  type = VLKConstants.QUESTION_TYPE_ALTERNATIVE;  break;
                                case QWord.QType.Distributive: type = VLKConstants.QUESTION_TYPE_DISTRIBUTIVE; break;
                                case QWord.QType.Formula:      type = VLKConstants.QUESTION_TYPE_FORMULA;      break;

                                default: return RedirectToAction("List", new { alias = alias });
                            }

                            long questionId = repositoryManager.GetQuestionRepository.Add(alias, VLKConstants.TITLE_DEFAULT, type, HttpUtility.HtmlDecode(testQuestion.Question.Text), VLKConstants.QUESTION_CAN_NOT_COMMENTED);

                            for (int j = 0; j < testQuestion.Answers.Count; j++)
                            {
                                repositoryManager.GetAnswerRepository.Add(questionId, HttpUtility.HtmlDecode(testQuestion.Answers[j].Text), (double)testQuestion.Answers[j].Score);
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
        /// Действие, выполняющее удаление ответа с идентификатором alias, 
        /// при выполнении POST-запроса по адресу /Editor/AnswerDelete/alias
        /// </summary>
        /// <param name="alias">Идентификатор ответа</param>
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
        /// Действие, выполняющее загрузку на сервер выбранного пользователем изображения, 
        /// при выполнении POST-запроса по адресу /Editor/ImageUpload
        /// </summary>
        /// <returns>Ссылка на загруженное изображение или ошибка</returns>
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
        /// Действие, отображающее список удаленных тестовых вопросов 
        /// (значение поля «IsDeleted» записи в таблице «Question» равно 1) 
        /// в разделе с идентификатором alias, 
        /// при выполнении GET-запроса по адресу /Editor/Restore/alias
        /// </summary>
        /// <param name="alias">Идентификатор раздела</param>
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
                ViewData["ProfessorNickName"] = ((VmkLearningKit.Models.Domain.User)Session["user"]).DbUser.NickName;
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
        /// Действие, выполняющее восстановление 
        /// (изменение значения поля «IsDeleted» записи в таблице «Question» на 0) 
        /// тестового вопроса с идентификатором alias, 
        /// при выполнении POST-запроса по адресу /Editor/RestoreQuestion/alias
        /// </summary>
        /// <param name="alias">Идентификатор вопроса</param>
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
        /// Действие, отображающее форму для редактирования тестового вопроса с идентификатором alias, 
        /// при выполнении GET-запроса по адресу /Editor/Question/alias
        /// </summary>
        /// <param name="alias">Идентификатор вопроса</param>
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
                ViewData["ProfessorNickName"] = ((VmkLearningKit.Models.Domain.User)Session["user"]).DbUser.NickName;
                ViewData["DisciplineAlias"]     = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineAlias(razdelId);
                ViewData["TopicId"]             = repositoryManager.GetRazdelRepository.GetById(razdelId).SpecialityDisciplineTopicId;

                return View();
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        /// <summary>
        /// Действие, отображающее форму распределения тестовых вопросов в разделе с идентификатором 
        /// additional по группам типа alias 
        /// («Double» - группы «вопросов-дублеров», «Exclusion» - группы «вопросов-исключений»), 
        /// при выполнении GET-запроса по адресу /Editor/Grouping/alias/additional
        /// </summary>
        /// <param name="alias">Тип группы (Double или Exclusion)</param>
        /// <param name="additional">Идентификатор раздела</param>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Grouping(string alias, long additional)
        {
            try
            {
                GeneralMenu();

                ViewData[Constants.PAGE_TITLE] = "Редактор тестовых вопросов";

                ViewData["RazdelId"]            = additional;
                ViewData["DisciplineTitle"]     = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineTitle(additional);
                ViewData["TopicTitle"]          = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineTopicTitle(additional);
                ViewData["RazdelTitle"]         = repositoryManager.GetRazdelRepository.GetTitle(additional);
                ViewData["ProfessorNickName"] = ((VmkLearningKit.Models.Domain.User)Session["user"]).DbUser.NickName;
                ViewData["DisciplineAlias"]     = repositoryManager.GetRazdelRepository.GetSpecialityDisciplineAlias(additional);
                ViewData["TopicId"]             = repositoryManager.GetRazdelRepository.GetById(additional).SpecialityDisciplineTopicId;

                switch (alias)
                {
                    case VLKConstants.QUESTION_GROUP_DOUBLE:
                        {
                            ViewData["QuestionsList"]                   = repositoryManager.GetQuestionRepository.GetNotDeletedQuestionsByRazdelIdWithFakeExclusionGroup(additional);
                            ViewData["QuestionsListSortedByGroupIndex"] = repositoryManager.GetQuestionRepository.GetNotDeletedQuestionsByRazdelIdSortedByDoubleGroup(additional);
                            ViewData["MaxQuestionGroupIndex"]           = repositoryManager.GetQuestionRepository.GetMaxQuestionDoubleGroupInRazdel(additional);
                            ViewData["QuestionGroupType"]               = VLKConstants.QUESTION_GROUP_DOUBLE;
                            ViewData["AddToGroupMethod"]                = "AddToDoubleGroup";
                            ViewData["GroupsCount"]                     = repositoryManager.GetQuestionRepository.GetDifferentDoubleGroupsCountInRazdel(additional);
                            
                            break;
                        }
                    case VLKConstants.QUESTION_GROUP_EXCLUSION:
                        {
                            ViewData["QuestionsList"]                   = repositoryManager.GetQuestionRepository.GetNotDeletedQuestionsByRazdelIdWithFakeDoubleGroup(additional);
                            ViewData["QuestionsListSortedByGroupIndex"] = repositoryManager.GetQuestionRepository.GetNotDeletedQuestionsByRazdelIdSortedByExclusionGroup(additional);
                            ViewData["MaxQuestionGroupIndex"]           = repositoryManager.GetQuestionRepository.GetMaxQuestionExclusionGroupInRazdel(additional);
                            ViewData["QuestionGroupType"]               = VLKConstants.QUESTION_GROUP_EXCLUSION;
                            ViewData["AddToGroupMethod"]                = "AddToExclusionGroup";
                            ViewData["GroupsCount"]                     = repositoryManager.GetQuestionRepository.GetDifferentExclusionGroupsCountInRazdel(additional);

                            break;
                        }
                    default:
                        {
                            return RedirectToAction("Error", "Home", new { alias = "404" });
                        }
                }
                
                return View();
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        /// <summary>
        /// Действие, выполняющее добавление тестового вопроса с идентификатором alias в группу 
        /// «вопросов-дублеров» с номером additional, 
        /// при выполнении POST-запроса по адресу /Editor/AddToDoubleGroup/alias/additional
        /// </summary>
        /// <param name="alias">Идентификатор вопроса</param>
        /// <param name="additional">Номер группы</param>
        [AcceptVerbs(HttpVerbs.Post)]
        public void AddToDoubleGroup(long alias, int additional)
        {
            try
            {
                repositoryManager.GetQuestionRepository.ChangeDoubleGroup(alias, additional);
            }
            catch (Exception exc)
            {
                RedirectToAction("Error", "Home");
            }
        }

        /// <summary>
        /// Действие, выполняющее добавление тестового вопроса с идентификатором alias в группу 
        /// «вопросов-исключений» с номером additional, 
        /// при выполнении POST-запроса по адресу /Editor/AddToExclusionGroup/alias/additional
        /// </summary>
        /// <param name="alias">Идентификатор вопроса</param>
        /// <param name="additional">Номер группы</param>
        [AcceptVerbs(HttpVerbs.Post)]
        public void AddToExclusionGroup(long alias, int additional)
        {
            try
            {
                repositoryManager.GetQuestionRepository.ChangeExclusionGroup(alias, additional);
            }
            catch (Exception exc)
            {
                RedirectToAction("Error", "Home");
            }
        }
    }
}