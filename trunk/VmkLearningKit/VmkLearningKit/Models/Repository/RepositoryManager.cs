using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository 
{
    public class RepositoryManager : RepositoryData
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings[Constants.CONNECTION_STRING_NAME].ConnectionString;
        
        private static RepositoryManager repositoryManager = null;

        private RepositoryManager()
        {
            DataContext = new VmkLearningKitDataContext(connectionString);
        }

        /*
        public void RestoreDB()
        {
            string sql = @"USE master
                              RESTORE DATABASE VLK_DB
	                          FROM  DISK = N'C:\User Files\Education\MLG\svn\VmkLearningKit\VmkLearningKit\DbBackups\VLKDb.bak'
	                          WITH  FILE = 1,
	                          MOVE N'VLK_DB' TO N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\VLK_DB.mdf',
	                          MOVE N'VLK_DB_Log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\VLK_DB.ldf',
	                          NOUNLOAD,  STATS = 10
                              USE VLK_DB";
            try
            {
                DataContext.ExecuteCommand(sql);
            }
            catch (Exception ex)
            {
                Utility.WriteToLog("RepositoryManager.RestoreDB: failed", ex);   
            }
        }
        */
        public static RepositoryManager GetRepositoryManager
        {
            get
            {
                if (repositoryManager == null)
                {
                    repositoryManager = new RepositoryManager();
                }

                return repositoryManager;
            }
        }

        private IUserRepository userRepository;

        public IUserRepository GetUserRepository
        {
            get
            {
                if (userRepository == null)
                {
                    userRepository = new UserRepository(DataContext);
                }

                return userRepository;
            }
        }

        private IProfessorRepository professorRepository;

        public IProfessorRepository GetProfessorRepository
        {
            get
            {
                if (professorRepository == null)
                {
                    professorRepository = new ProfessorRepository(DataContext);
                }

                return professorRepository;
            }
        }

        private IStudentRepository studentRepository;

        public IStudentRepository GetStudentRepository
        {
            get
            {
                if (studentRepository == null)
                {
                    studentRepository = new StudentRepository(DataContext);
                }

                return studentRepository;
            }
        }

        private ISpecialityRepository specialityRepository;

        public ISpecialityRepository GetSpecialityRepository
        {
            get
            {
                if (specialityRepository == null)
                {
                    specialityRepository = new SpecialityRepository(DataContext);
                }

                return specialityRepository;
            }
        }

        private ISpecializationRepository specializationRepository;

        public ISpecializationRepository GetSpecializationRepository
        {
            get
            {
                if (specializationRepository == null)
                {
                    specializationRepository = new SpecializationRepository(DataContext);
                }

                return specializationRepository;
            }
        }

        private ISpecialityDisciplineRepository specialityDisciplineRepository;

        public ISpecialityDisciplineRepository GetSpecialityDisciplineRepository
        {
            get
            {
                if (specialityDisciplineRepository == null)
                {
                    specialityDisciplineRepository = new SpecialityDisciplineRepository(DataContext);
                }

                return specialityDisciplineRepository;
            }
        }

        private ISpecialityDisciplineTermRepository specialityDisciplineTermRepository;

        public ISpecialityDisciplineTermRepository GetSpecialityDisciplineTermRepository
        {
            get
            {
                if (specialityDisciplineTermRepository == null)
                {
                    specialityDisciplineTermRepository = new SpecialityDisciplineTermRepository(DataContext);
                }

                return specialityDisciplineTermRepository;
            }
        }

        private ISpecialityDisciplineTopicRepository specialityDisciplineTopicRepository;

        public ISpecialityDisciplineTopicRepository GetSpecialityDisciplineTopicRepository
        {
            get
            {
                if (specialityDisciplineTopicRepository == null)
                {
                    specialityDisciplineTopicRepository = new SpecialityDisciplineTopicRepository(DataContext);
                }

                return specialityDisciplineTopicRepository;
            }
        }

        private IDepartmentRepository departmentRepository;

        public IDepartmentRepository GetDepartmentRepository
        {
            get
            {
                if (departmentRepository == null)
                {
                    departmentRepository = new DepartmentRepository(DataContext);
                }

                return departmentRepository;
            }
        }

        private IChairRepository chairRepository;

        public IChairRepository GetChairRepository
        {
            get
            {
                if (chairRepository == null)
                {
                    chairRepository = new ChairRepository(DataContext);
                }

                return chairRepository;
            }
        }

        private IEducationPlanRepository educationPlanRepository;

        public IEducationPlanRepository GetEducationPlanRepository
        {
            get
            {
                if (educationPlanRepository == null)
                {
                    educationPlanRepository = new EducationPlanRepository(DataContext);
                }

                return educationPlanRepository;
            }
        }

        private ILecturePlanRepository lecturePlanRepository;

        public ILecturePlanRepository GetLecturePlanRepository
        {
            get
            {
                if (lecturePlanRepository == null)
                {
                    lecturePlanRepository = new LecturePlanRepository(DataContext);
                }

                return lecturePlanRepository;
            }
        }

        private IPracticePlanRepository practicePlanRepository;

        public IPracticePlanRepository GetPracticePlanRepository
        {
            get
            {
                if (practicePlanRepository == null)
                {
                    practicePlanRepository = new PracticePlanRepository(DataContext);
                }

                return practicePlanRepository;
            }
        }

        private IAnswerRepository answerRepository;

        public IAnswerRepository GetAnswerRepository
        {
            get
            {
                if (answerRepository == null)
                {
                    answerRepository = new AnswerRepository(DataContext);
                }

                return answerRepository;
            }
        }

        private IRazdelRepository razdelRepository;

        public IRazdelRepository GetRazdelRepository
        {
            get
            {
                if (razdelRepository == null)
                {
                    razdelRepository = new RazdelRepository(DataContext);
                }

                return razdelRepository;
            }
        }

        private IQuestionRepository questionRepository;

        public IQuestionRepository GetQuestionRepository
        {
            get
            {
                if (questionRepository == null)
                {
                    questionRepository = new QuestionRepository(DataContext);
                }

                return questionRepository;
            }
        }

        private IGroupRepository groupRepository;

        public IGroupRepository GetGroupRepository
        {
            get
            {
                if (groupRepository == null)
                {
                    groupRepository = new GroupRepository(DataContext);
                }

                return groupRepository;
            }
        }

        private ILectureTimetableRepository lectureTimetableRepository;

        public ILectureTimetableRepository GetLectureTimetableRepository
        {
            get
            {
                if (lectureTimetableRepository == null)
                {
                    lectureTimetableRepository = new LectureTimetableRepository(DataContext);
                }

                return lectureTimetableRepository;
            }
        }
    }
}
