using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcULK_Editor.Models
{
    public class RepositoryManager : RepositoryData
    {
        public RepositoryManager(string connectionString)
        {
            DataContext = new MvcULKDataContext(connectionString);
        }

        private MembershipRepository _membershipRepository;

        public MembershipRepository membershipRepository
        {
            get
            {
                if (_membershipRepository == null)
                {
                    _membershipRepository = new MembershipRepository();
                }

                return _membershipRepository;
            }
        }

        private DepartmentRepository _departmentRepository;

        public DepartmentRepository departmentRepository
        {
            get
            {
                if (_departmentRepository == null)
                {
                    _departmentRepository = new DepartmentRepository(DataContext);
                }

                return _departmentRepository;
            }
        }

        private DisciplineRepository _disciplineRepository;

        public DisciplineRepository disciplineRepository
        {
            get
            {
                if (_disciplineRepository == null)
                {
                    _disciplineRepository = new DisciplineRepository(DataContext);
                }

                return _disciplineRepository;
            }
        }

        private TopicRepository _topicRepository;

        public TopicRepository topicRepository
        {
            get
            {
                if (_topicRepository == null)
                {
                    _topicRepository = new TopicRepository(DataContext);
                }

                return _topicRepository;
            }
        }

        private RazdelRepository _razdelRepository;

        public RazdelRepository razdelRepository
        {
            get
            {
                if (_razdelRepository == null)
                {
                    _razdelRepository = new RazdelRepository(DataContext);
                }

                return _razdelRepository;
            }
        }

        private QuestionRepository _questionRepository;

        public QuestionRepository questionRepository
        {
            get
            {
                if (_questionRepository == null)
                {
                    _questionRepository = new QuestionRepository(DataContext);
                }

                return _questionRepository;
            }
        }

        private AnswerRepository _answerRepository;

        public AnswerRepository answerRepository
        {
            get
            {
                if (_answerRepository == null)
                {
                    _answerRepository = new AnswerRepository(DataContext);
                }

                return _answerRepository;
            }
        }
    }
}
