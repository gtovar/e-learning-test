using System;
using System.Collections.Generic;
using System.Text;

namespace ULKLibs
{
    public class DepartmentTable : IDepartmentTable
    {
        private IDepartmentTable _tableImp = null;

        public DepartmentTable(IDepartmentTable tableImp)
        {
            _tableImp = tableImp;
        }

        public void Initialize()
        {
            _tableImp.Initialize();
        }

        public bool AddRecord(Record record)
        {
            return _tableImp.AddRecord(record);
        }

        public bool UpdateRecord(Record record)
        {
            return _tableImp.UpdateRecord(record);
        }

        public bool DeleteRecord(Id id)
        {
            return _tableImp.DeleteRecord(id);
        }

        public List<Record> GetAllRecords()
        {
            return _tableImp.GetAllRecords();
        }

        public Record GetRecordById(Id id)
        {
            return _tableImp.GetRecordById(id);
        }

        public void Finalize() 
        {
            _tableImp.Finalize();
        }
    }
}
