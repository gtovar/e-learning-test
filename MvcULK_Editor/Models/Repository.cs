using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcULK_Editor.Models
{
    public abstract class Repository<T> : RepositoryData, IRepository<T>
    {
        public Repository(MvcULKDataContext _dataContext)
            : base(_dataContext)
        {
        }
        
        public abstract IEnumerable<T> GetAll();

        public abstract T GetById(int id);
    }
}
