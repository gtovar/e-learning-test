using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class DepartmentRepository : Repository<Department>, IDepartmentRepository
    {
        public DepartmentRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public Department GetById(long id)
        {
            return DataContext.Departments.SingleOrDefault(d => d.Id == id);
        }

        public Department GetByTitle(string departmentTitle)
        {
            return DataContext.Departments.SingleOrDefault(d => d.Title == departmentTitle);

        }
    }
}
