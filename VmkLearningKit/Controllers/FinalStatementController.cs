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
    public class FinalStatementController : AbstractController
    {
        //
        // GET: /FinalStatement/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult FinalStatement(string additional, string alias, string param1)
        {
            GeneralMenu();
            SpecialityDiscipline _discipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
            Professor _professor = repositoryManager.GetProfessorRepository.GetByNickName(alias);
            IEnumerable<Group> _groups = repositoryManager.GetGroupRepository.GetAll();
            ViewData["groups"] = _groups;
            ViewData[Constants.PAGE_TITLE] = "Сводная ведомость тестирования";
            ViewData["ProfessorName"] = _professor.User.SecondName.ToString() + " " +
                _professor.User.FirstName.ToString() + " " + _professor.User.Patronymic.ToString();
            ViewData["Discipline"] = _discipline.Title;
            Department _department = _professor.Chair.Department;

            ViewData["Department"] = _department.Title;
            ViewData["DisciplineId"] = _discipline.Alias;
            ViewData["ProfessorId"] = _professor.User.NickName;
            if (_groups != null)
            {

                if (param1 == null)
                    param1 = _groups.ElementAt(0).Alias;

                Group _group = repositoryManager.GetGroupRepository.GetByAlias(param1);


                ViewData["TitleGroup"] = _group.Title;
                ViewData["IdGroup"] = _group.Alias;

                IEnumerable<User> students = repositoryManager.GetUserRepository.GetByGroupId(_group.Id);
                ViewData["Students"] = students;
                if (null != students)
                {

                    IEnumerable<SpecialityDisciplineTopic> topics = repositoryManager.GetSpecialityDisciplineTopicRepository.GetAllBySpecialityDisciplineId(_discipline.Id).OrderBy(c => c.Id);
                    List<long> varCount = new List<long>();
                    //int countItteratation;
                    if (topics != null)
                    {
                        foreach (SpecialityDisciplineTopic topicItem in topics)
                        {
                            List<AssignedTestVariant> topicAssignedVariants = new List<AssignedTestVariant>();
                            if (students != null && repositoryManager.GetGeneratedTestRepository.GetAllGeneratedTestsByTopicId(topicItem.Id).Count() != 0)
                            {
                                List<GeneratedTestVariant> usingGeneratedTestVariant = new List<GeneratedTestVariant>();
                                foreach (User studentItem in students)
                                {
                                    AssignedTestVariant lastAssignedStudentTestVariant = repositoryManager.GetAssignedTestVariantRepository.GetLastDoneStudentTopicTest(topicItem.Id, studentItem.Id);
                                    if (lastAssignedStudentTestVariant != null)
                                            {
                                                topicAssignedVariants.Add(lastAssignedStudentTestVariant);
                                                usingGeneratedTestVariant.Add(lastAssignedStudentTestVariant.GeneratedTestVariant);
                                            }
                                       
                                }
                                foreach (GeneratedTestVariant usingGTV in ((IEnumerable<GeneratedTestVariant>)usingGeneratedTestVariant).Distinct())
                                {
                                    ViewData["maxScoreVariant_" + usingGTV.Id.ToString()] = repositoryManager.GetGeneratedTestVariantRepository.GetMaxGeneratedTestVariantScore(usingGTV.Id).ToString();
                                }
                            }
                            else Utility.RedirectToErrorPage("в базе данных нет студентов данной группы");
                            ViewData["allAssVariantsByTopic_" + topicItem.Id.ToString()] = topicAssignedVariants;
                            varCount.Add(repositoryManager.GetGeneratedTestVariantRepository.GetCountCurrentTopicTestVariants(topicItem.Id));
                            if (repositoryManager.GetGeneratedTestVariantRepository.GetCurrentVariantsTestByTopicId(topicItem.Id) != null)
                                foreach (GeneratedTestVariant item in repositoryManager.GetGeneratedTestVariantRepository.GetAllGeneratedTestVariantsByTopicId(topicItem.Id))
                                {
                                    ViewData[topicItem.Id.ToString() + "hasLocalNumber_" + item.Id.ToString()] = repositoryManager.GetGeneratedTestVariantRepository.GetLocalNumGeneratedTestVariant(item.Id);
                                }
                        }
                    }
                    else Utility.RedirectToErrorPage("в базе данных нет тем поданной дисциплине");
                    ViewData["CountVariants"] = varCount;
                    ViewData["Topics"] = topics;
                }
            }
            return View();
        }


    }
}
