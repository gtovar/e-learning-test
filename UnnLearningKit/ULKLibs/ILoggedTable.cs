using System;
using System.Collections.Generic;
using System.Text;

namespace ULKLibs
{
    public interface ILoggedTable
    {
        void InitLog();
        void PutToLog(string subModuleTitle, string description);
        void CloseLog();
    }
}
