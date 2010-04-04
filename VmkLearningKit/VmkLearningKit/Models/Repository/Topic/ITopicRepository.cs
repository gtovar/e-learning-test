using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface ITopicRepository : IRepository<Topic>
    {
        IEnumerable<Topic> GetAll();
        void Add(Topic obj);
        void UpdateById(long updatedObjId, long newObjDisciplineId, string newObjTitle);
        void UpdateById(long updatedObjId, string newObjTitle);
    }
}
