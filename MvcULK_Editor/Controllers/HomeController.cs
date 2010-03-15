using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcULK_Editor.Models;

namespace MvcULK_Editor.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        private RepositoryManager repositoryManager;

        public HomeController(RepositoryManager _repositoryManager)
        {
            repositoryManager = _repositoryManager;
        }

        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
