using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public interface ITable
    {
        void Init();
        void Add(Obj obj);
        void Update(Obj obj);
        void Delete(int id);
        List<Obj> GetAll();
        Obj GetById(int id);
        void Destroy();
    }
}
