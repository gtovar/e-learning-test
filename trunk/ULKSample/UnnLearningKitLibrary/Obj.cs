using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    abstract public class Obj
    {
        protected int _id;

        public Obj(int id) { _id = id; }

        public int Id
        {
            get { return _id; }
        }
    }
}
