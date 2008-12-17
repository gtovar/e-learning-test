using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

using ICSharpCode.SharpZipLib.Zip;

namespace WordToScorm
{
    class ScormBuilder
    {
        string ScormFile = "";
        Test Test;

        public ScormBuilder(Test Test, string ScormFile)
        {
            this.ScormFile = ScormFile;
            this.Test = Test;
        }

        public void CreateScorm()
        {
            // генерируем число которое будет именем каталога для нового скорм-пакета
            Random rnd = new Random(DateTime.Now.Millisecond);
            int rndval = rnd.Next(1000, 9999);
            // временный каталог для хранения нового скорм пакета
            string TempDir = Environment.AppTempDir + "\\" + rndval.ToString();
            // создаём новый временный каталог, если каталог с таким именем уже существует - удаляем его
            DirectoryInfo ScormDir = new DirectoryInfo(TempDir);
            if (ScormDir.Exists)
                ScormDir.Delete(true);
            ScormDir.Create();
            // в новом временном каталоге создаём каталог для хранения файлов теста
            DirectoryInfo TestDir = new DirectoryInfo(TempDir + "\\P1000");
            TestDir.Create();
            // записываем файлы с тестом во временный каталог
            Writer cspage = new Writer(Test, TempDir + "\\P1000", "page.htm");
            cspage.WritePage();
            Writer csimspage = new Writer(Test, TempDir + "\\P1000", "IMSPage.htm");
            csimspage.WriteIMSPage();
            // записываем файл манифеста во временный каталог
            Manifest manifest = new Manifest();
            manifest.Write(TempDir + "\\imsmanifest.xml");
            // записываем файл индекса во временный каталог
            Index index = new Index();
            index.Write(TempDir + "\\Index.xml", Test, Path.GetFileNameWithoutExtension(ScormFile));
            // записываем файл темы во временный каталог
            DirectoryInfo ThemeDir = new DirectoryInfo(TempDir + "\\Shared");
            if (ThemeDir.Exists)
                ThemeDir.Delete(true);
            ThemeDir.Create();
            Theme theme = new Theme();
            theme.Write(TempDir + "\\Shared\\themes.css");

            // упаковываем временный каталог в zip архив
            ToZipFile(TempDir, ScormFile);
            ScormDir.Delete(true);
        }

        void ToZipFile(string FolderName, string ZipName)
        {
            FastZip fz = new FastZip();
            fz.CreateEmptyDirectories = true;
            fz.CreateZip(ZipName, FolderName, true, "");
            fz = null;
        }
    }
}
