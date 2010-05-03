using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository
{
    class AssignedTestVariantRepository : Repository<AssignedTestVariant>, IAssignedTestVariantRepository
    {
        public AssignedTestVariantRepository(VmkLearningKitDataContext dataContext) :
            base(dataContext)
        {
        }

        public AssignedTestVariant GetById(long id)
        {
            return DataContext.AssignedTestVariants.SingleOrDefault(ch => ch.Id == id);
        }

        public IEnumerable<AssignedTestVariant> GetAll(long studentId)
        {
            return DataContext.AssignedTestVariants.Where(t => t.StudentId == studentId);
        }

        public IEnumerable<AssignedTestVariant> GetUserTests(long idStudent)
        {
            try
            {
                return DataContext.AssignedTestVariants.Where(atv => atv.StudentId == idStudent);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public IEnumerable<AssignedTestVariant> GetAllStudentTopicTests(long idTopic, long idStudent)
        {
            IEnumerable<GeneratedTest> _gtt = DataContext.GeneratedTests.Where(gt => gt.SpecialityDisciplineTopicId == idTopic);
            List<GeneratedTestVariant> gtv = new List<GeneratedTestVariant>();
            if (_gtt.Count() == 0) return null;
            foreach (GeneratedTest item in _gtt)
            {
                IEnumerable<GeneratedTestVariant> tmp = DataContext.GeneratedTestVariants.Where(g => g.GeneratedTestId == item.Id);
                if (tmp == null) continue;
                foreach (GeneratedTestVariant it in tmp)
                {
                    gtv.Add(it);
                }
            }
            List<AssignedTestVariant> atv = new List<AssignedTestVariant>();
            if (gtv.Count == 0) return null;
            foreach (GeneratedTestVariant item in gtv)
            {
                IEnumerable<AssignedTestVariant> tmp = DataContext.AssignedTestVariants.Where(c => (c.GeneratedTestVariantId == item.Id && c.StudentId == idStudent));
                if (tmp != null)
                    foreach (AssignedTestVariant it in tmp)
                        atv.Add(it);
            }
            return atv;
       }


        public AssignedTestVariant GetLastStudentTopicTest(long idTopic, long idStudent)
        {
            IEnumerable<AssignedTestVariant> atv = GetAllStudentTopicTests(idTopic, idStudent);
            try
            {
                return atv.OrderBy(c => c.AssignedDate).Last();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("у студента с id= " + idStudent.ToString() + "нет назначенных тестов по теме" + idTopic.ToString());
                return null;
            }
       }


        public void SetAssignedTestVariant(long idGeneratedTestVariant, long idStudent, DateTime date)
        {
            AssignedTestVariant atv = new AssignedTestVariant
            {
                StudentId = idStudent,
                GeneratedTestVariantId = idGeneratedTestVariant,
                AssignedDate = (DateTime)date,
                Path = "1",
                Score = 0,
            };
            try
            {
                DataContext.AssignedTestVariants.InsertOnSubmit(atv);
                DataContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("ошибка при встакве в бд " + ex.ToString());
            }
        }

        public void Delete(AssignedTestVariant obj)
        {
            DataContext.AssignedTestVariants.DeleteOnSubmit(obj);

            DataContext.SubmitChanges();
        }

        public void DeleteById(long id)
        {
            DataContext.AssignedTestVariants.DeleteOnSubmit(GetById(id));

            DataContext.SubmitChanges();
        }
    }
}
