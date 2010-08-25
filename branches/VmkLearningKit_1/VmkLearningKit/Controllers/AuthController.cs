using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using VmkLearningKit.Models.Domain;

namespace VmkLearningKit.Controllers
{
    /// <summary>
    /// Класс контроллера авторизации пользователя.
    /// Отображает форму для авторизации (логин и пароль).
    /// Обрабатывает введенные пользователем данные, после чего либо выдается сообщение об ошибке,
    /// либо осуществляется перенаправление на главную страницу.
    /// </summary>
    public class AuthController : AbstractController
    {
        /// <summary>
        /// Action, отображающий форму авторизации пользователя, при обращении к странице xdomain.ru/auth
        /// </summary>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult LogOn()
        {
            GeneralMenu();
            return View();
        }

        /// <summary>
        /// Action, обрабатывающий данные, введенные в форму авторизации пользователя
        /// Выводится сообщение об ошибке, если данные не корректны или осуществляется перенаправление на
        /// главную страницу.
        /// </summary>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult LogOn(FormCollection form)
        {
            // получаем логин и пароль пользователя, введенные в форму авторизации
            string login = form["Login"].Trim();
            string password = form["Password"].Trim();


            // создаем объект пользователя, в конструкторе которого проверяется корректность введенных данных
            User user = new User(login, password);
            
            // если пароль и логин неверные, то выводим сообщение об ошибке
            if (!user.IsLoggedIn)
            {
                ViewData[Constants.FORM_MESSAGE] = user.LastError;
                GeneralMenu();
                return View();
            }
            else
            {
                Session.Add(Constants.SESSION_USER_AUTH, true);
                Session.Add(Constants.SESSION_USER, user);
                Session.Add(Constants.SESSION_USER_NAME, user.Name);
            }
            string url = Constants.HOME_URL;

            if (user.IsStudent)
            {
                url = Constants.CABINET_URL + "Student/" + user.DbUser.NickName;
            }
            else if (user.IsProfessor)
            {
                url = Constants.CABINET_URL + "Professor/" + user.DbUser.NickName;
            }
            else if (user.IsMetodist)
            {
                url = Constants.CABINET_URL + "Metodist/" + user.DbUser.NickName;
            }
            else if (user.IsAdmin)
            {
                url = Constants.CABINET_URL + "Admin/" + user.DbUser.NickName;
            }
            return Redirect(url);
        }

        /// <summary>
        /// Action, отображающий форму авторизации пользователя, при обращении к странице xdomain.ru/auth
        /// </summary>
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult LogOff()
        {
            Session.Remove(Constants.SESSION_USER_AUTH);
            Session.Remove(Constants.SESSION_USER);
            Session.Remove(Constants.SESSION_USER_NAME);

            return Redirect(Constants.HOME_URL);
        }
    }
}