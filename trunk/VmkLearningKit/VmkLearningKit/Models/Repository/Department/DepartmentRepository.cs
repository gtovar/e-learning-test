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

        #region Get

        public Department GetById(long id)
        {
            return DataContext.Departments.SingleOrDefault(d => d.Id == id);
        }

        public Department GetByTitle(string departmentTitle)
        {
            return DataContext.Departments.SingleOrDefault(d => d.Title == departmentTitle);
        }

        public IEnumerable<Department> GetAll()
        {
            return DataContext.Departments.AsEnumerable<Department>();
        }

        #endregion

        #region Set

        public void Add(Department obj)
        {
            DataContext.Departments.InsertOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, string newObjTitle)
        {
            Department updatedObj = GetById(updatedObjId);

            updatedObj.Title = newObjTitle;

            DataContext.SubmitChanges();
        }

        #endregion

        #region Delete

        public void Delete(Department obj)
        {
            DataContext.Departments.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Departments.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }

        #endregion
    }
}
