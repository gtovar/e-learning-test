using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    abstract class Repository<T> : RepositoryData
    {
        public Repository(VmkLearningKitDataContext dataContext)
            : base(dataContext)
        {
        }
    }
}
