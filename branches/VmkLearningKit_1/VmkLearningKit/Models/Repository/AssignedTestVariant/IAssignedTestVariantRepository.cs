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
        IEnumerable<AssignedTestVariant> GetAllByGeneratedTestVariantId(long generatedTestVariantId);
        AssignedTestVariant GetLastStudentTopicTest(long idTopic, long idStudent);
        long Add(long idGeneratedTestVariant, long idStudent, DateTime date,/*DateTime endDate ,*/long professorId);
        IEnumerable<AssignedTestVariant> GetAllStudentTopicTests(long idTopic, long idStudent);
        bool UpdateMark(long id, int mark);
        AssignedTestVariant GetLastDoneStudentTopicTest(long idTopic, long idStudent);
    }
}
