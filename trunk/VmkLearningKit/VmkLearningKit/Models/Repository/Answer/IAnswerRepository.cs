using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    /// <summary>
    /// Определяет набор методов для работы с классом сущности «Answer»
    /// </summary>
    public interface IAnswerRepository : IRepository<Answer>
    {
        /// <summary>
        /// Получение коллекции всех объектов класса «Answer»
        /// </summary>
        IEnumerable<Answer> GetAll();

        /// <summary>
        /// Получение коллекции всех объектов класса «Answer» с заданным идентификатором вопроса
        /// </summary>
        /// <param name="questionId">Идентификатор вопроса</param>
        IEnumerable<Answer> GetAllAnswersByQuestionId(long questionId);

        /// <summary>
        /// Получение идентификатора вопроса по заданному идентификатору ответа
        /// </summary>
        /// <param name="id">Идентификатор ответа</param>
        long GetQuestionIdByAnswerId(long id);

        /// <summary>
        /// Добавление новой записи в таблицу «Answer»
        /// </summary>
        /// <param name="obj">Добавляемый ответ</param>
        void Add(Answer obj);

        /// <summary>
        /// Добавление новой записи в таблицу «Answer»
        /// </summary>
        /// <param name="questionId">Идентификатор вопроса</param>
        /// <param name="text">Текст ответа</param>
        /// <param name="score">Количество баллов за ответ</param>
        void Add(long questionId, string text, double score);

        /// <summary>
        /// Обновление записи в таблице «Answer»
        /// </summary>
        /// <param name="answer">Обновляемый объект</param>
        void Update(Answer answer);

        /// <summary>
        /// Обновление записи в таблице «Answer»
        /// </summary>
        /// <param name="updatedObjId">Идентификатор обновляемой записи</param>
        /// <param name="newObjQuestionId">Новое значение идентификатора вопроса</param>
        /// <param name="newObjText">Новое значение текста ответа</param>
        /// <param name="newObjScore">Новое значение количества баллов за ответ</param>
        void UpdateById(long updatedObjId, long newObjQuestionId, string newObjText, double newObjScore);

        /// <summary>
        /// Обновление записи в таблице «Answer»
        /// </summary>
        /// <param name="updatedObjId">Идентификатор обновляемой записи</param>
        /// <param name="newObjText">Новое значение текста ответа</param>
        /// <param name="newObjScore">Новое значение количества баллов за ответ</param>
        void UpdateById(long updatedObjId, string newObjText, double newObjScore);
    }
}
