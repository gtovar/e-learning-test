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
        IEnumerable<Group> GetAllByDepartmentId(long departmentId);
        Group GetByAlias(string alias);
        Group GetByTitle(string title);
        long GetMaxId();
        Group Add(Group obj);
        IEnumerable<Group> GetAllByDisciplineProfessor(long disciplineId, long professorId);
    }
}
