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
    public class StatementController : AbstractController
    {
        //
        // GET: /Statement/

        public ActionResult Index()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Statement(string discipline, string professor,string group)
        {
            SpecialityDiscipline _discipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(discipline);
            Professor _professor = repositoryManager.GetProfessorRepository.GetByNickName(professor);
            IEnumerable<Group> _groups = repositoryManager.GetGroupRepository.GetAllByDisciplineProfessor(_discipline.Id, _professor.User.Id);
            if (group == null)
                group = _groups.ElementAt(0).Alias;

            Group _group = repositoryManager.GetGroupRepository.GetByAlias(group);
            Department _department = repositoryManager.GetGroupRepository.GetById(_group.Id).Department;


            ViewData[Constants.PAGE_TITLE] = "Ведомость тестирования";
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

                    if (students != null)
                    {
                        foreach (User studentItem in students)
                        {
                            IEnumerable<AssignedTestVariant> allAssignedStudentTestVariant = repositoryManager.GetAssignedTestVariantRepository.GetAllStudentTopicTests(topicItem.Id, studentItem.Id);
                            if (allAssignedStudentTestVariant != null)
                            {
                                allAssignedStudentTestVariant.OrderByDescending(o => o.AssignedDate);
                                AssignedTestVariant tmp;
                                for (int i = 2; i >= 0; i--)
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
                    ViewData[topicItem.Id.ToString()] = topicAssignedVariants;
                    varCount.Add(repositoryManager.GetGeneratedTestVariantRepository.GetCountCurrentTopicTestVariants(topicItem.Id));
                    if (repositoryManager.GetGeneratedTestVariantRepository.GetCurrentVariantsTestByTopicId(topicItem.Id) != null)
                        foreach (GeneratedTestVariant item in repositoryManager.GetGeneratedTestVariantRepository.GetCurrentVariantsTestByTopicId(topicItem.Id))
                        {
                            ViewData[topicItem.Id.ToString() + "_" + item.Id.ToString()] = repositoryManager.GetGeneratedTestVariantRepository.GetLocalNumGeneratedTestVariantVariant(item.Id) + 1;
                        }
                }
            }
            else Utility.RedirectToErrorPage("в базе данных нет тем поданной дисциплине");
            ViewData["CountVar"] = varCount;
            ViewData["Students"] = students;
            ViewData["Topics"] = topics;
            return View();
        }

    //---------------------------------------------------------------------------------------------------
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult chooseStatement(string alias, string additional)
        {
            SpecialityDiscipline _discipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
            Professor _professor = repositoryManager.GetProfessorRepository.GetByNickName(alias);
            long _departmentId = repositoryManager.GetChairRepository.GetById(_professor.ChairId).DepartmentId;
            Department _department = repositoryManager.GetDepartmentRepository.GetById(_departmentId);
            ViewData[Constants.PAGE_TITLE] = "Ведомость тестирования";
            ViewData["ProfessorName"] = _professor.User.SecondName.ToString() + " " +
                _professor.User.FirstName.ToString() + " " + _professor.User.Patronymic.ToString();
            ViewData["Discipline"] = _discipline.Title;
            ViewData["Department"] = _department.Title;
            IEnumerable<Group> _groups = repositoryManager.GetGroupRepository.GetAllByDisciplineProfessor(_discipline.Id, _professor.User.Id);
            ViewData["groups"] = _groups;

            ViewData["DisciplineId"] = _discipline.Alias;
            ViewData["ProfessorId"] = _professor.User.NickName;
            return View();
        }
//---------------------------------------------------------------------------
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult SetVariants(FormCollection form)
        {
            if (Request.IsAjaxRequest())
            {
                string[] tmp1, tmp2, tmp3;
                long studentsId, topicsId, variantNumsId;

                tmp1 = form["students"].Split('_');
                tmp2 = form["topics"].Split('_');
                tmp3 = form["variantNums"].Split('_');
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
                                int y=Convert.ToInt16(form["dateYear"]);
                                int m=Convert.ToInt16(form["dateMonth"]);
                                int d=Convert.ToInt16(form["dateDay"]);
                                GeneratedTestVariant tmp = gtv.ElementAt((int)(variantNumsId - 1));
                                repositoryManager.GetAssignedTestVariantRepository.SetAssignedTestVariant(tmp.Id, studentsId, new DateTime(y,m,d));
                                return new JsonResult
                                 {
                                     ContentType = "text/html",
                                     Data = "Назначение тестов выполненно успешно"
                                 }; 
                            }
                            return new JsonResult
                            {
                                ContentType = "text/html",
                                Data = "Ошибка в назначении тестовых вариантов:нет сгенерированных тестов по теме " + repositoryManager.GetSpecialityDisciplineTopicRepository.GetById(topicsId).Title.ToString()
                            }; 
                        }
                       // else 
                    }

                    
                }
                catch(Exception ex)
                {
                    return new JsonResult
                    {
                        ContentType = "text/html",
                        Data = "Произошла ошибка во время назначения"+ex.ToString()
                    };
                }
            }
            return RedirectToAction("Statement");
        }
//-------------------------------------------------------------
    
    }

}
