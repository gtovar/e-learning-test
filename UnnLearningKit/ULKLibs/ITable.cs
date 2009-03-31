using System;
using System.Collections.Generic;
using System.Text;

namespace ULKLibs
{
    public interface ITable
    {
        void Initialize();
        bool AddRecord(Record record);
        bool UpdateRecord(Record record);
        bool DeleteRecord(Id id);
        List<Record> GetAllRecords();
        Record GetRecordById(Id id);
        void Finalize();
    }
}
