using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IDepartmentRepository : IRepository<Department>
    {
        Department GetByAlias(string alias);
        //Department GetByTitle(string title);
        Department GetByAbbreviation(string abbreviation);
        long GetMaxId();
        IEnumerable<Department> GetAll();
        Department Add(Department obj);
        void UpdateById(long updatedObjId, string newObjTitle);
    }
}
