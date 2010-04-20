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
    public class CabinetController : AbstractController
    {
        /// <summary>
        /// Action, отображающий форму кабинета администратора при обращении к domain.ru/Cabinet/Administrator
        /// </summary>
        [AuthorizeFilter(Roles = "Admin")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Admin(string alias)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            return View();
        }

        /// <summary>
        /// Action, отображающий форму кабинета методиста при обращении к domain.ru/Cabinet/Metodist
        /// </summary>
        [AuthorizeFilter(Roles = "Metodist")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Metodist(string alias)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            return View();
        }

        /// <summary>
        /// Action, отображающий форму кабинета преподавател€ при обращении к domain.ru/Cabinet/Professor
        /// <param name="alias">NickName преподавател€</param>
        /// <param name="additional">јлиас дисциплины</param>
        /// </summary>
        [AuthorizeFilter(Roles = "Professor")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Professor(string alias, string additional)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            if (null != alias && !alias.Trim().Equals(String.Empty))
            {
                // отображение детальной информации о дисциплине
                if (alias.Trim().Equals("Detailed"))
                {
                    if (null != additional && !additional.Trim().Equals(String.Empty))
                    {
                        SpecialityDiscipline specialityDiscipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
                        ViewData["SpecialityDiscipline"] = specialityDiscipline;
                        ViewData["Detailed"] = true;
                        ViewData["Professor"] = specialityDiscipline.Professor;
                    }
                }
                else
                {
                    Professor professor = repositoryManager.GetProfessorRepository.GetByNickName(alias);
                    ViewData["Professor"] = professor;
                    // отображение тем дисциплины
                    if (null != additional && !additional.Trim().Equals(String.Empty))
                    {
                        SpecialityDiscipline specialityDiscipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
                        ViewData["SpecialityDiscipline"] = specialityDiscipline;
                        ViewData["SpecialityDisciplineTopics"] = specialityDiscipline.SpecialityDisciplineTopics;
                    }
                    // отображение списка дисциплин
                    else
                    {
                        IEnumerable<SpecialityDiscipline> specialityDisciplines = repositoryManager.GetSpecialityDisciplineRepository.GetAllByProfessor(professor.User.NickName);
                        ViewData["ProfessorSpecialityDisciplines"] = specialityDisciplines;
                    }
                }
            }

            return View();
        }
        /// <summary>
        /// Action, отображающий форму плана лекций при обращении к domain.ru/Cabinet/LecturePlan/<ProfessorNickName>/<SpecialityDisciplineAlias>
        /// </summary>
        /// <param name="alias">NickName преподавател€</param>
        /// <param name="additional">јлиас дисциплины</param>
        [AuthorizeFilter(Roles = "Professor")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult LecturePlan(string alias, string additional)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;

            if (null != alias && !alias.Trim().Equals(String.Empty) &&
                null != additional && !additional.Trim().Equals(String.Empty))
            {
                Professor professor = repositoryManager.GetProfessorRepository.GetByNickName(alias);
                ViewData["Professor"] = professor;

                SpecialityDiscipline specialityDiscipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
                ViewData["SpecialityDiscipline"] = specialityDiscipline;
            }
            return View();
        }

        /// <summary>
        /// Action, отображающий форму плана лекций при обращении к domain.ru/Cabinet/LecturePlan/<ProfessorNickName>/<SpecialityDisciplineAlias>
        /// </summary>
        /// <param name="alias">NickName преподавател€</param>
        /// <param name="additional">јлиас дисциплины</param>
        [AuthorizeFilter(Roles = "Professor")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult LecturePlan(FormCollection form, string alias, string additional)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;

            if (null != form["LecturePlanSubmit"])
            {
                string planDateString = form["planDateArray"];
                bool areDatesCorrect = true;
                if (null != planDateString && !planDateString.Trim().Equals(String.Empty))
                {
                    string[] planIds = planDateString.Split(',');
                    if (null != planIds && planIds.Length > 0)
                    {
                        foreach (string planId in planIds)
                        {
                            string planName = "planDate_" + planId.Trim();
                            string planDate = form[planName];
                            if (null != planDate && !planDate.Trim().Equals(String.Empty))
                            {
                                try
                                {
                                    DateTime dateTime = DateTime.Parse(planDate);
                                    RepositoryManager.GetRepositoryManager.GetLecturePlanRepository.SetDateTime(Convert.ToInt64(planId), dateTime);
                                }
                                catch (Exception ex)
                                {
                                    ViewData[planName] = "Ќеверный формат даты";
                                    areDatesCorrect = false;
                                }
                            }
                        }
                    }
                }

                ViewData["AreDatesCorrect"] = areDatesCorrect;
            }
            if (null != alias && !alias.Trim().Equals(String.Empty) &&
                null != additional && !additional.Trim().Equals(String.Empty))
            {
                Professor professor = repositoryManager.GetProfessorRepository.GetByNickName(alias);
                ViewData["Professor"] = professor;

                SpecialityDiscipline specialityDiscipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
                ViewData["SpecialityDiscipline"] = specialityDiscipline;
            }


            return View();
        }

        /// <summary>
        /// Action, отображающий форму плана практик при обращении к domain.ru/Cabinet/PracticePlan/<ProfessorNickName>/<SpecialityDisciplineAlias>
        /// </summary>
        /// <param name="alias">NickName преподавател€</param>
        /// <param name="additional">јлиас дисциплины</param>
        [AuthorizeFilter(Roles = "Professor")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult PracticePlan(string alias, string additional)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;

            if (null != alias && !alias.Trim().Equals(String.Empty) &&
                null != additional && !additional.Trim().Equals(String.Empty))
            {
                Professor professor = repositoryManager.GetProfessorRepository.GetByNickName(alias);
                ViewData["Professor"] = professor;

                SpecialityDiscipline specialityDiscipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
                ViewData["SpecialityDiscipline"] = specialityDiscipline;

                IEnumerable<Group> groups = repositoryManager.GetGroupRepository.GetAllByDepartmentId(professor.Chair.DepartmentId);
                ViewData["Groups"] = groups;
                Group group = groups.First();
                ViewData["Group"] = group;

                bool isPracticePlanAssigned = true;
                foreach (SpecialityDisciplineTopic specialityDisciplineTopic in specialityDiscipline.SpecialityDisciplineTopics)
                {
                    IEnumerable<PracticePlan> plans = repositoryManager.GetPracticePlanRepository.GetBySpecialityDisciplineTopicIdAndGroupId(specialityDisciplineTopic.Id, group.Id);
                    if (null == plans || plans.Count() != 1)
                    {
                        isPracticePlanAssigned = false;
                    }
                }
                ViewData["IsPracticePlanAssigned"] = isPracticePlanAssigned;

                IEnumerable<PracticePlan> practicePlans = repositoryManager.GetPracticePlanRepository.GetByGroupId(group.Id);
                ViewData["GroupPracticePlans"] = practicePlans;
            }

            return View();
        }

        /// <summary>
        /// Action, отображающий форму плана лекций при обращении к domain.ru/Cabinet/PracticePlan/<ProfessorNickName>/<SpecialityDisciplineAlias>
        /// </summary>
        /// <param name="alias">NickName преподавател€</param>
        /// <param name="additional">јлиас дисциплины</param>
        [AuthorizeFilter(Roles = "Professor")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult PracticePlan(FormCollection form, string alias, string additional)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            if (null != form["PracticePlanSubmit"])
            {
                string planDateString = form["planDateArray"];
                bool areDatesCorrect = true;
                if (null != planDateString && !planDateString.Trim().Equals(String.Empty))
                {
                    string[] planIds = planDateString.Split(',');
                    if (null != planIds && planIds.Length > 0)
                    {
                        foreach (string planId in planIds)
                        {
                            string planName = "planDate_" + planId.Trim();
                            string planDate = form[planName];
                            if (null != planDate && !planDate.Trim().Equals(String.Empty))
                            {
                                try
                                {
                                    DateTime dateTime = DateTime.Parse(planDate);
                                    RepositoryManager.GetRepositoryManager.GetPracticePlanRepository.SetDateTime(Convert.ToInt64(planId), dateTime);
                                }
                                catch (Exception ex)
                                {
                                    ViewData[planName] = "Ќеверный формат даты";
                                    areDatesCorrect = false;
                                }
                            }
                        }
                    }
                }

                ViewData["AreDatesCorrect"] = areDatesCorrect;
            }

            if (null != alias && !alias.Trim().Equals(String.Empty) &&
                null != additional && !additional.Trim().Equals(String.Empty))
            {
                Professor professor = repositoryManager.GetProfessorRepository.GetByNickName(alias);
                ViewData["Professor"] = professor;

                SpecialityDiscipline specialityDiscipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
                ViewData["SpecialityDiscipline"] = specialityDiscipline;

                IEnumerable<Group> groups = repositoryManager.GetGroupRepository.GetAllByDepartmentId(professor.Chair.DepartmentId);
                string groupId = form["Groups"];
                Group group = null;
                if (null != groups)
                {
                    if (null != groupId)
                    {
                        group = repositoryManager.GetGroupRepository.GetById(Convert.ToInt64(groupId));
                    }
                    if (null == group)
                    {
                        group = groups.First();
                    }
                }
                ViewData["Group"] = group;
                ViewData["Groups"] = groups;

                if (null != form["RemovePracticePlanFromGroup"])
                {
                    if (null != group)
                    {
                        foreach (SpecialityDisciplineTopic specialityDisciplineTopic in specialityDiscipline.SpecialityDisciplineTopics)
                        {
                            IEnumerable<PracticePlan> plans = repositoryManager.GetPracticePlanRepository.GetBySpecialityDisciplineTopicIdAndGroupId(specialityDisciplineTopic.Id, group.Id);
                            foreach(PracticePlan plan in plans)
                            {
                                repositoryManager.GetPracticePlanRepository.Delete(plan);
                            }
                        }
                        ViewData["RemovePracticePlanResult"] = true;
                    }
                }

                if (null != form["AssignPracticePlanToGroup"])
                {
                    if (null != group)
                    {
                        foreach (SpecialityDisciplineTopic specialityDisciplineTopic in specialityDiscipline.SpecialityDisciplineTopics)
                        {
                            IEnumerable<PracticePlan> plans = repositoryManager.GetPracticePlanRepository.GetBySpecialityDisciplineTopicIdAndGroupId(specialityDisciplineTopic.Id, group.Id);
                            if (null == plans || plans.Count() == 0)
                            {
                                PracticePlan practicePlan = new PracticePlan();
                                practicePlan.GroupId = group.Id;
                                practicePlan.SpecialityDisciplineId = specialityDiscipline.Id;
                                practicePlan.SpecialityDisciplineTopicId = specialityDisciplineTopic.Id;

                                PracticePlan practicePlanFromDB = repositoryManager.GetPracticePlanRepository.GetDefault(specialityDisciplineTopic.Id);
                                if (null != practicePlanFromDB)
                                {
                                    practicePlan.Volume = practicePlanFromDB.Volume;
                                }

                                PracticePlan addedPracticePlan = repositoryManager.GetPracticePlanRepository.Add(practicePlan);
                                if (null == addedPracticePlan)
                                {
                                    ViewData["AssignedPracticePlanResult"] = false;
                                }
                            }
                        }
                        if (null == ViewData["AssignedPracticePlanResult"])
                        {
                            ViewData["AssignedPracticePlanResult"] = true;
                        }
                    }
                }

                bool isPracticePlanAssigned = true;
                foreach (SpecialityDisciplineTopic specialityDisciplineTopic in specialityDiscipline.SpecialityDisciplineTopics)
                {
                    IEnumerable<PracticePlan> plans = repositoryManager.GetPracticePlanRepository.GetBySpecialityDisciplineTopicIdAndGroupId(specialityDisciplineTopic.Id, group.Id);
                    if (null == plans || plans.Count() != 1)
                    {
                        isPracticePlanAssigned = false;
                    }
                }
                ViewData["IsPracticePlanAssigned"] = isPracticePlanAssigned;

                IEnumerable<PracticePlan> practicePlans = repositoryManager.GetPracticePlanRepository.GetByGroupId(group.Id);
                ViewData["GroupPracticePlans"] = practicePlans;
            }


            return View();
        }

        /// <summary>
        /// Action, отображающий форму студента преподавател€ при обращении к domain.ru/Cabinet/Student
        /// </summary>
        [AuthorizeFilter(Roles = "Student")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Student(string alias)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            return View();
        }

        /// <summary>
        /// Action, отображающий форму меню (выбора опций управлени€) при обращении к domain.ru/Cabinet/Menu
        /// </summary>
        [AuthorizeFilter(Roles = "Admin, Professor, Metodist")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Menu()
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            return View();
        }

        /// <summary>
        /// Action, отображающий форму настроек аккаунта
        /// </summary>
        [AuthorizeFilter(Roles = "Student, Admin, Professor, Metodist")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult AccountSettings(string alias)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            return View();
        }

        /// <summary>
        /// Action, отображающий форму настроек аккаунта
        /// </summary>
        [AuthorizeFilter(Roles = "Student, Admin, Professor, Metodist")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AccountSettings(FormCollection form, string alias)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            return View();
        }

        /// <summary>
        /// Action, отображающий форму смены парол€
        /// </summary>
        [AuthorizeFilter(Roles = "Student, Admin, Professor, Metodist")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangePassword(string alias)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            ViewData["PasswordLength"] = Constants.PASSWORD_LENGTH;
            return View();
        }

        /// <summary>
        /// Action, отображающий форму смены парол€
        /// </summary>
        [AuthorizeFilter(Roles = "Student, Admin, Professor, Metodist")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ChangePassword(FormCollection form, string alias)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;

            string currentPassword = form["currentPassword"];
            string newPassword = form["newPassword"];
            string confirmPassword = form["confirmPassword"];
            bool hasErrors = false;

            if (null != currentPassword && !currentPassword.Trim().Equals(String.Empty))
            {
                currentPassword = currentPassword.Trim();
            }
            else
            {
                hasErrors = true;
                ViewData["currentPasswordError"] = "ѕароль не может быть пустым";
            }

            if (null != newPassword && !newPassword.Trim().Equals(String.Empty))
            {
                newPassword = newPassword.Trim();
                
            }
            else
            {
                hasErrors = true;
                ViewData["newPasswordError"] = "Ќовый пароль не может быть пустым";
            }

            if (null != confirmPassword && !confirmPassword.Trim().Equals(String.Empty))
            {
                confirmPassword = confirmPassword.Trim();

            }
            else
            {
                hasErrors = true;
                ViewData["confirmPasswordError"] = "ѕароль не может быть пустым";
            }

            if (null != Session["User"] && !hasErrors)
            {
                VmkLearningKit.Models.Domain.User user = (VmkLearningKit.Models.Domain.User)Session["User"];
                
                if (!Hash.VerifyHash(currentPassword, user.DbUser.Password))
                {
                    ViewData["currentPasswordError"] = "Ќеверный пароль";
                    hasErrors = true;
                }
                if (newPassword.Length < Convert.ToInt32(Constants.PASSWORD_LENGTH))
                {
                    ViewData["newPasswordError"] = "ƒлина парол€ должна быть не менее " + Constants.PASSWORD_LENGTH + " символов";
                    hasErrors = true;
                }
                if (!newPassword.Equals(confirmPassword))
                {
                    ViewData["confirmPasswordError"] = "ѕароли не совпадают";
                    hasErrors = true;
                }

                if (!hasErrors)
                {
                    user.DbUser.Password = Hash.ComputeHash(newPassword);
                    bool result = repositoryManager.GetUserRepository.ChangePassword(user.DbUser.Id, user.DbUser.Password);
                    hasErrors = !result;
                }
                
            }
            else
            {
                hasErrors = true;
            }

            ViewData["ChangePasswordResult"] = !hasErrors;

            return View();
        }
    }
}
