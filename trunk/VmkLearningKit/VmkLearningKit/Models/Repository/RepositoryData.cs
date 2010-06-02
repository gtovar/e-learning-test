using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    /// <summary>
    /// Базовый класс для работы с классами сущностей
    /// </summary>
    public class RepositoryData
    {
        #region Private Fields

        /// <summary>
        /// Объект класса «VmkLearningKitDataContext»
        /// </summary>
        private VmkLearningKitDataContext dataContext;

        #endregion

        #region Properties

        public VmkLearningKitDataContext DataContext
        {
            get
            {
                return dataContext;
            }
            set
            {
                dataContext = value;
            }
        }

        #endregion

        #region Constructors

        public RepositoryData(VmkLearningKitDataContext dataContext)
        {
            DataContext = dataContext;
        }

        public RepositoryData()
        {
            DataContext = new VmkLearningKitDataContext();
        }

        /// <summary>
        /// Отправляет изменения, которые были выполнены по отношению к извлеченным объектам базы данных
        /// </summary>
        public void SubmitChanges()
        {
            DataContext.SubmitChanges();
        }

        #endregion
    }
}
