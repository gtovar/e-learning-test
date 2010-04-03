using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using VmkLearningKit.Models.Repository;
using VmkLearningKit.Core;

namespace VmkLearningKit.Controllers
{
    public class CabinetController : Controller
    {
        /// <summary>
        /// Action, ������������ ����� �������� �������������� ��� ��������� � domain.ru/Cabinet/Administrator
        /// </summary>
        [AuthorizeFilter(Roles = "Admin")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Admin()
        {
            return View();
        }

        /// <summary>
        /// Action, ������������ ����� �������� ��������� ��� ��������� � domain.ru/Cabinet/Metodist
        /// </summary>
        [AuthorizeFilter(Roles = "Metodist")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Metodist()
        {
            return View();
        }

        /// <summary>
        /// Action, ������������ ����� �������� ������������� ��� ��������� � domain.ru/Cabinet/Professor
        /// </summary>
        [AuthorizeFilter(Roles = "Professor")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Professor()
        {
            return View();
        }

        /// <summary>
        /// Action, ������������ ����� �������� ������������� ��� ��������� � domain.ru/Cabinet/Student
        /// </summary>
        [AuthorizeFilter(Roles = "Student")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Student()
        {
            return View();
        }

    }
}
