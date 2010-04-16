using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    public interface IGroupRepository : IRepository<Group>
    {
        IEnumerable<Group> GetAll();
        Group GetByAlias(string alias);
        Group GetByTitle(string title);
        long GetMaxId();
        Group Add(Group obj);
    }
}
