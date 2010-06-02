using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;
using System.IO;

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
            int how_long_show_test = Math.Max(VLKConstants.HOW_LONG_SHOW_DONE_TEST, VLKConstants.HOW_LONG_SHOW_CHECKED_TEST);
            return DataContext.AssignedTestVariants.Where(t => t.StudentId == studentId &&
                ((int)(t.AssignedDate.Date - DateTime.Now.Date).TotalDays) < how_long_show_test);
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
            return (IEnumerable<AssignedTestVariant>)atv.OrderByDescending(o=>o.AssignedDate);
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

        public bool UpdateMark(long id, int mark)
        {
            DataContext.AssignedTestVariants.Single(atv => atv.Id == id).Mark = mark;
            try
            {
                DataContext.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("ошибка при мзменении данных " + ex.ToString());
                return false;
            }


        }

        public long Add(long idGeneratedTestVariant, long idStudent, DateTime date, long professorId)
        {
            AssignedTestVariant newAtv = new AssignedTestVariant
            {
                StudentId = idStudent,
                GeneratedTestVariantId = idGeneratedTestVariant,
                AssignedDate = (DateTime)date,
                State = VLKConstants.TEST_VARIANT_STATE_NEW,
                Path = "",
                Score = 0,
                Mark = 0,
                StudentKey = Hash.ComputeHash(idStudent.ToString()),
                ProfessorKey = Hash.ComputeHash(professorId.ToString()),
                // идентификатор пакета в базе данных плеера
                // данный идентификатор кладется плеером
                PackageId = VLKConstants.PACKAGE_DEFAULT_ID
            };

            try
            {
                long gt = DataContext.GeneratedTestVariants.Single(gtv => gtv.Id == idGeneratedTestVariant).GeneratedTestId;
                long firstId = DataContext.GeneratedTestVariants.Where(gtv => gtv.GeneratedTestId == gt).OrderBy(o => o.Id).First().Id;
                string serverPath = HttpContext.Current.Server.MapPath("/Uploads");
                string sourcePath = serverPath + "/Pacages/" +  gt.ToString() + "/" + (idGeneratedTestVariant - firstId + 1).ToString() + ".zip";
                FileInfo source = new FileInfo(sourcePath);
                if (!source.Exists)
                {
                    Utility.WriteToLog("не найдет архив тестового варианта " + (idGeneratedTestVariant - firstId + 1).ToString());
                    return -1;
                }
           
                DataContext.AssignedTestVariants.InsertOnSubmit(newAtv);
                DataContext.SubmitChanges();
                
                string destPath = serverPath + "/AssignedTests" + "/student_" + idStudent.ToString() + "/" + newAtv.Id.ToString();
                DirectoryInfo dir = new DirectoryInfo(destPath);
                if (!dir.Exists)
                    dir.Create();
                FileInfo test = new FileInfo(sourcePath);
                string copyPath = destPath + "/" + (idGeneratedTestVariant - firstId + 1).ToString() + ".zip";
                test.CopyTo(copyPath, true);
                newAtv.Path = copyPath;

            }
            catch (Exception ex)
            {
                Utility.WriteToLog("ошибка при встакве в бд " + ex.ToString());
                return -1;
            }

            return newAtv.Id;


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
