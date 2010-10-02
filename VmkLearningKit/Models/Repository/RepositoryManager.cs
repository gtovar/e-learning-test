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
                DataContext.Users.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.Users);

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
                DataContext.Professors.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.Professors);

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
                DataContext.Students.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.Students);

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
                DataContext.Specialities.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.Specialities);

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
                DataContext.Specializations.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.Specializations);

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
                DataContext.SpecialityDisciplines.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.SpecialityDisciplines);

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
                DataContext.SpecialityDisciplineTerms.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.SpecialityDisciplineTerms);

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
                DataContext.SpecialityDisciplineTopics.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.SpecialityDisciplineTopics);

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
                DataContext.Departments.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.Departments);

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
                DataContext.Chairs.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.Chairs);

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
                DataContext.EducationPlans.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.EducationPlans);

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
                DataContext.LecturePlans.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.LecturePlans);

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
                DataContext.PracticePlans.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.PracticePlans);

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
                DataContext.Answers.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.Answers);

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
                DataContext.Razdels.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.Razdels);

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
                DataContext.Questions.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.Questions);

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
                DataContext.Groups.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.Groups);

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
                DataContext.LectureTimetables.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.LectureTimetables);

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
                DataContext.GeneratedQuestions.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.GeneratedQuestions);

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
                DataContext.GeneratedTestVariants.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.GeneratedTestVariants);

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
                DataContext.GeneratedTests.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.GeneratedTests);

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

                if (specialityDisciplinesProfessorRepository == null)
                {
                    specialityDisciplinesProfessorRepository = new SpecialityDisciplinesProfessorRepository(DataContext);
                }
                return specialityDisciplinesProfessorRepository;
            }
        }

        /// <summary>
        /// Поле для хранения объекта класса «PracticeAndLabTimetableRepository»
        /// </summary>
        private IPracticeAndLabTimetableRepository practiceAndLabTimetableRepository;

        public IPracticeAndLabTimetableRepository GetPracticeAndLabTimetableRepository
        {
            get
            {
                DataContext.PracticeAndLabTimetables.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.PracticeAndLabTimetables);

                if (practiceAndLabTimetableRepository == null)
                {
                    practiceAndLabTimetableRepository = new PracticeAndLabTimetableRepository(DataContext);
                }
                return practiceAndLabTimetableRepository;
            }
        }

        /// <summary>
        /// Поле для хранения объекта класса «GroupsLectureTimetableRepository»
        /// </summary>
        private IGroupsLectureTimetableRepository groupsLectureTimetableRepository;

        public IGroupsLectureTimetableRepository GetGroupsLectureTimetableRepository
        {
            get
            {
                DataContext.GroupsLectureTimetables.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.GroupsLectureTimetables);

                if (groupsLectureTimetableRepository == null)
                {
                    groupsLectureTimetableRepository = new GroupsLectureTimetableRepository(DataContext);
                }
                return groupsLectureTimetableRepository;
            }
        }

        /// <summary>
        /// Поле для хранения объекта класса «SpecialityDisciplineProgramRepository»
        /// </summary>
        private ISpecialityDisciplineProgramRepository specialityDisciplineProgramRepository;

        public ISpecialityDisciplineProgramRepository GetSpecialityDisciplineProgramRepository
        {
            get
            {
                DataContext.SpecialityDisciplinePrograms.Context.Refresh(System.Data.Linq.RefreshMode.OverwriteCurrentValues, DataContext.SpecialityDisciplinePrograms);

                if (specialityDisciplineProgramRepository == null)
                {
                    specialityDisciplineProgramRepository = new SpecialityDisciplineProgramRepository(DataContext);
                }
                return specialityDisciplineProgramRepository;
            }
        }
    }
}
