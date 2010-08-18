using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QWord
{
    /// <summary>
    /// Класс TestQuestion: тестовый вопрос
    /// </summary>
    public class TestQuestion
    {
        #region Private Fields

        /// <summary>
        /// Поле question: вопрос
        /// </summary>
        private Question question;

        /// <summary>
        /// Поле answers: варианты ответов
        /// </summary>
        private List<QAnswer> answers;

        /// <summary>
        /// Поле type: тип вопроса
        /// </summary>
        private QType type;

        #endregion

        #region Constructors

        /// <summary>
        /// Конструктор TestQuestion: инициализация параметрами по умолчанию
        /// </summary>
        public TestQuestion()
        {
            question = new Question();

            answers  = new List<QAnswer>();

            type     = QType.None;
        }

        /// <summary>
        /// Конструктор TestQuestion: инициализация заданными параметрами
        /// </summary>
        /// <param name="question">вопрос</param>
        /// <param name="questionType">тип вопроса</param>
        /// <param name="questionAnswers">варианты ответов</param>
        public TestQuestion(Question question, QType questionType, List<QAnswer> questionAnswers)
        {
            this.question = question;
            type          = questionType;

            answers       = new List<QAnswer>(questionAnswers);
        }

        #endregion

        #region Properties

        /// <summary>
        /// Свойство AnswersCount: количество вариантов ответов на тестовый вопрос
        /// </summary>
        public int AnswersCount
        {
            get
            {
                return answers.Count;
            }
        }

        /// <summary>
        /// Свойство Question: вопрос
        /// </summary>
        public Question Question
        {
            get
            {
                return question;
            }
        }

        /// <summary>
        /// Свойство: возвращает вариант ответа с заданным индексом
        /// </summary>
        /// <param name="index">индекс варианта ответа</param>
        /// <returns></returns>
        public QAnswer this[int index]
        {
            get
            {
                return answers[index];
            }
        }

        /// <summary>
        /// Свойство Answers: варианты ответа на вопрос
        /// </summary>
        public List<QAnswer> Answers
        {
            get
            {
                return answers;
            }
        }

        /// <summary>
        /// Свойство Type: тип тестового вопроса
        /// </summary>
        public QType Type
        {
            get
            {
                return type;
            }
            set
            {
                type = value;
            }
        }

        #endregion
    }
}
