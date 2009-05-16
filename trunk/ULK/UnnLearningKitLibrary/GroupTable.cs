using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public class GroupTable : IGroupTable
    {
        private IGroupTable _tableImp = null;

        public GroupTable()
        {
            _tableImp = (IGroupTable)(new LocalGroupTable());
        }

        public void Init()
        {
            _tableImp.Init();
        }

        public void Add(Obj Obj)
        {
            _tableImp.Add(Obj);
        }

        public Obj GetByGroupTitle(string groupTitle)
        {
            return _tableImp.GetByGroupTitle(groupTitle);
        }

        public void Update(Obj Obj)
        {
            _tableImp.Update(Obj);
        }

        public void Delete(int id)
        {
            _tableImp.Delete(id);
        }

        public List<Obj> GetAll()
        {
            return _tableImp.GetAll();
        }

        public Obj GetById(int id)
        {
            return _tableImp.GetById(id);
        }

        public List<Obj> GetAllByDepartmentId(int departmentId)
        {
            return _tableImp.GetAllByDepartmentId(departmentId);
        }

        public void Destroy()
        {
            _tableImp.Destroy();
        }
    }
}
