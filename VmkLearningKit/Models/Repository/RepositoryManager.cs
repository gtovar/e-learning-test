using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using VmkLearningKit.Core;

namespace VmkLearningKit.Models.Repository 
{
    /// <summary>
    /// Единый класс для доступа к классам-оберткам для каждого логического блока данных 
    /// </summary>
    public class RepositoryManager : RepositoryData
    {
        /// <summary>
        /// Статическое поле, содержащее строку подключения к базе данных
        /// </summary>
        private static string connectionString = ConfigurationManager.ConnectionStrings[Constants.CONNECTION_STRING_NAME].ConnectionString;
        
        /// <summary>
        /// Статическое поле для для хранения объекта класса «RepositoryManager»
        /// </summary>
        private static RepositoryManager repositoryManager = null;

        private RepositoryManager()
        {
            DataContext = new VmkLearningKitDataContext(connectionString);
        }

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

        /// <summary>
        /// Поле для хранения объекта класса «UserRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «ProfessorRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «StudentRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «SpecialityRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «SpecializationRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «SpecialityDisciplineRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «SpecialityDisciplineTermRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «SpecialityDisciplineTopicRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «DepartmentRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «ChairRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «EducationPlanRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «LecturePlanRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «PracticePlanRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «AnswerRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «RazdelRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «QuestionRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «GroupRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «LectureTimetableRepository»
        /// </summary>
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

        /// <summary>
        /// Поле для хранения объекта класса «GeneratedQuestionRepository»
        /// </summary>
        private IGeneratedQuestionRepository generatedQuestionRepository;

        public IGeneratedQuestionRepository GetGeneratedQuestionRepository
        {
            get
            {
                if (generatedQuestionRepository == null)
                {
                    generatedQuestionRepository = new GeneratedQuestionRepository(DataContext);
                }
                return generatedQuestionRepository;
            }
        }

        /// <summary>
        /// Поле для хранения объекта класса «GeneratedTestVariantRepository»
        /// </summary>
        private IGeneratedTestVariantRepository generatedTestVariantRepository;

        public IGeneratedTestVariantRepository GetGeneratedTestVariantRepository
        {
            get
            {
                if (generatedTestVariantRepository == null)
                {
                    generatedTestVariantRepository = new GeneratedTestVariantRepository(DataContext);
                }
                return generatedTestVariantRepository;
            }

        }

        /// <summary>
        /// Поле для хранения объекта класса «GeneratedTestRepository»
        /// </summary>
        private IGeneratedTestRepository generatedTestRepository;

        public IGeneratedTestRepository GetGeneratedTestRepository
        {
            get
            {
                if (generatedTestRepository == null)
                {
                    generatedTestRepository = new GeneratedTestRepository(DataContext);
                }
                return generatedTestRepository;
            }
        }

        /// <summary>
        /// Поле для хранения объекта класса «AssignedTestVariantRepository»
        /// </summary>
        private IAssignedTestVariantRepository assignedTestVariantRepository;

        public IAssignedTestVariantRepository GetAssignedTestVariantRepository
        {
            get
            {
                DataContext.AssignedTestVariants.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.AssignedTestVariants);

                if (assignedTestVariantRepository == null)
                {
                    assignedTestVariantRepository = new AssignedTestVariantRepository(DataContext);
                }
                return assignedTestVariantRepository;
            }
        }

        /// <summary>
        /// Поле для хранения объекта класса «SpecialityDisciplinesProfessorRepository»
        /// </summary>
        private ISpecialityDisciplinesProfessorRepository specialityDisciplinesProfessorRepository;

        public ISpecialityDisciplinesProfessorRepository GetSpecialityDisciplinesProfessorRepository
        {
            get
            {
                DataContext.SpecialityDisciplinesProfessors.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.SpecialityDisciplinesProfessors);

                if (assignedTestVariantRepository == null)
                {
                    specialityDisciplinesProfessorRepository = new SpecialityDisciplinesProfessorRepository(DataContext);
                }
                return specialityDisciplinesProfessorRepository;
            }
        }
    }
}
