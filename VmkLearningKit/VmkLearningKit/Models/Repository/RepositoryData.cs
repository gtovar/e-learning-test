using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public class RepositoryData
    {
        #region Private Fields

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


        public void SubmitChanges()
        {
            DataContext.SubmitChanges();
        }

        #endregion
    }
}
