using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QWord
{
    /// <summary>
    /// Класс QResult: результат операции
    /// </summary>
    public class QResult
    {
        #region Private Fields

        /// <summary>
        /// Поле resultType: результат операции
        /// </summary>
        private QResultType resultType;

        /// <summary>
        /// Поле message: сообщение об ошибке
        /// </summary>
        private string message;

        /// <summary>
        /// Поле exception: исключение
        /// </summary>
        private Exception exception;

        #endregion

        #region Constructors

        public QResult()
        {
            resultType = QResultType.OK;

            message    = String.Empty;

            exception  = null;
        }

        public QResult(QResultType resultType, string message, Exception exception)
        {
            this.resultType = resultType;

            this.message    = message;

            this.exception  = exception;
        }

        public QResult(QResultType resultType, string message)
        {
            this.resultType = resultType;

            this.message    = message;

            this.exception  = null;
        }

        #endregion

        #region Properties

        public QResultType ResultType
        {
            get
            {
                return resultType;
            }
            set
            {
                resultType = value;
            }
        }

        public string Message
        {
            get
            {
                return message;
            }
            set
            {
                message = value;
            }
        }

        public Exception Exception
        {
            get
            {
                return exception;
            }
            set
            {
                exception = value;
            }
        }

        #endregion
    }
}
