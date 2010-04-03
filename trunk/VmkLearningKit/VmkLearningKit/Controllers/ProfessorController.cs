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
    public class ProfessorController : AbstractController
    {
        /// <summary>
        /// ќтображение страницы преподавател€
        /// </summary>
        /// <param name="alias">NickName преподавател€</param>
        /// <param name="additional">ƒополнительное действие: About, Disciplines</param>
        public ActionResult Page(string alias, string additional)
        {
            if (null != alias && !alias.Trim().Equals(String.Empty))
            {
                GeneralMenu();
                ViewData[Constants.MENU_TYPE] = Constants.PROFESSOR_MENU;
                Professor professor = repositoryManager.GetProfessorRepository.GetByNickName(alias);
                if (null != professor)
                {
                    ViewData["Professor"] = professor;
                    ViewData[Constants.PAGE_TITLE] = professor.Chair.Title;
                    ViewData[Constants.ACTION] = additional;
                    if (null != additional && !additional.Trim().Equals(String.Empty))
                    {
                        SpecialityDiscipline specialityDiscipline = repositoryManager.GetSpecialityDisciplinesRepository.GetByAlias(additional);
                        if (null != specialityDiscipline)
                        {
                            ViewData["SpecialityDiscipline"] = specialityDiscipline;
                        }
                        else
                        {
                            Utility.RedirectToErrorPage("ProfessorController.Page: specialityDiscipline is null");
                        }
                    }
                }
                else
                {
                    Utility.RedirectToErrorPage("ProfessorController.Page: professor is null");
                }
            }
            else
            {
                Utility.RedirectToErrorPage("ProfessorController.Page: professorNickName is null");
            }
            return View();
        }
    }
}
