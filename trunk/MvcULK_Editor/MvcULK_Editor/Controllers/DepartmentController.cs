using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using MvcULK_Editor.Models;

namespace MvcULK_Editor.Controllers
{
    public class DepartmentController : Controller
    {
        private RepositoryManager repositoryManager;

        public DepartmentController(RepositoryManager _repositoryManager)
        {
            repositoryManager = _repositoryManager;
        }
        
        //
        // GET: /Department/

        public ActionResult Index()
        {
            ViewData["Title"] = "Список факультетов";

            ViewData["Departments"] = repositoryManager.departmentRepository.GetAll();

            return View();
        }

        //
        // GET: /Department/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Department/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Department/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Department/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Department/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
