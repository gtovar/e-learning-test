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
    public class SpecialityDisciplineProgramController : AbstractController
    {
        
        protected RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
        //
        // GET: /EditSpecialityDisciplineProgram/


        [AcceptVerbs(HttpVerbs.Get)]
         public ActionResult Index( string alias)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            if ("" != alias)
            {
                var discipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(alias);
                SpecialityDisciplineProgram progpam = repositoryManager.GetSpecialityDisciplineProgramRepository.GetById(discipline.Id);   //.GetSpecialityDisciplineRepository.GetByAlias(additional);
                ViewData["discipline"] = discipline;
                ViewData["disciplineProgram"] = progpam;

                if (Session["UserAuth"] != null && ((bool)Session["UserAuth"]) == true && Session["UserName"] != null &&
                Session["User"] != null)
                {
                    var tmp = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName;
                    IEnumerable<SpecialityDiscipline> disciplines = repositoryManager.GetSpecialityDisciplineRepository.GetAllByProfessor(tmp);
                    if (null != disciplines)
                    {
                        foreach (SpecialityDiscipline item in disciplines)
                        {
                            if (item.Id == discipline.Id)
                            {
                                ViewData["isEdit"] = 1;
                            }
                        }
                    }
                }

            }
            return View();
        }

        //
        // GET: /EditSpecialityDisciplineProgram/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /EditSpecialityDisciplineProgram/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /EditSpecialityDisciplineProgram/Create

        [HttpPost]
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
        // GET: /EditSpecialityDisciplineProgram/Edit/5

        [AuthorizeFilter(Roles = "Admin, Professor, Metodist")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            if (id>=0)
            {
                var discipline = repositoryManager.GetSpecialityDisciplineRepository.GetById(id);
                SpecialityDisciplineProgram progpam = repositoryManager.GetSpecialityDisciplineProgramRepository.GetById(id);  
                ViewData["discipline"] = discipline;
                ViewData["disciplineProgram"] = progpam;

                if (Session["UserAuth"] != null && ((bool)Session["UserAuth"]) == true && Session["UserName"] != null &&
                Session["User"] != null)
                {
                    var tmp = ((VmkLearningKit.Models.Domain.User)Session["User"]).DbUser.NickName;
                    IEnumerable<SpecialityDiscipline> disciplines = repositoryManager.GetSpecialityDisciplineRepository.GetAllByProfessor(tmp);
                    if (null != disciplines)
                    {
                        foreach (SpecialityDiscipline item in disciplines)
                        {
                            if (item.Id == discipline.Id)
                            {
                                ViewData["isEdit"] = 1;
                            }
                        }
                    }
                }

            }
            return View();
        }

        //
        // POST: /EditSpecialityDisciplineProgram/Edit/5

        [HttpPost]
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

        //
        // GET: /EditSpecialityDisciplineProgram/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /EditSpecialityDisciplineProgram/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
