using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    /// <summary>
    /// Определяет набор методов для работы с классом сущности «SpecialityDiscipline»
    /// </summary>
    public interface ISpecialityDisciplineRepository : IRepository<SpecialityDiscipline>
    {
        /// <summary>
        /// Получение коллекции объектов класса «SpecialityDiscipline» по псевдониму специальности
        /// </summary>
        /// <param name="specialityAlias">Псевдоним специальности</param>
        IEnumerable<SpecialityDiscipline> GetAll(string specialityAlias);

        /// <summary>
        /// Получение коллекции объектов класса «SpecialityDiscipline» по псевдониму преподавателя
        /// </summary>
        /// <param name="professorNickName">Псевдоним преподавателя</param>
        IEnumerable<SpecialityDiscipline> GetAllByProfessor(string professorNickName);

        /// <summary>
        /// Получение коллекции объектов класса «SpecialityDiscipline» по идентификатору специальности
        /// </summary>
        /// <param name="specialityId">Идентификатор специальности</param>
        IEnumerable<SpecialityDiscipline> GetBySpecialityId(long specialityId);

        /// <summary>
        /// Получение объекта класса «SpecialityDiscipline» по идентификатору темы, принадлежащей извлекаемой дисциплине
        /// </summary>
        /// <param name="specialityDisciplineTopicId">Идентификатор темы</param>
        SpecialityDiscipline GetdBySpecialityDisciplineTopicId(long specialityDisciplineTopicId);

        /// <summary>
        /// Получение объекта класса «SpecialityDiscipline» по псевдониму дисциплины
        /// </summary>
        /// <param name="alias">Псевдоним дисциплины</param>
        SpecialityDiscipline GetByAlias(string alias);

        /// <summary>
        /// Получение объекта класса «SpecialityDiscipline» по названию дисциплины
        /// </summary>
        /// <param name="title">Название дисциплины</param>
        SpecialityDiscipline GetByTitle(string title);

        /// <summary>
        /// Добавление новой записи в таблицу «SpecialityDiscipline»
        /// </summary>
        /// <param name="obj">Добавляемый объект</param>
        SpecialityDiscipline Add(SpecialityDiscipline obj);

        /// <summary>
        /// Получение наибольшего (среди имеющихся) идентификатора из таблицы «SpecialityDiscipline»
        /// </summary>
        long GetMaxId();

        /// <summary>
        /// Получение коллекции объектов класса «SpecialityDiscipline» по набору параметров
        /// </summary>
        /// <param name="specialityAlias">Псевдоним специальности</param>
        /// <param name="educationPlanAlias">Псевдоним образовательного плана псевдоним образовательного плана</param>
        /// <param name="chairAlias">Псевдоним кафедры</param>
        /// <param name="professorNickName">Псевдоним преподавателя</param>
        IEnumerable<SpecialityDiscipline> GetAll(string specialityAlias, string educationPlanAlias, string chairAlias, string professorNickName);
    }
}
