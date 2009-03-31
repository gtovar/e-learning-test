using System;
using System.Collections.Generic;
using System.Text;

namespace ULKLibs
{
    public struct DbConstants
    {
        public const string BeginTransaction = " BEGIN TRY BEGIN TRANSACTION ";
        public const string EndTransaction = " COMMIT TRANSACTION END TRY BEGIN CATCH ROLLBACK TRANSACTION END CATCH ";
    }
}
