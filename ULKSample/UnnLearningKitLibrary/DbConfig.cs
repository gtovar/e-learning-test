using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnnLearningKitLibrary
{
    class DbConfig
    {
        public const string DbName = "unnmlg";

        public const string UserName = "peter";
        public const string UserPassword = "";

        public const string ConnectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=" + DbName + ";Integrated Security=true;User ID=" + UserName + ";Password=" + UserPassword;
    }
}
