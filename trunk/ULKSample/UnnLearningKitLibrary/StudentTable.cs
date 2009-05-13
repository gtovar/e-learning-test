using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public class StudentTable : IStudentTable
    {
        private IStudentTable _tableImp = null;

        public StudentTable()
        {
            _tableImp = (IStudentTable)(new LocalStudentTable());
        }

        public void Init()
        {
            _tableImp.Init();
        }

        public void Add(Obj Obj)
        {
            _tableImp.Add(Obj);
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

        public int GetStudentIdByName(string name)
        {
            return _tableImp.GetStudentIdByName(name);
        }

        public Obj GetById(int id)
        {
            return _tableImp.GetById(id);
        }

        public void Destroy()
        {
            _tableImp.Destroy();
        }
    }
}
