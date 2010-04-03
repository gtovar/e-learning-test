using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    public interface IDepartmentRepository : IRepository<Department>
    {
        Department GetByTitle(string departmentTitle);
    }
}
