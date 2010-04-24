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
        /// Action, отображающий форму студента преподавателя при обращении к domain.ru/Cabinet/Student
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

            return View();
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
            return View();
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

            return View();
        }


        ////////////////////////////////////////////////////////
        /// SpecialityDisciplineLecturePlans processing begins
        ////////////////////////////////////////////////////////

        private short[] evenTerms = new short[] { 2, 4, 6, 8, 10, 12 };
        private short[] oddTerms = new short[] { 1, 3, 5, 7, 9, 11 };

        enum TermType { Even, Odd }

        // дата первого учебного дня в четных семестрах
        DateTime evenTermFirstDate = new DateTime(DateTime.Now.Year, 2, 10);
        // дата последнего учебного дня в четных семестрах
        DateTime evenTermLastDate = new DateTime(DateTime.Now.Year, 5, 10);

        // дата первого учебного дня в нечетных семестрах
        DateTime oddTermFirstDate = new DateTime(DateTime.Now.Year, 9, 3);
        // дата последнего учебного дня в нечетных семестрах
        DateTime oddTermLastDate = new DateTime(DateTime.Now.Year, 12, 25);
        // длина недели 7 дней
        short weekLength = 7;

        private DayOfWeek GetDayOfWeekFromString(string day)
        {
            switch (day)
            {
                case "Понедельник":
                    return DayOfWeek.Monday;
                    break;
                case "Вторник":
                    return DayOfWeek.Tuesday;
                    break;
                case "Среда":
                    return DayOfWeek.Wednesday;
                    break;
                case "Четверг":
                    return DayOfWeek.Thursday;
                    break;
                case "Пятница":
                    return DayOfWeek.Friday;
                    break;
                case "Суббота":
                    return DayOfWeek.Saturday;
                    break;
                case "Воскресенье":
                    return DayOfWeek.Sunday;
                    break;
            }
            // if this return is evoked therefore we have an error with day field in LectureTimetable
            // this return mustn't be evoked
            return DayOfWeek.Monday;
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
            DayOfWeek dayOfWeek = GetDayOfWeekFromString(day);
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
