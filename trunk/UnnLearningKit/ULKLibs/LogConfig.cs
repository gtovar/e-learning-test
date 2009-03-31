using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Xml;

namespace ULKLibs
{
    public class LogConfig : IConfig
    {
        private static IConfig _config = null;

        private const string ConfigFullFileName = "../../../logconfig.xml";
        public static string LogFileName = null;
        public static string LogFilePath = null;

        public const int BufferLength = 20;

        private LogConfig() { }

        public static IConfig GetInstance()
        {
            if (null == _config) { _config = new LogConfig(); }

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
                        if (reader.Name == "log")
                        {
                            LogFileName = reader.GetAttribute("logfilename");
                            LogFilePath = reader.GetAttribute("logfilepath");
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
                if (null != reader) { reader.Close(); }
            }
        }

        public void UnLoad() { }
    }
}
