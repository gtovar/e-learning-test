using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VmkLearningKit.Models.Repository;
using VmkLearningKit.Core;

namespace VmkLearningKit.Controllers
{
    abstract public class AbstractController : Controller
    {
        protected RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

        protected void GeneralMenu()
        {
            IEnumerable<Speciality> specialities = null;
            IEnumerable<Chair> chairs = null;
            IEnumerable<EducationPlan> educationPlans = null;
            
            try
            {
                ISpecialityRepository specialityRepository = repositoryManager.GetSpecialityRepository;
                specialities = specialityRepository.GetAll(Constants.VMK_DEPARTMENT_TITLE);

                IChairRepository chairRepository = repositoryManager.GetChairRepository;
                chairs = chairRepository.GetAll(Constants.VMK_DEPARTMENT_TITLE);

                IEducationPlanRepository educationPlanRepository = repositoryManager.GetEducationPlanRepository;
                educationPlans = educationPlanRepository.GetAll();
            }
            catch (Exception ex)
            {
                Utility.RedirectToErrorPage("AbstractController.GeneralMenu: catch exception", ex);
            }
             
            ViewData["Chairs"] = chairs;
            ViewData["Specialities"] = specialities;
            ViewData["EducationPlans"] = educationPlans;
            ViewData[Constants.MENU_TYPE] = Constants.GENERAL_MENU;
            ViewData[Constants.PAGE_TITLE] = Messages.MAIN_TITLE;
        }
    }
}
