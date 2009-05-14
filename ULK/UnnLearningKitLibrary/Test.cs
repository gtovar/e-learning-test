using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    public class Test : Obj
    {
        protected int _studentId;
        protected int _testVariantId;

        public Test() : base() { }

        public Test(int id, int studentid, int testVariantid)
            : base(id)
        {
            _studentId = studentid;
            _testVariantId = testVariantid;
        }

        public int StudentId
        {
            get { return _studentId; }
            set { _studentId = value; }
        }

        public int TestVariantId
        {
            get { return _testVariantId; }
            set { _testVariantId = value; }
        }
    }
}
