using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Models.Repository;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Domain
{
    /// <summary>
    /// Перечисление ролей
    /// </summary>
    public struct Role
    {
        public static string None = Constants.NONE_ROLE;
        public static string Admin = Constants.ADMIN_ROLE;
        public static string Professor = Constants.PROFESSOR_ROLE;
        public static string Metodist = Constants.METODIST_ROLE;
        public static string Student = Constants.STUDENT_ROLE;
    }

    /// <summary>
    /// Класс "Пользователь" инкапсулирует проврку логина и пароля пользователя с последующим получением
    /// уровня прав доступа этого пользователя.
    /// </summary>
    public class User
    {
        /// <summary>
        /// Объект базы данных
        /// </summary>
        private IUserRepository userRepository = RepositoryManager.GetRepositoryManager.GetUserRepository;
        
        /// <summary>
        /// Объект пользователя в БД
        /// </summary>
        private Repository.User dbUser = null;

        /// <summary>
        /// Последняя произошедшая ошибка
        /// </summary>
        private string lastError = string.Empty;

        /// <summary>
        /// Поле, показывающее авторизован ли пользователь или нет
        /// </summary>
        private bool isLoggedIn = false;
        /// <summary>
        /// Уровень доступа пользователя
        /// </summary>
        private List<string> roles = null;

        public User() {}

        /// <summary>
        /// Конструктор, проверяющий существование пользователя в БД, а также уровень доступа данного пользователя
        /// </summary>
        /// <param name="loign">Логин пользователя</param>
        /// <param name="password">Пароль пользователя</param>
        public User(string login, string password)
        {
            // если входные данные не пусты
            if (login == null ||
                login.Equals(string.Empty) ||
                password == null ||
                password.Equals(string.Empty))
            {
                lastError = Messages.WRONG_USER_LOGIN_OR_PASSWD;
                return;
            }

            // проверяем наличие у пользователя аккаунта
            dbUser = userRepository.GetByLogin(login);
            
            // если пользователь есть в БД
            if (dbUser == null || !Hash.VerifyHash(password, dbUser.Password))
            {
                lastError = Messages.WRONG_USER_LOGIN_OR_PASSWD;
                return;
            }
            else
            {
                // выставляем необходимые свойства
                isLoggedIn = true;
                string[] splitRoles = dbUser.Role.Split(',', ';');
                roles = new List<string>();
                foreach (string role in splitRoles)
                {
                    // получаем роль пользователя
                    switch (role.Trim(' ', ',', ';'))
                    {
                        case "Student":
                            roles.Add(Role.Student);
                            break;
                        case "Metodist":
                            roles.Add(Role.Metodist);
                            break;
                        case "Professor":
                            roles.Add(Role.Professor);
                            break;
                        case "Admin":
                            roles.Add(Role.Admin);
                            break;
                        default:
                            roles.Add(Role.None);
                            lastError = Messages.WRONG_USER_ROLE;
                            break;
                    }
                }
            }
        }

        /// <summary>
        /// Последняя произошедшая ошибка
        /// </summary>
        public string LastError { get { return lastError; } }

        /// <summary>
        /// Авторизован пользователь или нет
        /// </summary>
        public bool IsLoggedIn { get { return isLoggedIn; } }

        /// <summary>
        /// Уровень доступа пользователя
        /// </summary>
        public List<string> Roles { get { return roles; } }

        public bool HasRole(string role)
        {
            return roles.Contains(role);
        }

        public bool IsAdmin
        {
            get
            {
                return roles.Contains(Constants.ADMIN_ROLE);
            }
        }

        public bool IsProfessor
        {
            get
            {
                return roles.Contains(Constants.PROFESSOR_ROLE);
            }
        }

        public bool IsMetodist
        {
            get
            {
                return roles.Contains(Constants.METODIST_ROLE);
            }
        }

        public bool IsStudent
        {
            get
            {
                return roles.Contains(Constants.STUDENT_ROLE);
            }
        }

        public Repository.User DbUser
        {
            get
            {
                return dbUser;
            }
            set
            {
                dbUser = value;
            }
        }

        public string Name
        {
            get
            {
                return dbUser.SecondName + " " + dbUser.FirstName + " " + dbUser.Patronymic;
            }
        }
    }
}
