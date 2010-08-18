using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    /// <summary>
    /// Определяет набор общих методов для работы с различными классами сущностей
    /// </summary>
    /// <typeparam name="T">Класс сущности</typeparam>
    public interface IRepository<T>
    {
        /// <summary>
        /// Получение объекта по его уникальному идентификатору
        /// </summary>
        /// <param name="id">Идентификатор объекта</param>
        T GetById(long id);

        /// <summary>
        /// Удаление объекта по его уникальному идентификатору
        /// </summary>
        /// <param name="id">Идентификатор объекта</param>
        void DeleteById(long id);

        /// <summary>
        /// Удаление объекта
        /// </summary>
        /// <param name="obj">Удаляемый объект</param>
        void Delete(T obj);
    }
}
