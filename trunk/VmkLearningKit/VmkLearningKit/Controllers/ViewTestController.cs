using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using ICSharpCode.SharpZipLib.Zip;
using System.IO;
using VmkLearningKit.Models.Repository;
using VmkLearningKit.Core;
using System.Collections;


namespace VmkLearningKit.Controllers
{
    [AuthorizeFilter(Roles = "Admin, Professor, Metodist")]
    public class ViewTestController : AbstractController
    {
        //
        // GET: /LookingTest/

        public ActionResult Index()
        {
            return View();
        }


        public ActionResult ViewTest(string alias, string additional)
        {

            AssignedTestVariant atv = repositoryManager.GetAssignedTestVariantRepository.GetById(Convert.ToInt64(additional));
            string filePath = atv.Path;
            FileInfo fileP = new FileInfo(filePath);
            if (!fileP.Exists) Utility.RedirectToErrorPage("Данного теста нет на сервере");

            long idStudent = atv.StudentId;
            int lastIndex = filePath.IndexOf("student_");
            string destP = filePath.Substring(0, lastIndex);
            string destPath = destP + "/Temp";

            DirectoryInfo folderTemp = new DirectoryInfo(destPath);
            if (!folderTemp.Exists)
                folderTemp.Create();
            //ArrayList inFolder=new ArrayList ();
            FileSystemInfo[] inFolder = folderTemp.GetFileSystemInfos();
            foreach (FileSystemInfo item in inFolder)
            {
                string qq = item.Attributes.ToString();
                if (qq == "Directory")
                {
                    // for(int i=0;i<item.G)
                    DirectoryInfo dir = new DirectoryInfo(item.FullName);
                    FileInfo[] fis = dir.GetFiles();
                    foreach (FileInfo f in fis)
                    {
                        f.Delete();
                    }
                }
                else
                {
                    item.Delete();
                }
            }
            FastZip fz = new FastZip();
            fz.ExtractZip(filePath, destPath, null);

            ViewData["testPath"] = "http://" + Request.Url.Authority.ToString() + "/Uploads/AssignedTests/Temp/P1000/page.htm";
            ViewData[Constants.PAGE_TITLE] = "Просмотр тестового варианта";
            ViewData["discipline"] = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(alias).Title;
            User student = repositoryManager.GetUserRepository.GetById(idStudent);
            ViewData["student"] = student.SecondName.ToString() + " " + student.FirstName.ToString() + " " + student.Patronymic.ToString();
            GeneratedTest gt = atv.GeneratedTestVariant.GeneratedTest;
            ViewData["topic"] = gt.SpecialityDisciplineTopic.Title;
            ViewData["group"] = student.Student.Group.Title;
            ViewData["generationInfo"] = gt.GeneratedDate;
            ViewData["test"] = atv;
            ViewData["themes"] = "http://" + Request.Url.Authority.ToString() + "/Uploads/AssignedTests/Temp/Shared/Themes.css";
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult SetMark(string alias, string mark)
        {   //if(Request.Is)
            bool flag = repositoryManager.GetAssignedTestVariantRepository.UpdateMark(Convert.ToInt64(alias), Convert.ToInt32(mark));
            string str = "";
            if (flag) str = "Оценка успешно изменена";
            else str = "Произошла ошибка во время изменения БД";
            return new JsonResult
            {
                ContentType = "text/html",
                Data = str
            };


        }

    }
}