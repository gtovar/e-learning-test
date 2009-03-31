using System;
using System.Collections.Generic;
using System.Text;

namespace ULKLibs
{
    public class DepartmentRecord : Record
    {
        protected Title _title;

        public DepartmentRecord(Id id, Title title)
        {
            _id = id;
            _title = title;
        }

        public DepartmentRecord(Title title)
        {
            _title = title;
        }

        public DepartmentRecord(DepartmentRecord departmentRecord)
        {
            _id = departmentRecord.Id;
            _title = departmentRecord.Title;
        }

        public DepartmentRecord() { }

        public Title Title
        {
            get { return _title; }
            set { _title = value; }
        }

        public override string ToString()
        {
            return GetType().FullName + " " + _id.ToString() + " " + _title.ToString();
        }
    }
}
