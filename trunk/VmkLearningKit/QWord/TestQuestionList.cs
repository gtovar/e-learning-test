using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QWord
{
    public class TestQuestionList
    {
        #region Private Fields

        /// <summary>
        /// Поле testQuestions: список тестовых вопросов
        /// </summary>
        private List<TestQuestion> testQuestions;

        #endregion

        #region Constructors

        /// <summary>
        /// Конструктор TestQuestionList
        /// </summary>
        public TestQuestionList()
        {
            testQuestions = new List<TestQuestion>();
        }

        #endregion

        #region Public Methods

        /// <summary>
        /// Метод Add: добавление тестового вопроса в список
        /// </summary>
        /// <param name="testQuestion">тестовый вопрос</param>
        public void Add(TestQuestion testQuestion)
        {
            testQuestions.Add(testQuestion);
        }

        #endregion

        #region Properties

        /// <summary>
        /// Свойство: возвращает тестовый вопрос с заданным индексом
        /// </summary>
        /// <param name="index">индекс тестового вопроса в списке</param>
        /// <returns></returns>
        public TestQuestion this[int index]
        {
            get
            {
                return testQuestions[index];
            }
        }
        
        /// <summary>
        /// Свойство Count: количество тестовых вопросов в списке
        /// </summary>
        public int Count
        {
            get
            {
                return testQuestions.Count;
            }
        }

        #endregion
    }
}
