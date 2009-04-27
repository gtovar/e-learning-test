using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public class Group : Obj
    {
        protected int _departmentId;
        protected string _title = String.Empty;
        protected string _description = String.Empty;

        public Group(int id, int departmentId, string title)
            : base(id)
        {
            _departmentId = departmentId;
            _title = title;
            _description = String.Empty;
        }

        public Group(int id, int departmentId, string title, string description)
            : base(id)
        {
            _departmentId = departmentId;
            _title = title;
            _description = description;
        }

        public Group(Group group)
            : base(group.Id)
        {
            _departmentId = group.DepartmentId;
            _title = group.Title;
            _description = group.Description;
        }

        public int DepartmentId
        {
            get { return _departmentId; }
            set { _departmentId = value; }
        }

        public string Title
        {
            get { return _title; }
            set { _title = value; }
        }

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

        public override string ToString()
        {
            return _title;
        }
    }
}
