using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using VmkLearningKit.Models.Repository;
using VmkLearningKit.Core;

namespace VmkLearningKit.Controllers
{
    [AuthorizeFilter(Roles = "Admin, Professor, Metodist")]
    public class StatementController : AbstractController
    {
        //
        // GET: /Statement/

        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Statement(string additional, string alias, string param1)
        {
            SpecialityDiscipline _discipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
            Professor _professor = repositoryManager.GetProfessorRepository.GetByNickName(alias);
            IEnumerable<Group> _groups = repositoryManager.GetGroupRepository.GetAllByDisciplineProfessor(_discipline.Id, _professor.User.Id);
            if (param1 == null)
                param1 = _groups.ElementAt(1).Alias;

            Group _group = repositoryManager.GetGroupRepository.GetByAlias(param1);
            Department _department = repositoryManager.GetGroupRepository.GetById(_group.Id).Department;


            ViewData[Constants.PAGE_TITLE] = "¬едомость тестировани€";
            ViewData["ProfessorName"] = _professor.User.SecondName.ToString() + " " +
                _professor.User.FirstName.ToString() + " " + _professor.User.Patronymic.ToString();
            ViewData["TitleGroup"] = _group.Title;
            ViewData["IdGroup"] = _group.Alias;
            ViewData["Discipline"] = _discipline.Title;
            ViewData["Department"] = _department.Title;
            ViewData["groups"] = repositoryManager.GetGroupRepository.GetAllByDisciplineProfessor(_discipline.Id, _professor.User.Id);
            ViewData["DisciplineId"] = _discipline.Alias;
            ViewData["ProfessorId"] = _professor.User.NickName;
            IEnumerable<User> students = repositoryManager.GetUserRepository.GetByGroupId(_group.Id);
            IEnumerable<SpecialityDisciplineTopic> topics = repositoryManager.GetSpecialityDisciplineTopicRepository.GetAllBySpecialityDisciplineId(_discipline.Id).OrderBy(c => c.Id);
            List<long> varCount = new List<long>();
            if (topics != null)
            {
                foreach (SpecialityDisciplineTopic topicItem in topics)
                {
                    List<AssignedTestVariant> topicAssignedVariants = new List<AssignedTestVariant>();
                    if (students != null && repositoryManager.GetGeneratedTestRepository.GetAllGeneratedTestsByTopicId(topicItem.Id).Count() != 0)
                    {
                        foreach (User studentItem in students)
                        {
                            IEnumerable<AssignedTestVariant> allAssignedStudentTestVariant = repositoryManager.GetAssignedTestVariantRepository.GetAllStudentTopicTests(topicItem.Id, studentItem.Id);
                            if (allAssignedStudentTestVariant != null && allAssignedStudentTestVariant.Count() != 0)
                            {
                                allAssignedStudentTestVariant.OrderByDescending(o => o.AssignedDate);
                                AssignedTestVariant tmp;
                                for (int i = 0; i <= 2; i++)
                                {
                                    try
                                    {
                                        tmp = allAssignedStudentTestVariant.ElementAt(i);
                                    }
                                    catch (Exception ex) { tmp = null; }
                                    if (tmp != null)
                                        topicAssignedVariants.Add(tmp);
                                }
                            }
                        }

                    }
                    else Utility.RedirectToErrorPage("в базе данных нет студентов данной группы");
                    ViewData["allAssVariantsByTopic_" + topicItem.Id.ToString()] = topicAssignedVariants;
                    varCount.Add(repositoryManager.GetGeneratedTestVariantRepository.GetCountCurrentTopicTestVariants(topicItem.Id));
                    if (repositoryManager.GetGeneratedTestVariantRepository.GetCurrentVariantsTestByTopicId(topicItem.Id) != null)
                        foreach (GeneratedTestVariant item in repositoryManager.GetGeneratedTestVariantRepository.GetAllGeneratedTestVariantsByTopicId(topicItem.Id))
                        {
                            ViewData[topicItem.Id.ToString() + "_" + item.Id.ToString()] = repositoryManager.GetGeneratedTestVariantRepository.GetLocalNumGeneratedTestVariant(item.Id) + 1;
                        }
                }
            }
            else Utility.RedirectToErrorPage("в базе данных нет тем поданной дисциплине");
            ViewData["CountVariants"] = varCount;
            ViewData["Students"] = students;
            ViewData["Topics"] = topics;
            return View();
        }
        //---------------------------------------------------------------------------
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult SetVariants(FormCollection form)
        {
            if (Request.IsAjaxRequest())
            {
                // получаем объект текущего зарегестрированного пользовател€
                Professor professor = null;
                if(null != Session["user"])
                {
                    try
                    {
                        professor = ((VmkLearningKit.Models.Domain.User)Session["user"]).DbUser.Professor;
                    }
                    catch(Exception ex)
                    {
                        // текущий пользователь - это не профессор, такого быть не должно, так как назначать тестирование
                        // может только преподаватель
                        Utility.WriteToLog("!!!!IMPORTANT Current user working with statement isn't a professor !!!!", ex);
                    }
                }
                string[] tmp1, tmp2, tmp3;
                long studentsId, topicsId, variantNumsId;

                tmp1 = form["students"].Split('_');
                tmp2 = form["topics"].Split('_');
                tmp3 = form["variantNums"].Split('_');
                string str = "";
                int fl = 1;
                long idAddedNewAssignedTestVariant;
                List<int> errors = new List<int>();
                try
                {
                    for (int i = 0; i < tmp1.Length - 1; i++)
                    {
                        if (tmp3[i].Trim() != "")
                        {
                            studentsId = Convert.ToInt64(tmp1[i]);
                            topicsId = Convert.ToInt64(tmp2[i]);
                            variantNumsId = Convert.ToInt64(tmp3[i].Trim());

                            IEnumerable<GeneratedTestVariant> gtv = repositoryManager.GetGeneratedTestVariantRepository.GetCurrentVariantsTestByTopicId(topicsId);
                            if (gtv != null)
                            {
                                int y = Convert.ToInt16(form["dateYear"]);
                                int m = Convert.ToInt16(form["dateMonth"]);
                                int d = Convert.ToInt16(form["dateDay"]);
                                GeneratedTestVariant tmp = gtv.ElementAt((int)(variantNumsId - 1));
                                idAddedNewAssignedTestVariant = repositoryManager.GetAssignedTestVariantRepository.Add(tmp.Id, studentsId, DateTime.Now, professor.UserId);
                                if (idAddedNewAssignedTestVariant == -1)
                                    return new JsonResult
                                    {
                                        ContentType = "text/html",
                                        Data = "не найден архив с тестовым вариантом[-1"
                                    };
                                str += "[" + studentsId.ToString() + "_" + topicsId.ToString() + "_" + variantNumsId.ToString() + "_" + idAddedNewAssignedTestVariant.ToString();
                            }
                            else
                            {
                                /*return new JsonResult
                                {
                                    ContentType = "text/html",
                                    Data = "ќшибка в назначении тестовых вариантов:нет сгенерированных тестов по теме " + repositoryManager.GetSpecialityDisciplineTopicRepository.GetById(topicsId).Title.ToString()
                                 };*/
                                errors.Add(i);
                                fl = 0;
                            }
                        }
                        // else 
                    }
                    if (fl == 0)
                    {
                        String errMessege = "";
                        foreach (int erItem in errors)
                        {
                            errMessege += repositoryManager.GetSpecialityDisciplineTopicRepository.GetById(Convert.ToInt64(tmp2[erItem])).Title.ToString();
                        }
                        return new JsonResult
                        {
                            ContentType = "text/html",
                            Data = "ќшибка в назначении тестовых вариантов:нет сгенерированных тестов по теме " + errMessege

                        };
                    }


                }
                catch (Exception ex)
                {
                    return new JsonResult
                    {
                        ContentType = "text/html",
                        Data = "ѕроизошла ошибка во врем€ назначени€" + ex.ToString()
                    };
                };

                if (fl == 1)
                    return new JsonResult
                    {
                        ContentType = "text/html",
                        Data = "Ќазначение тестов выполненно успешно" + str

                    };

            }
            return RedirectToAction("Statement");
        }
        //-------------------------------------------------------------

    }

}
