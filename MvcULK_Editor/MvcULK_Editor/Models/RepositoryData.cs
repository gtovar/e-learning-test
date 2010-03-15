using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcULK_Editor.Models
{
    public class RepositoryData
    {
        #region Private Fields

        private MvcULKDataContext dataContext;

        #endregion

        #region Properties

        public MvcULKDataContext DataContext
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

        public RepositoryData(MvcULKDataContext _dataContext)
        {
            DataContext = _dataContext;
        }

        public RepositoryData()
        {
            DataContext = new MvcULKDataContext();
        }

        #endregion
    }
}
