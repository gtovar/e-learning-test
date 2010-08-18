using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QWord
{
    /// <summary>
    /// Класс Question: вопрос
    /// </summary>
    public class Question
    {
        #region Private Fields

        /// <summary>
        /// Поле text: текст вопроса
        /// </summary> 
        private string text;

        #endregion

        #region Constructors

        /// <summary>
        /// Конструктор Question: инициализация параметрами по умолчанию
        /// </summary>
        public Question()
        {
            text   = String.Empty;
        }

        /// <summary>
        /// /// Конструктор Question: инициализация заданными параметрами
        /// </summary>
        /// <param name="text">текст вопроса</param>
        public Question(string questionText)
        {
            text   = questionText;
        }

        #endregion

        #region Properties

        /// <summary>
        /// Свойство Text: текст вопроса
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

        #endregion
    }
}
