using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IDisciplineRepository : IRepository<Discipline>
    {
        IEnumerable<Discipline> GetAll();
        void Add(Discipline obj);
        void UpdateById(long updatedObjId, long newObjDepartmentId, string newObjTitle);
        void UpdateById(long updatedObjId, string newObjTitle);
    }
}
