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
    public enum Role
    {
        None,
        Student,
        Professor,
        Metodist,
        Administrator
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
        private Role role = Role.None;

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

                // получаем роль пользователя
                switch (dbUser.Role)
                {
                    case "Student":
                        role = Role.Student;
                        break;
                    case "Metodist":
                        role = Role.Metodist;
                        break;
                    case "Professor":
                        role = Role.Administrator;
                        break;
                    case "Admin":
                        role = Role.Administrator;
                        break;
                    default:
                        role = Role.None;
                        lastError = Messages.WRONG_USER_ROLE;
                        break;
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
        public Role Role { get { return role; } }

        public Repository.User DbUser
        {
            get
            {
                return dbUser;
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
