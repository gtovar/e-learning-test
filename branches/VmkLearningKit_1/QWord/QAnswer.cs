using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QWord
{
    /// <summary>
    /// Класс QAnswer: вариант ответа на тестовый вопрос
    /// </summary>
    public class QAnswer
    {
        #region Private Fields

        /// <summary>
        /// Поле text: текст ответа
        /// </summary>
        private string text;

        /// <summary>
        /// Поле score: количество очков за ответ
        /// </summary> 
        private int score;

        #endregion

        #region Constructors

        /// <summary>
        /// Конструктор QAnswer: инициализация параметрами по умолчанию
        /// </summary>
        public QAnswer()
        {
            text   = string.Empty;

            score  = 0;
        }

        /// <summary>
        /// Конструктор QAnswer: инициализация заданными параметрами
        /// <param name="answerText">текст ответа</param>
        /// <param name="answerScore">количество баллов</param>
        /// </summary>
        public QAnswer(string answerText, int answerScore)
        {
            text   = answerText;
            score  = answerScore;
        }

        #endregion

        #region Properties

        /// <summary>
        /// Свойство Text: текст ответа
        /// </summary>
        public string Text
        {
            get
            {
                return text;
            }
            set
            {
                text = value;
            }
        }

        /// <summary>
        /// Свойство Score: количество баллов за ответ
        /// </summary>
        public int Score
        {
            get
            {
                return score;
            }
            set
            {
                score = value;
            }
        }
        
        /// <summary>
        /// Свойство IsRight: проверяет, верный ли ответ
        /// </summary>
        public bool IsRight
        {
            get
            {
                return (score > 0);
            }
        }

        #endregion
    }
}
