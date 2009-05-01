using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public class Student : Obj
    {
        protected string _name = String.Empty;
        protected string _login = String.Empty;
        protected string _email = String.Empty;
        protected string _description = String.Empty;
        protected int _group_id = Constants.FAKE_ID;

        public Student() : base() {}

        public Student(int id, int groupId, string name, string login, string email)
            : base(id)
        {
            _name = name;
            _login = login;
            _email = email;
            _group_id = groupId;
        }

        public Student(int id, int groupId, string name, string login, string email, string description)
            : this(id, groupId, name, login, email)
        {
            _description = description;
        }

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        public string Login
        {
            get { return _login; }
            set { _login = value; }
        }

        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

        public int GroupId
        {
            get { return _group_id; }
            set { _group_id = value; }
        }
    }
}
