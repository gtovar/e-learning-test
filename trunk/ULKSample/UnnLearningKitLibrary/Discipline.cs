using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public class Discipline : Obj
    {
        protected string _title = String.Empty;
        protected int _departmentId;
        protected int _chairId;

        public Discipline(int id, int departmentId, int chairId, string title)
            : base(id)
        {
            _chairId = chairId;
            _departmentId = departmentId;
            _title = title;
        }

        public Discipline(Discipline discipline)
            : base(discipline.Id)
        {
            _chairId = discipline.ChairId;
            _departmentId = discipline.DepartmentId;
            _title = discipline.Title;
        }

        public int ChairId
        {
            get { return _chairId; }
            set { _chairId = value; }
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

        public override string ToString()
        {
            return _title;
        }
    }
}
