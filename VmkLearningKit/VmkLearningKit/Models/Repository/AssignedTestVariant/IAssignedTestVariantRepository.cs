using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VmkLearningKit.Models.Repository
{
    public interface IAssignedTestVariantRepository : IRepository<AssignedTestVariant>
    {
        IEnumerable<AssignedTestVariant> GetAll(long studentId);
        IEnumerable<AssignedTestVariant> GetUserTests(long idStudent);
        AssignedTestVariant GetLastStudentTopicTest(long idTopic, long idStudent);
        void SetAssignedTestVariant(long idGeneratedTestVariant, long idStudent, DateTime date);
        IEnumerable<AssignedTestVariant> GetAllStudentTopicTests(long idTopic, long idStudent);
    }
}
