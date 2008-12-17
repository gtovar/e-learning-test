using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Reflection;

namespace WordToScorm
{
    static class Environment
    {
        static string appDir = _AppDir();
        static string appTempDir = _AppDir() + "\\temp";
        static string appSchemasDir = _AppDir() + "\\pack\\Schemas";
        static string appScriptsDir = _AppDir() + "\\pack\\Scripts";
        static string appStylesDir = _AppDir() + "\\pack\\Styles";
        static string appScormDir = appTempDir + "\\scorm_pack";
        static string appScormTestDir = appScormDir + "\\test";

        static string manifestFileName = "imsmanifest.xml";
        static string testFileName = "assessment.html";

        static string _AppDir()
        {
            return Path.GetDirectoryName(Assembly.GetExecutingAssembly().GetModules()[0].FullyQualifiedName);
        }
        // каталог приложения
        public static string AppDir
        {
            get
            {
                return appDir;
            }
        }
        // временный каталог приложения
        public static string AppTempDir 
        { 
            get
            {
                return appTempDir;
            }
        }
        // каталог с необходимыми для скорм схемами
        public static string AppSchemasDir
        {
            get
            {
                return appSchemasDir;
            }
        }
        // каталог с необходимыми для скорм скриптами
        public static string AppScriptsDir
        {
            get
            {
                return appScriptsDir;
            }
        }
        // каталог с необходимыми для скорм стилями
        public static string AppStylesDir
        {
            get
            {
                return appStylesDir;
            }
        }

        public static string AppScormDir
        {
            get
            {
                return appScormDir;
            }
        }

        public static string AppScormTestDir
        {
            get
            {
                return appScormTestDir;
            }
        }
        // имя файла манифеста
        public static string ManifestFileName
        {
            get
            {
                return manifestFileName;
            }
        }
        // имя файла теста
        public static string TestFileName
        {
            get
            {
                return testFileName;
            }
        }
    }
}
