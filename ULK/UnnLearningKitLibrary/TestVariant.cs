using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public class TestVariant : Obj
    {
        protected string _title = String.Empty;
        protected string _path = String.Empty;
        protected int _discipline_part_id = Constants.FAKE_ID;
        protected bool _is_deleted;

        public TestVariant(int id, int disciplinePartId, string title, string path)
            : base(id)
        {
            _title = title;
            _path = path;
            _discipline_part_id = disciplinePartId;
        }

        public TestVariant(TestVariant testVariant)
            : base(testVariant.Id)
        {
            _title = testVariant.Title;
            _path = testVariant.Path;
        }

        public string Title
        {
            get { return _title; }
            set { _title = value; }
        }

        public string Path
        {
            get { return _path; }
            set { _path = value; }
        }

        public int DisciplinePartId
        {
            get { return _discipline_part_id; }
            set { _discipline_part_id = value; }
        }

        public bool IsDeleted
        {
            get { return _is_deleted; }
            set { _is_deleted = value; }
        }

        public override string ToString()
        {
            return _title;
        }
    }
}
