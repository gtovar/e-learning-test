using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Collections.Specialized;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core
{
    public enum TermType { Even, Odd }

    public enum LogLevel
    {
        Trace,
        Debug,
        Info,
        Warn,
        Error,
        Fatal
    }

    public class Utility
    {
        public static void RedirectToErrorPage(string message, Exception exception, int? errorCode)
        {
            if (!errorCode.HasValue)
            {
                new RedirectResult(Constants.ERROR_URL);
            }
            else
            {
                new RedirectResult(Constants.ERROR_URL + errorCode);
            }

            // FIXME: add logging
        }

        public static void RedirectToErrorPage(string message)
        {
            RedirectToErrorPage(message, null, null);
        }

        public static void RedirectToErrorPage(string message, Exception exception)
        {
            RedirectToErrorPage(message, exception, null);
        }

        public static void WriteToLog(string message, LogLevel logLevel, Exception exception)
        {
            // FIXME: add logging with exception
        }

        public static void WriteToLog(string message, Exception exception)
        {
            // FIXME: add error logging with exception
        }

        public static void WriteToLog(string message, LogLevel logLevel)
        {
            // FIXME: add logging
        }

        public static void WriteToLog(string message)
        {
            // FIXME: add trace logging
        }

        public static LectureTimetable Copy(LectureTimetable obj)
        {
            LectureTimetable copy = new LectureTimetable();
            copy.Id = obj.Id;
            copy.SpecialityDisciplineId = obj.SpecialityDisciplineId;
            copy.ProfessorId = obj.ProfessorId;
            copy.Day = obj.Day;
            copy.Building = obj.Building;
            copy.Room = obj.Room;
            copy.Time = obj.Time;
            copy.Week = obj.Week;

            return copy;
        }

        public static Speciality Copy(Speciality obj)
        {
            Speciality copy = new Speciality();
            copy.Id = obj.Id;
            copy.Alias = obj.Alias;
            copy.Title = obj.Title;
            copy.Abbreviation = obj.Abbreviation;
            copy.DepartmentId = obj.DepartmentId;

            return copy;
        }

        public static SpecialityDisciplineTerm Copy(SpecialityDisciplineTerm obj)
        {
            SpecialityDisciplineTerm copy = new SpecialityDisciplineTerm();
            copy.Id = obj.Id;
            copy.Term = obj.Term;
            copy.Reporting = obj.Reporting;
            copy.LectureVolume = obj.LectureVolume;
            copy.PracticeVolume = obj.PracticeVolume;
            copy.LabVolume = obj.LabVolume;
            copy.SpecialityDisciplineId = obj.SpecialityDisciplineId;

            return copy;
        }

        public static SpecialityDiscipline Copy(SpecialityDiscipline obj)
        {
            SpecialityDiscipline copy = new SpecialityDiscipline();
            copy.Id = obj.Id;
            copy.SpecialityId = obj.SpecialityId;
            copy.ProfessorId = obj.ProfessorId;
            copy.ChairId = obj.ChairId;
            copy.EducationPlanId = obj.EducationPlanId;
            copy.Category = obj.Category;
            copy.Alias = obj.Alias;
            copy.Title = obj.Title;
            copy.Abbreviation = obj.Abbreviation;

            return copy;
        }

        public static Group Copy(Group obj)
        {
            Group copy = new Group();
            copy.Id = obj.Id;
            copy.Alias = obj.Alias;
            copy.Title = obj.Title;
            copy.DepartmentId = obj.DepartmentId;

            return copy;
        }

        public static SpecialityDisciplineTopic Copy(SpecialityDisciplineTopic obj)
        {
            SpecialityDisciplineTopic copy = new SpecialityDisciplineTopic();
            copy.Id = obj.Id;
            copy.SpecialityDisciplineId = obj.SpecialityDisciplineId;
            copy.Title = obj.Title;

            return copy;
        }

        public static Student Copy(Student obj)
        {
            Student copy = new Student();
            //copy.UserId = obj.UserId;
            copy.GroupId = obj.GroupId;
            copy.User = new User();
            copy.User.Id = obj.User.Id;
            copy.User.Login = obj.User.Login;
            copy.User.NickName = obj.User.NickName;
            copy.User.Email = obj.User.Email;
            copy.User.FirstName = obj.User.FirstName;
            copy.User.SecondName = obj.User.SecondName;
            copy.User.Patronymic = obj.User.Patronymic;
            copy.User.Role = obj.User.Role;
            copy.User.Password = obj.User.Password;

            return copy;
        }

        public static Professor Copy(Professor obj)
        {
            Professor copy = new Professor();
            //copy.UserId = obj.UserId;
            copy.ChairId = obj.ChairId;
            copy.Position = obj.Position;
            copy.Degree = obj.Degree;
            copy.About = obj.About;

            copy.User = new User();
            copy.User.Id = obj.User.Id;
            copy.User.Login = obj.User.Login;
            copy.User.NickName = obj.User.NickName;
            copy.User.Email = obj.User.Email;
            copy.User.FirstName = obj.User.FirstName;
            copy.User.SecondName = obj.User.SecondName;
            copy.User.Patronymic = obj.User.Patronymic;
            copy.User.Role = obj.User.Role;
            copy.User.Password = obj.User.Password;

            return copy;
        }

        public static User Copy(User obj)
        {
            User copy = new User();
            copy.Id = obj.Id;
            copy.Login = obj.Login;
            copy.NickName = obj.NickName;
            copy.Email = obj.Email;
            copy.FirstName = obj.FirstName;
            copy.SecondName = obj.SecondName;
            copy.Patronymic = obj.Patronymic;
            copy.Role = obj.Role;
            copy.Password = obj.Password;

            return copy;
        }

        public static LecturePlan Copy(LecturePlan obj)
        {
            LecturePlan copy = new LecturePlan();
            copy.Id = obj.Id;
            copy.SpecialityDisciplineId = obj.SpecialityDisciplineId;
            copy.SpecialityDisciplineTopicId = obj.SpecialityDisciplineTopicId;
            copy.Date = obj.Date;

            return copy;
        }

        public static DayOfWeek GetDayOfWeekFromString(string day)
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

        public static string GetTopicTitle(LecturePlan lecturePlan, string day)
        {
            string topic = String.Empty;
            if (null != lecturePlan)
            {
                DayOfWeek dayOfWeek = GetDayOfWeekFromString(day);
                if (lecturePlan.Date.HasValue && lecturePlan.Date.Value.DayOfWeek == dayOfWeek)
                {
                    topic = lecturePlan.SpecialityDisciplineTopic.Title;
                }
            }
            return topic;
        }

        public static string GetRoom(LecturePlan lecturePlan, string day, string time)
        {
            string timeWithZero = String.Empty;
            // 8:00, 9:00
            if (time.Length < 5)
            {
                timeWithZero = "0" + time;
            }
            bool isDayOnUpWeek = Utility.IsDayOnUpWeek(lecturePlan.Date.Value);
            string room = String.Empty;
            if (null != lecturePlan && null != lecturePlan.SpecialityDiscipline &&
                null != lecturePlan.SpecialityDiscipline.LectureTimetables)
            {
                foreach (LectureTimetable timetable in lecturePlan.SpecialityDiscipline.LectureTimetables)
                {
                    if (timetable.Day.Trim().Equals(day.Trim()) &&
                       (timetable.Time.Trim().Equals(time.Trim()) || timetable.Time.Trim().Equals(timeWithZero.Trim())) &&
                       ((timetable.Week.Trim().Equals(Constants.UP_WEEK) && isDayOnUpWeek) ||
                        (timetable.Week.Trim().Equals(Constants.DOWN_WEEK) && !isDayOnUpWeek) ||
                        (timetable.Week.Trim().Equals(Constants.EVERY_WEEK))
                        ))
                    {
                        if (timetable.Room != 0)
                        {
                            room = timetable.Room + " (" + timetable.Building + ") ";
                        }
                        break;
                    }
                }
            }

            return room;
        }

        public static string GetProfessorFullName(Professor professor)
        {
            string professorFullName = String.Empty;
            if (null != professor && null != professor.User)
            {
                if (null != professor.User.FirstName && !professor.User.FirstName.Trim().Equals(String.Empty) &&
                    null != professor.User.SecondName && !professor.User.SecondName.Trim().Equals(String.Empty) &&
                    null != professor.User.Patronymic && !professor.User.Patronymic.Trim().Equals(String.Empty)
                   )
                {
                    professorFullName += professor.User.SecondName + " " +
                        professor.User.FirstName[0].ToString() + "." +
                        professor.User.Patronymic[0].ToString() + ".";
                }
                else if (null != professor.User.SecondName && !professor.User.SecondName.Trim().Equals(String.Empty))
                {
                    professorFullName = professor.User.SecondName;
                }
            }

            return professorFullName;
        }

        public static LecturePlan FindLecturePlan(IEnumerable<LecturePlan> lecturePlans, string day, string time)
        {
            DayOfWeek dayOfWeek = GetDayOfWeekFromString(day);
            LecturePlan foundLecturePlan = null;

            string timeWithZero = String.Empty;
            // 8:00, 9:00
            if (time.Length < 5)
            {
                timeWithZero = "0" + time;
            }

            foreach (LecturePlan lecturePlan in lecturePlans)
            {
                if (lecturePlan.Date.HasValue && lecturePlan.Date.Value.DayOfWeek == dayOfWeek)
                {
                    foreach (LectureTimetable timetable in lecturePlan.SpecialityDiscipline.LectureTimetables)
                    {
                        if (timetable.Day.Trim().Equals(day.Trim()) && 
                           (timetable.Time.Trim().Equals(time.Trim()) || timetable.Time.Trim().Equals(timeWithZero.Trim())))
                        {
                            if ((timetable.Week.Trim().Equals(Constants.EVERY_WEEK)) ||
                                (timetable.Week.Trim().Equals(Constants.UP_WEEK) && Utility.IsDayOnUpWeek(lecturePlan.Date.Value)) ||
                                (timetable.Week.Trim().Equals(Constants.DOWN_WEEK) && !Utility.IsDayOnUpWeek(lecturePlan.Date.Value))
                               )
                            {
                                foundLecturePlan = lecturePlan;
                                break;
                            }
                        }
                    }
                }
            }
            return foundLecturePlan;
        }

        // дата первого учебного дня в четных семестрах
        public static DateTime evenTermFirstDate = new DateTime(DateTime.Now.Year, 2, 12);
        // дата последнего учебного дня в четных семестрах
        public static DateTime evenTermLastDate = new DateTime(DateTime.Now.Year, 5, 25);

        // дата первого учебного дня в нечетных семестрах
        public static DateTime oddTermFirstDate = new DateTime(DateTime.Now.Year, 9, 2);
        // дата последнего учебного дня в нечетных семестрах
        public static DateTime oddTermLastDate = new DateTime(DateTime.Now.Year, 12, 25);
        // длина недели 7 дней
        public static short weekLength = 7;
        public static short yearLength = 365;

        public static short[] evenTerms = new short[] { 2, 4, 6, 8, 10, 12 };
        public static short[] oddTerms = new short[] { 1, 3, 5, 7, 9, 11 };

        public static TermType GetTermTypeByDate(DateTime date)
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

        public static DateTime GetFirstTermDate()
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

        public static DateTime GetLastTermDate()
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

        public static bool IsDayOnUpWeek(DateTime date)
        {
            DateTime firstDate = GetFirstTermDate();
            DateTime lastDate = date;
            while (firstDate.DayOfWeek != DayOfWeek.Monday)
            {
                firstDate = firstDate.AddDays(-1);
            }
            while (lastDate.DayOfWeek != DayOfWeek.Monday)
            {
                lastDate = lastDate.AddDays(+1);
            }

            TimeSpan difference = lastDate - firstDate;
            int days = (int)(difference.TotalDays);
            
            int weeks = (int)(days / weekLength);
            if (weeks % 2 == 0)
            {
                return false;
            }

            return true;
        }

        public static List<LectureTimetable> FindSchedule(IEnumerable<SpecialityDiscipline> specialityDisciplines, string day, string time)
        {
            DayOfWeek dayOfWeek = GetDayOfWeekFromString(day);
            List<LectureTimetable> foundTimetables = new List<LectureTimetable>();

            string timeWithZero = String.Empty;
            // 8:00, 9:00
            if (time.Length < 5)
            {
                timeWithZero = "0" + time;
            }

            foreach (SpecialityDiscipline discipline in specialityDisciplines)
            {
                foreach (LectureTimetable timetable in discipline.LectureTimetables)
                {
                    if (timetable.Day.Trim().Equals(day.Trim()) && 
                       (timetable.Time.Trim().Equals(time.Trim()) || timetable.Time.Trim().Equals(timeWithZero.Trim())))
                    {
                        foreach (LecturePlan lecturePlan in discipline.LecturePlans)
                        {
                            if (lecturePlan.Date.HasValue && lecturePlan.Date.Value.DayOfWeek == dayOfWeek)
                            {
                                foundTimetables.Add(timetable);
                                break;
                            }
                        }
                    }
                }
            }

            return foundTimetables;
        }
    }
}
