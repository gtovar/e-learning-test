using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Collections.Specialized;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core
{
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
            if(!errorCode.HasValue) 
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

        public static Group Copy(Group obj)
        {
            Group copy = new Group();
            copy.Id = obj.Id;
            copy.Alias = obj.Alias;
            copy.Title = obj.Title;
            copy.DepartmentId = obj.DepartmentId;

            return copy;
        }

        public static Student Copy(Student obj)
        {
            Student copy = new Student();
            copy.UserId = obj.UserId; ;
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
        /*
        public static int GetCurrentTerm()
        {
            int month = DateTime.Now.Month;
        }
        */
    }
}
