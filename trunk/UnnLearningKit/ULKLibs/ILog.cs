using System;
using System.Collections.Generic;
using System.Text;

namespace ULKLibs
{
    public interface ILog
    {
        bool Init();
        bool Put(LogObj logObj);
        bool Flush();
        bool Close();
    }
}
