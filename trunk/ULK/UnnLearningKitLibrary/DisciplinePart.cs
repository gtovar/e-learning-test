using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public class DisciplinePart : Obj
    {
        protected string _title = String.Empty;
        protected int _discipline_id = Constants.FAKE_ID;

        public DisciplinePart(int id, int disciplineId, string title)
            : base(id)
        {
            _title = title;
            _discipline_id = disciplineId;
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

        public int DisciplineId
        {
            get { return _discipline_id; }
            set { _discipline_id = value; }
        }

        public override string ToString()
        {
            return _title;
        }
    }
}
