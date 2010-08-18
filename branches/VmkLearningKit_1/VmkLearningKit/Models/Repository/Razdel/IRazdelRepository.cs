using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    /// <summary>
    /// Определяет набор методов для работы с классом сущности «Razdel»
    /// </summary>
    public interface IRazdelRepository : IRepository<Razdel>
    {
        /// <summary>
        /// Получение коллекции всех объектов класса «Razdel»
        /// </summary>
        IEnumerable<Razdel> GetAll();

        /// <summary>
        /// Получение коллекции объектов класса «Razdel» по идентификатору темы
        /// </summary>
        /// <param name="specialityDisciplineTopicId">Идентификатор темы</param>
        IEnumerable<Razdel> GetAllRazdelsBySpecialityDisciplineTopicId(long specialityDisciplineTopicId);

        /// <summary>
        /// Получение количества вопросов в разделе с заданным идентификатором
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        int GetQuestionCountByRazdelId(long razdelId);

        /// <summary>
        /// Получение локального идентификатора вопроса раздела с заданным идентификатором
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        int GetRazdelLocalIdByRazdelId(long razdelId);

        /// <summary>
        /// Получение названия раздела с заданным идентификатором
        /// </summary>
        /// <param name="id">Идентификатор раздела</param>
        string GetTitle(long id);

        /// <summary>
        /// Получение названия дисциплины по идентификатору раздела
        /// </summary>
        /// <param name="id">Идентификатор раздела</param>
        string GetSpecialityDisciplineTitle(long id);

        /// <summary>
        /// Получение псевдонима дисциплины по идентификатору раздела
        /// </summary>
        /// <param name="id">Идентификатор раздела</param>
        string GetSpecialityDisciplineAlias(long id);

        /// <summary>
        /// Получение названия темы по идентификатору раздела
        /// </summary>
        /// <param name="id">Идентификатор раздела</param>
        string GetSpecialityDisciplineTopicTitle(long id);

        /// <summary>
        /// Получение псевдонима преподавателя по идентификатору раздела
        /// </summary>
        /// <param name="id">Идентификатор раздела</param>
        string GetProfessorNickNameByRazdelId(long id);

        /// <summary>
        /// Получение коллекции всех объектов класса «Razdel» в теме с заданным идентификатором
        /// </summary>
        /// <param name="topicId">Идентификатор темы</param>
        IEnumerable<Razdel> GetAllBySpecialityDisciplineTopicId(long topicId);

        /// <summary>
        /// Добавление новой записи в таблицу «Razdel»
        /// </summary>
        /// <param name="obj">Добавляемый объект</param>
        void Add(Razdel obj);

        /// <summary>
        /// Добавление новой записи в таблицу «Razdel»
        /// </summary>
        /// <param name="newObjTopicId">Идентификатор темы</param>
        /// <param name="newObjTitle">Название раздела</param>
        void Add(long newObjTopicId, string newObjTitle);

        /// <summary>
        /// Обновление записи в таблице «Razdel» с идентификатором updatedObjId
        /// </summary>
        /// <param name="updatedObjId">Идентификатор обновляемой записи</param>
        /// <param name="newObjTopicId">Новое значение поля «TopicId»</param>
        /// <param name="newObjTitle">Новое значение поля «Title»</param>
        /// <param name="newObjQuestionsCount">Новое значение поля «QuestionsCount»</param>
        void UpdateById(long updatedObjId, long newObjTopicId, string newObjTitle, int newObjQuestionsCount);

        /// <summary>
        /// Обновление записи в таблице «Razdel» с идентификатором updatedObjId
        /// </summary>
        /// <param name="updatedObjId">Идентификатор обновляемой записи</param>
        /// <param name="newObjTitle">Новое значение поля «Title»</param>
        void UpdateById(long updatedObjId, string newObjTitle);

        /// <summary>
        /// Обновление записи в таблице «Razdel» с идентификатором updatedObjId
        /// </summary>
        /// <param name="updatedObjId">Идентификатор обновляемой записи</param>
        /// <param name="newObjQuestionsCount">Новое значение поля «QuestionsCount»</param>
        void UpdateById(long updatedObjId, int newObjQuestionsCount);
    }
}
