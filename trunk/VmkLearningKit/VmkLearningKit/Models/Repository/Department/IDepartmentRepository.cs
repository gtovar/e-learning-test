using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IDepartmentRepository : IRepository<Department>
    {
        Department GetByTitle(string departmentTitle);
        
        IEnumerable<Department> GetAll();

        void Add(Department obj);

        void UpdateById(long updatedObjId, string newObjTitle);
    }
}
