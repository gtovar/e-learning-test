using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Xml;

namespace ULKLibs
{
    public class DbConfig : IConfig
    {
        private static IConfig _config = null;

        private const string ConfigFullFileName = "../../../dbconfig.xml";
        public static string DbName = null;
        private static string UserName = null;
        private static string UserPassword = null;
        public static string ConnectionString = null;

        public static string LocalDepartmentTableName = null;
        public static string LocalDepartmentColumnIdName = null;
        public static string LocalDepartmentColumnTitleName = null;

        private DbConfig() {}

        public static IConfig GetInstance()
        {
            if (null == _config) { _config = new DbConfig(); }

            return _config;
        }

        public void Load() 
        {
            XmlTextReader reader = null;

            try
            {
                reader = new XmlTextReader(ConfigFullFileName);
                reader.WhitespaceHandling = WhitespaceHandling.None; // пропускаем пустые узлы 

                while (reader.Read())
                {
                    if (reader.NodeType == XmlNodeType.Element)
                    {
                        if (reader.Name == "dbconnection")
                        {
                            DbName = reader.GetAttribute("dbname");
                            UserName = reader.GetAttribute("username");
                            UserPassword = reader.GetAttribute("userpassword");
                        }
                        if (reader.Name == "department")
                        {
                            LocalDepartmentTableName = reader.GetAttribute("tablename");
                            LocalDepartmentColumnIdName = reader.GetAttribute("id");
                            LocalDepartmentColumnTitleName = reader.GetAttribute("title");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //FIXME: ADD SOMETHING HANDLER
            }
            finally
            {
                ConnectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=" + DbName + ";Integrated Security=true;User ID=" + UserName + ";Password=" + UserPassword;
                if (null != reader) { reader.Close(); }
            }
        }

        public void UnLoad() { }
    }
}
