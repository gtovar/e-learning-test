using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public class DisciplinePart : Obj
    {
        protected string _title = String.Empty;

        public DisciplinePart(int id, string title)
            : base(id)
        {
            _title = title;
        }

        public DisciplinePart(DisciplinePart disciplinePart)
            : base(disciplinePart.Id)
        {
            _title = disciplinePart.Title;
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
