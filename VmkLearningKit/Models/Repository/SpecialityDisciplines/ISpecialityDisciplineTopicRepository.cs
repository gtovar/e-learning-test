using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    /// <summary>
    /// Определяет набор методов для работы с классом сущности «SpecialityDisciplineTopic»
    /// </summary>
    public interface ISpecialityDisciplineTopicRepository : IRepository<SpecialityDisciplineTopic>
    {
        /// <summary>
        /// Получение коллекции объектов класса «SpecialityDisciplineTopic» по идентификатору дисциплины
        /// </summary>
        /// <param name="specialityDisciplineId">Идентификатор дисциплины</param>
        IEnumerable<SpecialityDisciplineTopic> GetAllBySpecialityDisciplineId(long specialityDisciplineId);

        //SpecialityDisciplineTopic GetByAlias(string alias);

        /// <summary>
        /// ???
        /// </summary>
        int GetVariantCount();

        /// <summary>
        /// ???
        /// </summary>
        /// <param name="newVariantCount">???</param>
        int SetVariantCount(int newVariantCount);

        /// <summary>
        /// ???
        /// </summary>
        /// <param name="generatedTestId">???</param>
        long GetTopicIdByGeneratedTestId(long generatedTestId);

        /// <summary>
        /// Получение псевдонима дисциплины по идентификатору темы
        /// </summary>
        /// <param name="id">Идентификатор темы</param>
        string GetSpecialityDisciplineAliasByTopicId(long id);

        /// <summary>
        /// Получение названия дисциплины по идентификатору темы
        /// </summary>
        /// <param name="id">Идентификатор темы</param>
        string GetSpecialityDisciplineTitleByTopicId(long id);

        /// <summary>
        /// Получения названия темы по ее идентификатору
        /// </summary>
        /// <param name="id">Идентификатор темы</param>
        string GetTitle(long id);

        /// <summary>
        /// Получение объекта класса «SpecialityDisciplineTopic» по названию темы
        /// </summary>
        /// <param name="title">Название темы</param>
        SpecialityDisciplineTopic GetByTitle(string title);

        /// <summary>
        /// Изменение названия темы с заданным идентификатором
        /// </summary>
        /// <param name="id">Идентификатор темы</param>
        /// <param name="title">Новое название темы</param>
        SpecialityDisciplineTopic SetTitle(long id, string title);

        /// <summary>
        /// Получение наибольшего (среди имеющихся) идентификатора из таблицы «SpecialityDisciplineTopic»
        /// </summary>
        long GetMaxId();

        /// <summary>
        /// Получение количества разделов в теме с заданным идентификатором
        /// </summary>
        /// <param name="specialityDisciplineTopicId">Идентификатор темы</param>
        int GetRazdelCountBySpecialityDisciplineTopicId(long specialityDisciplineTopicId);

        /// <summary>
        /// Получение количества вопросов в теме с заданным идентификатором
        /// </summary>
        /// <param name="specialityDisciplineTopicId">Идентификатор темы</param>
        int GetQuestionCountBySpecialityDisciplineTopicId(long specialityDisciplineTopicId);

        /// <summary>
        /// ???
        /// </summary>
        /// <param name="specialityDisciplineTopicId">Идентификатор темы</param>
        int GetQuestionCountInTestVariantBySpecialityDisciplineTopicId(long specialityDisciplineTopicId);

        /// <summary>
        /// Добавление новой записи в таблицу «SpecialityDisciplineTopic»
        /// </summary>
        /// <param name="obj">Добавляемый объект</param>
        SpecialityDisciplineTopic Add(SpecialityDisciplineTopic obj);
    }
}
