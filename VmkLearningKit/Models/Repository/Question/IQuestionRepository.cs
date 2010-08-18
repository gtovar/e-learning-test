using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    /// <summary>
    /// Определяет набор методов для работы с классом сущности «Question»
    /// </summary>
    public interface IQuestionRepository : IRepository<Question>
    {
        /// <summary>
        /// Получение количества различных групп вопросов-дублеров в разделе с заданным идентификатором
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        int GetDifferentDoubleGroupsCountInRazdel(long razdelId);

        /// <summary>
        /// Получение количества различных групп вопросов-исключений в разделе с заданным идентификатором
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        int GetDifferentExclusionGroupsCountInRazdel(long razdelId);

        /// <summary>
        /// Получение идентификатора раздела по заданному идентификатору вопроса
        /// </summary>
        /// <param name="id">Идентификатор вопроса</param>
        long GetRazdelIdByQuestionId(long id);

        /// <summary>
        /// Получение типа вопроса по его идентификатору
        /// </summary>
        /// <param name="id">Идентификатор вопроса</param>
        int GetQuestionType(long id);

        /// <summary>
        /// Получение количества ответов у вопроса с заданным идентификатором
        /// </summary>
        /// <param name="questionId">Идентификатор вопроса</param>
        int GetAnswersCountByQuestionId(long questionId);

        /// <summary>
        /// ???
        /// </summary>
        /// <param name="questionId">Идентификатор вопроса</param>
        int GetQuestionLocalIdByQuestionId(long questionId);

        /// <summary>
        /// ???
        /// </summary>
        /// <param name="questionId">Идентификатор вопроса</param>
        double GetMaxScoreQuestionByQuestionId(long questionId);

        /// <summary>
        /// ???
        /// </summary>
        /// <param name="questionId">Идентификатор вопроса</param>
        string GetFullQuestionLocalIdByQuestionId(long questionId);

        /// <summary>
        /// ???
        /// </summary>
        /// <param name="id">???</param>
        IEnumerable<Question> GetQuestionsById(long id);

        /// <summary>
        /// Получение коллекции всех объектов класса «Answer» по заданному идентификатору вопроса
        /// </summary>
        /// <param name="questionId">Идентификатор вопроса</param>
        IEnumerable<Answer> GetAllAnswersByQuestionId(long questionId);
        
        /// <summary>
        /// Получение коллекции всех объектов класса «Question»
        /// </summary>
        IEnumerable<Question> GetAll();

        /// <summary>
        /// Получение коллекции всех объектов класса «Question» по заданному идентификатору раздела
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        IEnumerable<Question> GetAllQuestionsByRazdelId(long razdelId);

        /// <summary>
        /// Получение коллекции объектов класса «Question» по идентификатору раздела, 
        /// находящихся в состоянии «не удален» (соответствующее состоянию значение поля «IsDeleted» равно 0), 
        /// отсортированных по полю «DoubleGroup»
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        IEnumerable<Question> GetNotDeletedQuestionsByRazdelIdSortedByDoubleGroup(long razdelId);

        /// <summary>
        /// Получение коллекции объектов класса «Question» по идентификатору раздела, 
        /// находящихся в состоянии «не удален» (соответствующее состоянию значение поля «IsDeleted» равно 0) 
        /// и не состоящих ни одной группе «вопросов-дублеров»
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        IEnumerable<Question> GetNotDeletedQuestionsByRazdelIdWithFakeDoubleGroup(long razdelId);

        /// <summary>
        /// Получение коллекции объектов класса «Question» по идентификатору раздела, 
        /// находящихся в состоянии «не удален» (соответствующее состоянию значение поля «IsDeleted» равно 0), 
        /// отсортированных по полю «ExclusionGroup»
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        IEnumerable<Question> GetNotDeletedQuestionsByRazdelIdSortedByExclusionGroup(long razdelId);

        /// <summary>
        /// Получение коллекции объектов класса «Question» по идентификатору раздела, 
        /// находящихся в состоянии «не удален» (соответствующее состоянию значение поля «IsDeleted» равно 0) 
        /// и не состоящих ни одной группе «вопросов-исключений»
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        IEnumerable<Question> GetNotDeletedQuestionsByRazdelIdWithFakeExclusionGroup(long razdelId);

        /// <summary>
        /// Получение коллекции объектов класса «Question» по идентификатору раздела, 
        /// находящихся в состоянии «не удален» (соответствующее состоянию значение поля «IsDeleted» равно 0)
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        IEnumerable<Question> GetNotDeletedQuestionsByRazdelId(long razdelId);

        /// <summary>
        /// Получение коллекции объектов класса «Question» по идентификатору раздела, 
        /// находящихся в состоянии «удален» (соответствующее состоянию значение поля «IsDeleted» равно 1);
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        IEnumerable<Question> GetDeletedQuestionsByRazdelId(long razdelId);

        /// <summary>
        /// Получение максимального номера группы «вопросов-дублеров», 
        /// среди всех групп «вопросов-дублеров» в разделе с заданным идентификатором
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        int GetMaxQuestionDoubleGroupInRazdel(long razdelId);

        /// <summary>
        /// Получение максимального номера группы «вопросов-исключений», 
        /// среди всех групп «вопросов-исключений» в разделе с заданным идентификатором
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        int GetMaxQuestionExclusionGroupInRazdel(long razdelId);

        /// <summary>
        /// Добавление новой записи в таблицу «Question»
        /// </summary>
        /// <param name="razdelId">Идентификатор раздела</param>
        /// <param name="title">Название вопроса</param>
        /// <param name="type">Тип вопроса</param>
        /// <param name="text">Текст вопроса</param>
        /// <param name="canCommented">Возможность комментирования вопроса студентами</param>
        long Add(long razdelId, string title, int type, string text, byte canCommented);

        /// <summary>
        /// Добавление новой записи в таблицу «Question»
        /// </summary>
        /// <param name="obj">Добавляемый вопрос</param>
        void Add(Question obj);

        /// <summary>
        /// Обновление записи в таблице «Question» с идентификатором updatedObjId
        /// </summary>
        /// <param name="updatedObjId">Идентификатор вопроса</param>
        /// <param name="title">Название вопроса</param>
        /// <param name="text">Текст вопроса</param>
        /// <param name="CanCommented">Возможность комментирования вопроса студентами</param>
        void UpdateById(long updatedObjId, string title, string text, byte CanCommented);

        /// <summary>
        /// Обновление значения поля «IsDeleted» в записи таблицы «Question» с заданным идентификатором
        /// </summary>
        /// <param name="id">Идентификатор вопроса</param>
        /// <param name="newDeletedState">Новое значение поля «IsDeleted»</param>
        void ChangeIsDeletedState(long id, byte newDeletedState);

        /// <summary>
        /// Обновление значения поля «CanCommented» в записи таблицы «Question» с заданным идентификатором
        /// </summary>
        /// <param name="id">Идентификатор вопроса</param>
        /// <param name="newCommentedState">Новое значение поля «CanCommented»</param>
        void ChangeCanCommentedState(long id, byte newCommentedState);

        /// <summary>
        /// Обновление значения поля «DoubleGroup» в записи таблицы «Question» с заданным идентификатором
        /// </summary>
        /// <param name="id">Идентификатор вопроса</param>
        /// <param name="groupIndex">Новое значение поля «DoubleGroup»</param>
        void ChangeDoubleGroup(long id, int groupIndex);

        /// <summary>
        /// Обновление значения поля «DoubleGroup» в записи таблицы «Question» с заданным идентификатором
        /// </summary>
        /// <param name="id">Идентификатор вопроса</param>
        /// <param name="groupIndex">Новое значение поля «ExclusionGroup»</param>
        void ChangeExclusionGroup(long id, int groupIndex);
    }
}
