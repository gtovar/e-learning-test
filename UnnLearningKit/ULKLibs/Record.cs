using System;
using System.Collections.Generic;
using System.Text;

namespace ULKLibs
{
    public class Record
    {
        protected Id _id;

        public Id Id
        {
            get { return _id; }
        }

        public override string ToString()
        {
            return GetType().FullName + " " + _id.ToString();
        }
    }
}