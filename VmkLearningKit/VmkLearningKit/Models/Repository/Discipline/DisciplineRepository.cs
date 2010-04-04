using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VmkLearningKit.Models.Repository
{
    class DisciplineRepository : Repository<Discipline>, IDisciplineRepository
    {
        public DisciplineRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        #region Get

        public Discipline GetById(long id)
        {
            return DataContext.Disciplines.SingleOrDefault(t => t.Id == id);
        }

        public IEnumerable<Discipline> GetAll()
        {
            return DataContext.Disciplines.AsEnumerable<Discipline>();
        }

        #endregion

        #region Set

        public void Add(Discipline obj)
        {
            DataContext.Disciplines.InsertOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, long newObjDepartmentId, string newObjTitle)
        {
            Discipline updatedObj = GetById(updatedObjId);

            updatedObj.DepartmentId = newObjDepartmentId;
            updatedObj.Title        = newObjTitle;

            DataContext.SubmitChanges();
        }

        public void UpdateById(long updatedObjId, string newObjTitle)
        {
            Discipline updatedObj = GetById(updatedObjId);

            updatedObj.Title = newObjTitle;

            DataContext.SubmitChanges();
        }

        #endregion

        #region Delete

        public void Delete(Discipline obj)
        {
            DataContext.Disciplines.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.Disciplines.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }

        #endregion
    }
}
