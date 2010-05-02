using System;
using System.Collections.Generic;
using System.Collections;
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
        /// Action, отображающий форму кабинета преподавателя при обращении к domain.ru/Cabinet/Professor
        /// <param name="alias">NickName преподавателя</param>
        /// <param name="additional">Алиас дисциплины</param>
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
                        SetLecturePlanDates(specialityDiscipline.Id);
                        ViewData["SpecialityDiscipline"] = specialityDiscipline;
                        ViewData["SpecialityDisciplineTopics"] = specialityDiscipline.SpecialityDisciplineTopics;
                        ViewData["LecturePlans"] = repositoryManager.GetLecturePlanRepository.GetBySpecialityDisciplineId(specialityDiscipline.Id);

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
        /// Action, отображающий форму кабинета преподавателя при обращении к domain.ru/Cabinet/Professor
        /// <param name="alias">NickName преподавателя</param>
        /// <param name="additional">Алиас дисциплины</param>
        /// </summary>
        [AuthorizeFilter(Roles = "Professor")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Professor(FormCollection form, string alias, string additional)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;

            if (null != form["SaveLecturePlans"])
            {
                bool hasErrors = false;
                string errorMessage = String.Empty;

                string lectionPlanIds = form["LectionPlanIds"];
                string[] planIds = lectionPlanIds.Split(',');
                if (null != planIds && planIds.Count() > 0)
                {
                    foreach (string planId in planIds)
                    {
                        string newTopicTitleFormName = "LectionPlanId_" + planId;
                        string topicTitleErrorFormName = "LectionPlan" + planId + "Error";
                        string newTopicTitle = form[newTopicTitleFormName];
                        ViewData[newTopicTitleFormName] = newTopicTitle;
                        if (null != newTopicTitle && !newTopicTitle.Trim().Equals(String.Empty))
                        {
                            try
                            {
                                long id = Convert.ToInt64(planId);
                                LecturePlan plan = repositoryManager.GetLecturePlanRepository.GetById(id);
                                if (null != plan)
                                {
                                    plan.SpecialityDisciplineTopic.Title = newTopicTitle;
                                    SpecialityDisciplineTopic topic = repositoryManager.GetSpecialityDisciplineTopicRepository.SetTitle(plan.SpecialityDisciplineTopicId, newTopicTitle);
                                    if (null == topic)
                                    {
                                        hasErrors = true;
                                        errorMessage = "При сохранении обнаружены ошибки";
                                        ViewData[topicTitleErrorFormName] = "Не удалось сохранить название темы";
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                Utility.WriteToLog("CabinetController.Professor: Can't convert LecturePlanId from string to long: string = " + planId, ex);
                                hasErrors = true;
                                errorMessage = "При сохранении обнаружены ошибки";
                                ViewData[topicTitleErrorFormName] = "Не удалось получить план для данной темы";
                            }
                        }
                        else
                        {
                            hasErrors = true;
                            errorMessage = "При сохранении обнаружены ошибки";
                            ViewData[topicTitleErrorFormName] = "Название темы не может быть пустым";
                        }
                    }
                }
                else
                {
                    hasErrors = true;
                    errorMessage = "Отсутствует строка с содержанием идентификаторов тем";
                }

                ViewData["LecturePlanSavingHasErrors"] = hasErrors;
                if (hasErrors)
                {
                    ViewData["LecturePlanErrorMessage"] = errorMessage;
                }
            }

            if (null != alias && !alias.Trim().Equals(String.Empty))
            {
                Professor professor = repositoryManager.GetProfessorRepository.GetByNickName(alias);
                ViewData["Professor"] = professor;
                // отображение тем дисциплины
                if (null != additional && !additional.Trim().Equals(String.Empty))
                {
                    SpecialityDiscipline specialityDiscipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
                    SetLecturePlanDates(specialityDiscipline.Id);
                    ViewData["SpecialityDiscipline"] = specialityDiscipline;
                    ViewData["SpecialityDisciplineTopics"] = specialityDiscipline.SpecialityDisciplineTopics;
                    ViewData["LecturePlans"] = repositoryManager.GetLecturePlanRepository.GetBySpecialityDisciplineId(specialityDiscipline.Id);

                }
                // отображение списка дисциплин
                else
                {
                    IEnumerable<SpecialityDiscipline> specialityDisciplines = repositoryManager.GetSpecialityDisciplineRepository.GetAllByProfessor(professor.User.NickName);
                    ViewData["ProfessorSpecialityDisciplines"] = specialityDisciplines;
                }
            }
            return View();
        }

        /// <summary>
        /// Action, отображающий расписание студента
        /// </summary>
        [AuthorizeFilter(Roles = "Student")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Schedule(string alias, string additional)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;

            return View(Constants.CABINET_STUDENT_VIEWS + "Schedule.aspx");
        }

        /// <summary>
        /// Action, отображающий список тестовых заданий студента
        /// </summary>
        [AuthorizeFilter(Roles = "Student")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Testing(string alias, string additional)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            if (null != Session["user"])
            {
                VmkLearningKit.Models.Domain.User user = (VmkLearningKit.Models.Domain.User)Session["user"];
                IEnumerable<AssignedTestVariant> assignedTestVariants = repositoryManager.GetAssignedTestVariantRepository.GetAll(user.DbUser.Id);

                ViewData["AssignedTestVariants"] = assignedTestVariants;
            }
            return View(Constants.CABINET_STUDENT_VIEWS + "Testing.aspx");
        }

        /// <summary>
        /// Action, отображающий график занятий студента
        /// </summary>
        [AuthorizeFilter(Roles = "Student")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Student(string alias, string additional)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            if (null != alias && !alias.Trim().Equals(String.Empty))
            {
                Student student = repositoryManager.GetStudentRepository.GetByNickName(alias);
                if (null != student)
                {
                    //if (alias.Trim().Equals("Timetable"))
                    {
                        int timetablePage = 1;
                        if (null != additional && !additional.Trim().Equals(String.Empty))
                        {
                            try
                            {
                                timetablePage = Convert.ToInt32(additional);
                            }
                            catch (Exception ex)
                            {
                                Utility.WriteToLog("CabinetController.Timetable: can't convert timetablePage string to int: " + additional, ex);
                            }
                        }
                        else
                        {
                            timetablePage = GetRelevantTimetablePage();
                        }

                        int[] pages = GetTimetablePages();
                        if (timetablePage > pages.Length)
                        {
                            timetablePage = pages.Length;
                            ViewData["InfoMessage"] = "Это последняя учебная неделя";
                        }
                        short[] terms = GetTermsByGroupTitle(student.Group.Title);
                        IEnumerable<LecturePlan> lecturePlans = GetTimetablePageLecturePlans(timetablePage, student.Group.SpecialityId, terms);

                        ViewData["TimetablePage"] = timetablePage;
                        ViewData["TimetableLecturePlans"] = lecturePlans;
                        ViewData["TimetablePages"] = pages;
                        ViewData["MondayDate"] = GetMondayDate(GetFirstTermDate()).AddDays((timetablePage - 1) * weekLength); ;
                    }
                }
            }
            return View(Constants.CABINET_STUDENT_VIEWS + "Timetable.aspx");
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

            return View(Constants.CABINET_GENERAL_VIEWS + "AccountSettings.aspx");
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
            if (null != Session["user"] && null != form["SaveAccountSettings"])
            {
                VmkLearningKit.Models.Domain.User user = (VmkLearningKit.Models.Domain.User)Session["user"];
                string firstName = form["FirstName"];
                ViewData["FirstName"] = firstName;
                string secondName = form["SecondName"];
                ViewData["SecondName"] = secondName;
                string patronymic = form["Patronymic"];
                ViewData["Patronymic"] = patronymic;
                string email = form["Email"];
                ViewData["Email"] = email;
                string nickName = form["NickName"];
                ViewData["NickName"] = nickName;

                if (null == firstName || firstName.Trim().Equals(String.Empty))
                {
                    ViewData["FirstNameError"] = Messages.FIELD_MUST_NOT_BE_EMPTY;
                }
                if (null == secondName || secondName.Trim().Equals(String.Empty))
                {
                    ViewData["SecondNameError"] = Messages.FIELD_MUST_NOT_BE_EMPTY;
                }
                if (null == patronymic || patronymic.Trim().Equals(String.Empty))
                {
                    ViewData["PatronymicError"] = Messages.FIELD_MUST_NOT_BE_EMPTY;
                }
                if (null == email || email.Trim().Equals(String.Empty))
                {
                    ViewData["EmailError"] = Messages.FIELD_MUST_NOT_BE_EMPTY;
                }
                if (null == nickName || nickName.Trim().Equals(String.Empty))
                {
                    ViewData["NickNameError"] = Messages.FIELD_MUST_NOT_BE_EMPTY;
                }
                else
                {
                    bool isNickNameExists = repositoryManager.GetUserRepository.IsNickNameExists(user.DbUser.Id, nickName);
                    if (isNickNameExists)
                    {
                        ViewData["NickNameError"] = Messages.USER_WITH_THE_SAME_NICKNAME_EXISTS;
                    }
                }

                if ((null == ViewData["FirstNameError"] || ViewData["FirstNameError"].ToString().Trim().Equals(String.Empty)) &&
                    (null == ViewData["SecondNameError"] || ViewData["SecondNameError"].ToString().Trim().Equals(String.Empty)) &&
                    (null == ViewData["PatronymicError"] || ViewData["PatronymicError"].ToString().Trim().Equals(String.Empty)) &&
                    (null == ViewData["EmailError"] || ViewData["EmailError"].ToString().Trim().Equals(String.Empty)) &&
                    (null == ViewData["NickNameError"] || ViewData["NickNameError"].ToString().Trim().Equals(String.Empty))
                   )
                {
                    user.DbUser.FirstName = firstName.Trim();
                    user.DbUser.SecondName = secondName.Trim();
                    user.DbUser.Patronymic = patronymic.Trim();
                    user.DbUser.Email = email.Trim();
                    user.DbUser.NickName = nickName.Trim();
                    try
                    {
                        VmkLearningKit.Models.Repository.User updUser = repositoryManager.GetUserRepository.Update(user.DbUser);
                        if (null != updUser)
                        {
                            user.DbUser = updUser;
                            Session["user"] = user;
                            ViewData["UserErrorMessage"] = String.Empty;
                        }
                        else
                        {
                            ViewData["UserErrorMessage"] = Messages.USER_SETTINGS_IS_NOT_UPDATED;
                        }
                    }
                    catch (Exception ex)
                    {
                        Utility.WriteToLog("!!!!IMPORTANT Can't update user at accountSettings page with id: " + user.DbUser.Id, ex);
                    }
                }
                else
                {
                    ViewData["UserErrorMessage"] = Messages.USER_SETTINGS_IS_NOT_UPDATED;
                }

                if (user.IsProfessor)
                {
                    string degree = form["Degree"];
                    ViewData["Degree"] = degree;
                    string position = form["Position"];
                    ViewData["Position"] = position;
                    string about = form["About"];
                    ViewData["About"] = about;

                    if (null == degree || degree.Trim().Equals(String.Empty))
                    {
                        ViewData["DegreeError"] = Messages.FIELD_MUST_NOT_BE_EMPTY;
                    }
                    if (null == position || position.Trim().Equals(String.Empty))
                    {
                        ViewData["PositionError"] = Messages.FIELD_MUST_NOT_BE_EMPTY;
                    }
                    if (null == about || about.Trim().Equals(String.Empty))
                    {
                        ViewData["AboutError"] = Messages.FIELD_MUST_NOT_BE_EMPTY;
                    }

                    Professor professor = repositoryManager.GetProfessorRepository.GetById(user.DbUser.Id);

                    if ((null == ViewData["DegreeError"] || ViewData["DegreeError"].ToString().Trim().Equals(String.Empty)) &&
                        (null == ViewData["PositionError"] || ViewData["PositionError"].ToString().Trim().Equals(String.Empty)) &&
                        (null == ViewData["AboutError"] || ViewData["AboutError"].ToString().Trim().Equals(String.Empty))
                       )
                    {
                        professor.Degree = degree.Trim();
                        professor.Position = position.Trim();
                        professor.About = about.Trim();

                        Professor updProfessor = repositoryManager.GetProfessorRepository.Update(professor);
                        if (null == updProfessor)
                        {
                            ViewData["PofessorErrorMessage"] = Messages.PROFESSOR_SETTINGS_IS_NOT_UPDATED;
                        }
                        else
                        {
                            ViewData["PofessorErrorMessage"] = String.Empty;
                        }
                    }
                    else
                    {
                        ViewData["PofessorErrorMessage"] = Messages.PROFESSOR_SETTINGS_IS_NOT_UPDATED;
                    }
                }
            }

            return View(Constants.CABINET_GENERAL_VIEWS + "AccountSettings.aspx");
        }

        /// <summary>
        /// Action, отображающий форму смены пароля
        /// </summary>
        [AuthorizeFilter(Roles = "Student, Admin, Professor, Metodist")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangePassword(string alias)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            ViewData["PasswordLength"] = Constants.PASSWORD_LENGTH;
            return View(Constants.CABINET_GENERAL_VIEWS + "ChangePassword.aspx");
        }

        /// <summary>
        /// Action, отображающий форму смены пароля
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
                ViewData["currentPasswordError"] = "Пароль не может быть пустым";
            }

            if (null != newPassword && !newPassword.Trim().Equals(String.Empty))
            {
                newPassword = newPassword.Trim();

            }
            else
            {
                hasErrors = true;
                ViewData["newPasswordError"] = "Новый пароль не может быть пустым";
            }

            if (null != confirmPassword && !confirmPassword.Trim().Equals(String.Empty))
            {
                confirmPassword = confirmPassword.Trim();

            }
            else
            {
                hasErrors = true;
                ViewData["confirmPasswordError"] = "Пароль не может быть пустым";
            }

            if (null != Session["User"] && !hasErrors)
            {
                VmkLearningKit.Models.Domain.User user = (VmkLearningKit.Models.Domain.User)Session["User"];

                if (!Hash.VerifyHash(currentPassword, user.DbUser.Password))
                {
                    ViewData["currentPasswordError"] = "Неверный пароль";
                    hasErrors = true;
                }
                if (newPassword.Length < Convert.ToInt32(Constants.PASSWORD_LENGTH))
                {
                    ViewData["newPasswordError"] = "Длина пароля должна быть не менее " + Constants.PASSWORD_LENGTH + " символов";
                    hasErrors = true;
                }
                if (!newPassword.Equals(confirmPassword))
                {
                    ViewData["confirmPasswordError"] = "Пароли не совпадают";
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

            return View(Constants.CABINET_GENERAL_VIEWS + "ChangePassword.aspx");
        }

        ///////////////////////////////////////////////////////
        /// GetTimetablePageLecturePlans begins
        ///////////////////////////////////////////////////////

        private IEnumerable<LecturePlan> GetTimetablePageLecturePlans(int pageIndex, long specialityId, short[] terms)
        {
            DateTime firstTermDate = GetMondayDate(GetFirstTermDate()).AddDays((pageIndex - 1) * weekLength);
            DateTime lastTermDate = firstTermDate.AddDays(weekLength);

            IEnumerable<SpecialityDiscipline> specialityDisciplines = repositoryManager.GetSpecialityDisciplineRepository.GetBySpecialityId(specialityId);
            List<LecturePlan> lecturePlans = null;
            foreach (SpecialityDiscipline specialityDiscipline in specialityDisciplines)
            {
                bool hasSpecialityDiscipline = false;
                foreach (SpecialityDisciplineTerm specialityDisciplineTerm in specialityDiscipline.SpecialityDisciplineTerms)
                {
                    short[] officialTerms = GetTermsByDate(DateTime.Now);
                    if (null != terms && terms.Contains(specialityDisciplineTerm.Term) && 
                        officialTerms.Contains(specialityDisciplineTerm.Term))
                    {
                        hasSpecialityDiscipline = true;
                    }
                }
                if (hasSpecialityDiscipline)
                {
                    List<LecturePlan> allLecturePlans = repositoryManager.GetLecturePlanRepository.GetBySpecialityDisciplineId(specialityDiscipline.Id).ToList<LecturePlan>();

                    int lecturePlanCount = allLecturePlans.Count();
                    for (int i = 0; i < lecturePlanCount; i++)
                    {
                        LecturePlan lecturePlan = allLecturePlans[i];
                        if (null != lecturePlan && !lecturePlan.Date.HasValue)
                        {
                            SetLecturePlanDates(lecturePlan.SpecialityDisciplineId);
                            allLecturePlans = repositoryManager.GetLecturePlanRepository.GetBySpecialityDisciplineId(specialityDiscipline.Id).ToList<LecturePlan>();
                            if (null != allLecturePlans)
                            {
                                lecturePlanCount = allLecturePlans.Count();
                            }
                        }
                    }

                    lecturePlans = new List<LecturePlan>();
                    foreach (LecturePlan lecturePlan in allLecturePlans)
                    {
                        if (lecturePlan.Date.HasValue &&
                            lecturePlan.Date.Value >= firstTermDate &&
                            lecturePlan.Date.Value <= lastTermDate)
                        {
                            lecturePlans.Add(lecturePlan);
                        }
                    }
                }
            }

            return lecturePlans;
        }

        private short[] GetTermsByGroupTitle(string groupTitle)
        {
            if (null != groupTitle && !groupTitle.Trim().Equals(String.Empty))
            {
                if (groupTitle.IndexOf("81") < 2 &&
                    groupTitle.IndexOf("81") > -1)
                {
                    return new short[] {1, 2};
                }

                if (groupTitle.IndexOf("82") < 2 &&
                    groupTitle.IndexOf("82") > -1)
                {
                    return new short[] {3, 4};
                }

                if (groupTitle.IndexOf("83") < 2 &&
                    groupTitle.IndexOf("83") > -1)
                {
                    return new short[] {5, 6};
                }

                if (groupTitle.IndexOf("84") < 2 &&
                    groupTitle.IndexOf("84") > -1)
                {
                    return new short[] {7, 8};
                }

                if (groupTitle.IndexOf("85") < 2 &&
                    groupTitle.IndexOf("85") > -1)
                {
                    return new short[] {9, 10};
                }

                if (groupTitle.IndexOf("86") < 2 &&
                    groupTitle.IndexOf("86") > -1)
                {
                    return new short[] { 11, 12 };
                }
            }
            return null;
        }

        ///////////////////////////////////////////////////////
        /// GetTimetablePageLecturePlans ends
        ///////////////////////////////////////////////////////

        ///////////////////////////////////////////////////////
        /// GetTimetablePageCount begins
        ///////////////////////////////////////////////////////

        private int GetDaysInMonth(int monthNumber)
        {
            switch (monthNumber)
            {
                case 1:
                    {
                        return 31;
                        break;
                    }

                case 2:
                    {
                        return 28;
                        break;
                    }

                case 3:
                    {
                        return 31;
                        break;
                    }

                case 4:
                    {
                        return 30;
                        break;
                    }

                case 5:
                    {
                        return 31;
                        break;
                    }

                case 6:
                    {
                        return 30;
                        break;
                    }

                case 7:
                    {
                        return 31;
                        break;
                    }

                case 8:
                    {
                        return 31;
                        break;
                    }

                case 9:
                    {
                        return 30;
                        break;
                    }

                case 10:
                    {
                        return 31;
                        break;
                    }

                case 11:
                    {
                        return 30;
                        break;
                    }

                case 12:
                    {
                        return 31;
                        break;
                    }
            }

            return 0;
        }

        private DateTime GetMondayDate(DateTime date)
        {
            switch (date.DayOfWeek)
            {
                case DayOfWeek.Monday:
                    {
                        return date;
                        break;
                    }
                case DayOfWeek.Tuesday:
                    {
                        return date.AddDays(-1);
                        break;
                    }
                case DayOfWeek.Wednesday:
                    {
                        return date.AddDays(-2);
                        break;
                    }
                case DayOfWeek.Thursday:
                    {
                        return date.AddDays(-3);
                        break;
                    }
                case DayOfWeek.Friday:
                    {
                        return date.AddDays(-4);
                        break;
                    }
                case DayOfWeek.Saturday:
                    {
                        return date.AddDays(-5);
                        break;
                    }
                case DayOfWeek.Sunday:
                    {
                        return date.AddDays(-6);
                        break;
                    }
            }
            return date;
        }

        private int GetRelevantTimetablePage()
        {
            DateTime firstTermDate = GetMondayDate(DateTime.Now);
            DateTime lastTermDate = GetLastTermDate();
            TimeSpan difference = lastTermDate - firstTermDate;
            int days = (int)(difference.TotalDays);

            int weeksFromNow = (int)(days / weekLength) + 1;
            int[] allWeeks = GetTimetablePages();

            return allWeeks.Length - weeksFromNow + 1;
        }

        private int[] GetTimetablePages()
        {
            DateTime firstTermDate = GetMondayDate(GetFirstTermDate());
            DateTime lastTermDate = GetLastTermDate();
            TimeSpan difference = lastTermDate - firstTermDate;
            int days = (int)(difference.TotalDays);
            /*
            int month = firstTermDate.Month + 1;
            while (month < lastTermDate.Month)
            {
                days += GetDaysInMonth(month);
                month += 1;
            }
            
            days += GetDaysInMonth(firstTermDate.Month) - firstTermDate.Day;
            days += lastTermDate.Day;
            */
            int weeks = (int)(days / weekLength) + 1;

            int[] pages = new int[weeks];
            for (int i = 0; i < weeks; i++)
            {
                pages[i] = i + 1;
            }
            return pages;
        }

        ///////////////////////////////////////////////////////
        /// GetTimetablePageCount ends
        ///////////////////////////////////////////////////////

        ////////////////////////////////////////////////////////
        /// SpecialityDisciplineLecturePlans processing begins
        ////////////////////////////////////////////////////////

        private short[] evenTerms = new short[] { 2, 4, 6, 8, 10, 12 };
        private short[] oddTerms = new short[] { 1, 3, 5, 7, 9, 11 };

        enum TermType { Even, Odd }

        // дата первого учебного дня в четных семестрах
        DateTime evenTermFirstDate = new DateTime(DateTime.Now.Year, 2, 12);
        // дата последнего учебного дня в четных семестрах
        DateTime evenTermLastDate = new DateTime(DateTime.Now.Year, 5, 25);

        // дата первого учебного дня в нечетных семестрах
        DateTime oddTermFirstDate = new DateTime(DateTime.Now.Year, 9, 2);
        // дата последнего учебного дня в нечетных семестрах
        DateTime oddTermLastDate = new DateTime(DateTime.Now.Year, 12, 25);
        // длина недели 7 дней
        short weekLength = 7;
        short yearLength = 365;

        private DateTime GetFirstTermDate()
        {
            DateTime firstTermDate = DateTime.Now;

            TermType termType = GetTermTypeByDate(DateTime.Now);
            if (termType == TermType.Even)
            {
                return firstTermDate = evenTermFirstDate;
            }

            if (termType == TermType.Odd)
            {
                return firstTermDate = oddTermFirstDate;
            }
            // this return mustn't be evoked
            return firstTermDate;
        }

        private DateTime GetLastTermDate()
        {
            DateTime lastTermDate = DateTime.Now;

            TermType termType = GetTermTypeByDate(DateTime.Now);
            if (termType == TermType.Even)
            {
                return lastTermDate = evenTermLastDate;
            }

            if (termType == TermType.Odd)
            {
                return lastTermDate = oddTermLastDate;
            }
            // this return mustn't be evoked
            return lastTermDate;
        }

        private DateTime GetFirstDateByDay(string day)
        {
            DateTime firstDate = DateTime.Now;
            DayOfWeek dayOfWeek = Utility.GetDayOfWeekFromString(day);
            TermType termType = GetTermTypeByDate(DateTime.Now);
            if (termType == TermType.Even)
            {
                firstDate = evenTermFirstDate;
            }

            if (termType == TermType.Odd)
            {
                firstDate = oddTermFirstDate;
            }

            while (firstDate.DayOfWeek != dayOfWeek)
            {
                firstDate = firstDate.AddDays(1);
            }

            return firstDate;
        }

        private TermType GetTermTypeByDate(DateTime date)
        {
            if (9 <= date.Month && date.Month < 2)
            {
                return TermType.Odd;
            }
            if (2 <= date.Month && date.Month < 9)
            {
                return TermType.Even;
            }

            return TermType.Odd;
        }

        private short[] GetTermsByDate(DateTime date)
        {
            if (9 <= date.Month && date.Month < 2)
            {
                return oddTerms;
            }
            if (2 <= date.Month && date.Month < 9)
            {
                return evenTerms;
            }
            return null;
        }

        private bool IsDisciplineContainsCurrentTerms(SpecialityDiscipline specialityDiscipline)
        {
            short[] terms = GetTermsByDate(DateTime.Now);
            return IsDisciplineContainsTerms(specialityDiscipline, terms);
        }

        private bool IsDisciplineContainsTerms(SpecialityDiscipline specialityDiscipline, short[] terms)
        {
            bool containsCurrentTerm = false;
            foreach (SpecialityDisciplineTerm specialityDisciplineTerm in specialityDiscipline.SpecialityDisciplineTerms)
            {
                if (terms.Contains(specialityDisciplineTerm.Term))
                {
                    containsCurrentTerm = true;
                    break;
                }
            }
            return containsCurrentTerm;
        }

        private int DateStep(string week)
        {
            switch (week)
            {
                case "Верхняя":
                    return 2;
                    break;
                case "Нижняя":
                    return 2;
                    break;
                case "Каждая":
                    return 1;
                    break;
            }
            return 1;
        }

        private int FirstDateStep(DateTime date, string week)
        {
            switch (week)
            {
                case "Верхняя":
                    if (IsDayOnUpWeek(date))
                    {
                        // дата относится к верхней неделе
                        // занятие идет по верхним неделям
                        // значит первое занятие будет на этой неделе
                        return 1;
                    }
                    else
                    {
                        // дата относится к нижней неделе
                        // занятие идет по верхним неделям
                        // значит первое занятие будет через неделю
                        return 2;
                    }
                    break;
                case "Нижняя":
                    if (IsDayOnUpWeek(date))
                    {
                        // дата относится к верхней неделе
                        // занятие идет по нижним неделям
                        // значит первое занятие будет через неделю
                        return 2;
                    }
                    else
                    {
                        // дата относится к нижней неделе
                        // занятие идет по нижним неделям
                        // значит первое занятие будет на этой неделе
                        return 2;
                    }
                    break;
                case "Каждая":
                    return 1;
                    break;
            }
            return 1;
        }

        private bool IsDayOnUpWeek(DateTime date)
        {
            DateTime currentDate = new DateTime(date.Year, date.Month, 1);
            while (currentDate.DayOfWeek != DayOfWeek.Monday)
            {
                currentDate = currentDate.AddDays(1);
            }
            if (1 <= date.Day && date.Day < currentDate.Day)
            {
                // неделя, к которой относиться передаваемая дата четная (нижняя)
                return false;
            }
            if (currentDate.Day <= date.Day && date.Day < currentDate.Day + weekLength)
            {
                // неделя, к которой относиться передаваемая дата нечетная (верхняя)
                return true;
            }
            if (currentDate.Day + weekLength <= date.Day && date.Day < currentDate.Day + 2 * weekLength)
            {
                // неделя, к которой относиться передаваемая дата четная (нижняя)
                return false;
            }
            if (currentDate.Day + 2 * weekLength <= date.Day && date.Day < currentDate.Day + 3 * weekLength && currentDate.Day + 3 * weekLength <= 31)
            {
                // неделя, к которой относиться передаваемая дата нечетная (верхняя)
                return true;
            }
            if (currentDate.Day + 3 * weekLength <= date.Day && date.Day < currentDate.Day + 4 * weekLength && currentDate.Day + 4 * weekLength <= 31)
            {
                // неделя, к которой относиться передаваемая дата четная (нижняя)
                return false;
            }

            // this return mustn't be evoked
            return true;
        }

        private void SetLecturePlanDates(long specialityDisciplineId)
        {
            SpecialityDiscipline specialityDiscipline = repositoryManager.GetSpecialityDisciplineRepository.GetById(specialityDisciplineId);
            if (null != specialityDiscipline)
            {
                if (IsDisciplineContainsCurrentTerms(specialityDiscipline))
                {
                    string day = String.Empty;
                    string week = String.Empty;
                    IEnumerable<LectureTimetable> lectureTimetables = repositoryManager.GetLectureTimetableRepository.GetBySpecialityDisciplineId(specialityDiscipline.Id);
                    foreach (LectureTimetable timetable in lectureTimetables)
                    {
                        if (timetable.SpecialityDisciplineId == specialityDiscipline.Id &&
                            specialityDiscipline.ProfessorId == timetable.ProfessorId)
                        {
                            day = timetable.Day;
                            week = timetable.Week;
                            break;
                        }
                    }

                    DateTime firstDate = GetFirstDateByDay(day);
                    DateTime lastDate = GetLastTermDate();
                    DateTime currentDate = firstDate;
                    List<DateTime> currentTermDates = new List<DateTime>();

                    // получаем когда будет первое занятие
                    int firstDateStep = FirstDateStep(currentDate, week);
                    // на этой неделе
                    if (1 == firstDateStep)
                    {
                        // currentDate - это первое занятие
                    }
                    // на следующей неделе
                    else if (2 == firstDateStep)
                    {
                        currentDate = currentDate.AddDays(weekLength);
                    }
                    currentTermDates.Add(currentDate);

                    int frequency = DateStep(week);
                    while (currentDate < lastDate)
                    {
                        currentDate = currentDate.AddDays(frequency * weekLength);
                        if (currentDate < lastDate)
                        {
                            currentTermDates.Add(currentDate);
                        }
                    }

                    IEnumerable<LecturePlan> lecturePlans = repositoryManager.GetLecturePlanRepository.GetBySpecialityDisciplineId(specialityDiscipline.Id);
                    int currentDateIndex = 0;
                    foreach (LecturePlan plan in lecturePlans)
                    {
                        if (currentDateIndex < currentTermDates.Count)
                        {
                            plan.Date = currentTermDates[currentDateIndex];
                            LecturePlan planFromDB = repositoryManager.GetLecturePlanRepository.SetDateTime(plan.Id, plan.Date.Value);
                            if (null == planFromDB)
                            {
                                // FIXME: can't set lecture plan date
                            }
                        }
                        currentDateIndex++;
                    }

                    IEnumerable<SpecialityDisciplineTopic> topics = repositoryManager.GetSpecialityDisciplineTopicRepository.GetAllBySpecialityDisciplineId(specialityDiscipline.Id);
                    if (null != topics && currentTermDates.Count > topics.Count())
                    {
                        while (currentDateIndex < currentTermDates.Count)
                        {
                            SpecialityDisciplineTopic topic = new SpecialityDisciplineTopic();
                            topic.Title = "Тема еще не определена";
                            topic.SpecialityDisciplineId = specialityDiscipline.Id;
                            SpecialityDisciplineTopic topicFromDB = repositoryManager.GetSpecialityDisciplineTopicRepository.Add(topic);
                            if (null != topicFromDB)
                            {
                                LecturePlan plan = new LecturePlan();
                                plan.SpecialityDisciplineId = specialityDiscipline.Id;
                                plan.SpecialityDisciplineTopicId = topicFromDB.Id;
                                plan.Date = currentTermDates[currentDateIndex];
                                LecturePlan planFromDB = repositoryManager.GetLecturePlanRepository.Add(plan);
                                if (null == planFromDB)
                                {
                                    // FIXME: can't add lecture plan
                                }
                            }
                            currentDateIndex++;
                        }
                    }

                    if (null != topics && currentTermDates.Count < topics.Count())
                    {
                        int currentIndex = currentTermDates.Count;
                        while (currentIndex < specialityDiscipline.SpecialityDisciplineTopics.Count)
                        {
                            IEnumerable<LecturePlan> lecturePlansForDelete = specialityDiscipline.SpecialityDisciplineTopics[currentIndex].LecturePlans;
                            if (null != lecturePlansForDelete && lecturePlansForDelete.Count() > 0)
                            {
                                try
                                {
                                    int lecturePlansForDeleteCount = lecturePlansForDelete.Count();
                                    for (int i = 0; i < lecturePlansForDeleteCount; i++)
                                    {
                                        LecturePlan lecturePlanForDelete = lecturePlansForDelete.ElementAt(i);
                                        try
                                        {
                                            repositoryManager.GetLecturePlanRepository.Delete(lecturePlanForDelete);
                                        }
                                        catch (Exception ex)
                                        {
                                            Utility.WriteToLog("!!!!IMPORTANT: RecalculateLecturePlanDates: Can't remove lecturePlan with id: " + lecturePlanForDelete.Id, ex);
                                        }
                                    }
                                }
                                catch (Exception ex)
                                {
                                    Utility.WriteToLog("RecalculateLecturePlanDates: Not important exception", ex);
                                }
                            }

                            IEnumerable<PracticePlan> practicePlansForDelete = specialityDiscipline.SpecialityDisciplineTopics[currentIndex].PracticePlans;
                            if (null != practicePlansForDelete && practicePlansForDelete.Count() > 0)
                            {
                                try
                                {
                                    int practicePlansForDeleteCount = practicePlansForDelete.Count();
                                    for (int i = 0; i < practicePlansForDeleteCount; i++)
                                    {
                                        PracticePlan practicePlanForDelete = practicePlansForDelete.ElementAt(i);
                                        try
                                        {
                                            repositoryManager.GetPracticePlanRepository.Delete(practicePlanForDelete);
                                        }
                                        catch (Exception ex)
                                        {
                                            Utility.WriteToLog("!!!!IMPORTANT: RecalculatePracticePlanDates: Can't remove practicePlan with id: " + practicePlanForDelete.Id, ex);
                                        }
                                    }
                                }
                                catch (Exception ex)
                                {
                                    Utility.WriteToLog("RecalculateLecturePlanDates: Not important exception", ex);
                                }
                            }
                            repositoryManager.GetSpecialityDisciplineTopicRepository.Delete(specialityDiscipline.SpecialityDisciplineTopics[currentIndex]);
                            //currentIndex++;
                        }
                    }

                }
            }
        }

        ////////////////////////////////////////////////////////
        /// SpecialityDisciplineLecturePlans processing ends
        ////////////////////////////////////////////////////////

    }
}
