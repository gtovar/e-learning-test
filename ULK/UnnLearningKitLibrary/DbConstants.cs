using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    struct DbConstants
    {
        public const string BeginTransaction = " BEGIN TRY BEGIN TRANSACTION ";
        public const string EndTransaction = " COMMIT TRANSACTION END TRY BEGIN CATCH ROLLBACK TRANSACTION END CATCH ";

        public const int FAKE_ID = -1;
    }
}
