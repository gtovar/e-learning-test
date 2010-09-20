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
using System.Configuration;


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
            GeneralMenu();
            AssignedTestVariant atv = repositoryManager.GetAssignedTestVariantRepository.GetById(Convert.ToInt64(additional));
         
            long idStudent = atv.StudentId;

            ViewData["testPath"] = ConfigurationManager.AppSettings["webPlayerUrl"].ToString()+"/Start.aspx?mode=grading&key=" + atv.ProfessorKey.ToString();
                  //+ Request.Url.Authority.ToString() + "/Uploads/AssignedTests/Temp/P1000/page.htm";
             ViewData[Constants.PAGE_TITLE] = "Просмотр тестового варианта";
             ViewData["discipline"] = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(alias).Title;
             User student = repositoryManager.GetUserRepository.GetById(idStudent);
             ViewData["student"] = student.SecondName.ToString() + " " + student.FirstName.ToString() + " " + student.Patronymic.ToString();
             GeneratedTest gt = atv.GeneratedTestVariant.GeneratedTest;
             ViewData["topic"] = gt.SpecialityDisciplineTopic.Title;
             ViewData["group"] = student.Student.Group.Title;
             ViewData["generationInfo"] = gt.GeneratedDate;
             ViewData["test"] = atv;
          //   ViewData["themes"] = "http://" + Request.Url.Authority.ToString() + "/Uploads/AssignedTests/Temp/Shared/Themes.css";
             return View("ViewTestData");
            
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