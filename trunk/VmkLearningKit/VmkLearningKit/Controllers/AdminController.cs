using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using VmkLearningKit.Core;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Controllers
{
    [AuthorizeFilter(Roles = "Admin")]
    public class AdminController : AbstractController
    {
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Departments(string alias)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
            IEnumerable<Department> departments = repositoryManager.GetDepartmentRepository.GetAll();
            ViewData["Departments"] = departments;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Chairs(FormCollection form)
        {
            IEnumerable<Department> departments = null;
            Department department = null;
            IEnumerable<Chair> chairs = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;

                string departmentAlias = form["Departments"];

                departments = repositoryManager.GetDepartmentRepository.GetAll();
                if (null != departments)
                {
                    if (null != departmentAlias)
                    {
                        department = repositoryManager.GetDepartmentRepository.GetByAlias(departmentAlias);
                    }
                    if (null == department)
                    {
                        department = departments.First();
                    }
                    if (null != department)
                    {
                        chairs = repositoryManager.GetChairRepository.GetAll(department.Alias);
                    }
                }
                ViewData["Department"] = department;
                ViewData["Departments"] = departments;
                ViewData["Chairs"] = chairs;
            }
            catch (Exception ex)
            {
                Redirect("/Admin/Chairs");
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Chairs(string alias)
        {
            IEnumerable<Department> departments = null;
            Department department = null;
            IEnumerable<Chair> chairs = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;

                departments = repositoryManager.GetDepartmentRepository.GetAll();
                if (null != departments)
                {
                    department = departments.First();
                    if (null != department)
                    {
                        chairs = repositoryManager.GetChairRepository.GetAll(department.Alias);
                    }
                }
                ViewData["Department"] = department;
                ViewData["Departments"] = departments;
                ViewData["Chairs"] = chairs;
            }
            catch (Exception ex)
            {
                Utility.RedirectToErrorPage("AdminController.Specialities: catch exception", ex);
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult EducationPlans()
        {
            IEnumerable<EducationPlan> educationPlans = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;

                educationPlans = repositoryManager.GetEducationPlanRepository.GetAll();
                ViewData["EducationPlans"] = educationPlans;
            }
            catch (Exception ex)
            {
                Utility.RedirectToErrorPage("AdminController.EducationPlans: catch exception", ex);
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Specialities(FormCollection form)
        {
            IEnumerable<Department> departments = null;
            Department department = null;
            IEnumerable<Speciality> specialities = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;

                string departmentAlias = form["Departments"];

                departments = repositoryManager.GetDepartmentRepository.GetAll();
                if (null != departments)
                {
                    if (null != departmentAlias)
                    {
                        department = repositoryManager.GetDepartmentRepository.GetByAlias(departmentAlias);
                    }
                    if (null == department)
                    {
                        department = departments.First();
                    }
                    if (null != department)
                    {
                        specialities = repositoryManager.GetSpecialityRepository.GetAll(department.Alias);
                    }
                }
                ViewData["Department"] = department;
                ViewData["Departments"] = departments;
                ViewData["Specialities"] = specialities;
            }
            catch (Exception ex)
            {
                Redirect("/Admin/Specialities");
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Specialities(string alias)
        {
            IEnumerable<Department> departments = null;
            Department department = null;
            IEnumerable<Speciality> specialities = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;

                departments = repositoryManager.GetDepartmentRepository.GetAll();
                if (null != departments)
                {
                    department = departments.First();
                    if (null != department)
                    {
                        specialities = repositoryManager.GetSpecialityRepository.GetAll(department.Alias);
                    }
                }
                ViewData["Department"] = department;
                ViewData["Departments"] = departments;
                ViewData["Specialities"] = specialities;
            }
            catch (Exception ex)
            {
                Utility.RedirectToErrorPage("AdminController.Specialities: catch exception", ex);
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Specializations(FormCollection form)
        {
            IEnumerable<Department> departments = null;
            Department department = null;
            IEnumerable<Speciality> specialities = null;
            Speciality speciality = null;
            IEnumerable<EducationPlan> educationPlans = null;
            EducationPlan educationPlan = null;
            IEnumerable<Chair> chairs = null;
            Chair chair = null;
            IEnumerable<Specialization> specializations = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;

                string departmentAlias = form["Departments"];
                string specialityAlias = form["Specialities"];
                string educationPlanAlias = form["EducationPlans"];
                string chairAlias = form["Chairs"];

                departments = repositoryManager.GetDepartmentRepository.GetAll();
                if (null != departments)
                {
                    if (null != departmentAlias)
                    {
                        department = repositoryManager.GetDepartmentRepository.GetByAlias(departmentAlias);
                    }
                    if (null == department)
                    {
                        department = departments.First();
                    }
                    specialities = repositoryManager.GetSpecialityRepository.GetAll(department.Alias);
                    if (null != specialityAlias)
                    {
                        speciality = repositoryManager.GetSpecialityRepository.GetByAlias(specialityAlias);
                    }
                    if (null == speciality)
                    {
                        speciality = specialities.First();
                    }
                    educationPlans = repositoryManager.GetEducationPlanRepository.GetAll();
                    if (null != educationPlanAlias)
                    {
                        educationPlan = repositoryManager.GetEducationPlanRepository.GetByAlias(educationPlanAlias);
                    }
                    if (null == educationPlan)
                    {
                        educationPlan = educationPlans.First();
                    }
                    chairs = repositoryManager.GetChairRepository.GetAll(department.Alias);
                    if (null != chairAlias)
                    {
                        chair = repositoryManager.GetChairRepository.GetByAlias(chairAlias);
                    }
                    if (null == chair)
                    {
                        chair = chairs.First();
                    }
                    if (null != speciality && null != educationPlan && null != chair)
                    {
                        specializations = repositoryManager.GetSpecializationRepository.GetAll(speciality.Alias, educationPlan.Alias, chair.Alias);
                    }
                }
                ViewData["Department"] = department;
                ViewData["Departments"] = departments;
                ViewData["Speciality"] = speciality;
                ViewData["Specialities"] = specialities;
                ViewData["EducationPlan"] = educationPlan;
                ViewData["EducationPlans"] = educationPlans;
                ViewData["Chair"] = chair;
                ViewData["Chairs"] = chairs;
                ViewData["Specializations"] = specializations;
            }
            catch (Exception ex)
            {
                Redirect("/Admin/Specializations");
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Specializations(string alias)
        {
            IEnumerable<Department> departments = null;
            Department department = null;
            IEnumerable<Speciality> specialities = null;
            Speciality speciality = null;
            IEnumerable<EducationPlan> educationPlans = null;
            EducationPlan educationPlan = null;
            IEnumerable<Chair> chairs = null;
            Chair chair = null;
            IEnumerable<Specialization> specializations = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
                departments = repositoryManager.GetDepartmentRepository.GetAll();
                if (null != departments)
                {
                    department = departments.First();
                    specialities = repositoryManager.GetSpecialityRepository.GetAll(department.Alias);
                    if (null != specialities)
                    {
                        speciality = specialities.First();
                    }
                    educationPlans = repositoryManager.GetEducationPlanRepository.GetAll();
                    if (null != educationPlans)
                    {
                        educationPlan = educationPlans.First();
                    }
                    chairs = repositoryManager.GetChairRepository.GetAll(department.Alias);
                    if (null != chairs)
                    {
                        chair = chairs.First();
                    }
                    if (null != speciality && null != educationPlan && null != chair)
                    {
                        specializations = repositoryManager.GetSpecializationRepository.GetAll(speciality.Alias, educationPlan.Alias, chair.Alias);
                    }
                }
                ViewData["Department"] = department;
                ViewData["Departments"] = departments;
                ViewData["Speciality"] = speciality;
                ViewData["Specialities"] = specialities;
                ViewData["EducationPlan"] = educationPlan;
                ViewData["EducationPlans"] = educationPlans;
                ViewData["Chair"] = chair;
                ViewData["Chairs"] = chairs;
                ViewData["Specializations"] = specializations;
            }
            catch (Exception ex)
            {
                Utility.RedirectToErrorPage("AdminController.Specializations: catch exception", ex);
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult SpecialityDisciplines(FormCollection form)
        {
            IEnumerable<Department> departments = null;
            Department department = null;
            IEnumerable<Speciality> specialities = null;
            Speciality speciality = null;
            IEnumerable<EducationPlan> educationPlans = null;
            EducationPlan educationPlan = null;
            IEnumerable<Chair> chairs = null;
            Chair chair = null;
            IEnumerable<Professor> professors = null;
            Professor professor = null;
            IEnumerable<SpecialityDiscipline> specialityDisciplines = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;

                string departmentAlias = form["Departments"];
                string specialityAlias = form["Specialities"];
                string educationPlanAlias = form["EducationPlans"];
                string chairAlias = form["Chairs"];
                string professorNickName = form["Professors"];

                departments = repositoryManager.GetDepartmentRepository.GetAll();
                if (null != departments)
                {
                    if (null != departmentAlias)
                    {
                        department = repositoryManager.GetDepartmentRepository.GetByAlias(departmentAlias);
                    }
                    if (null == department)
                    {
                        department = departments.First();
                    }
                    specialities = repositoryManager.GetSpecialityRepository.GetAll(department.Alias);
                    if (null != specialityAlias)
                    {
                        speciality = repositoryManager.GetSpecialityRepository.GetByAlias(specialityAlias);
                    }
                    if (null == speciality)
                    {
                        speciality = specialities.First();
                    }
                    educationPlans = repositoryManager.GetEducationPlanRepository.GetAll();
                    if (null != educationPlanAlias)
                    {
                        educationPlan = repositoryManager.GetEducationPlanRepository.GetByAlias(educationPlanAlias);
                    }
                    if (null == educationPlan)
                    {
                        educationPlan = educationPlans.First();
                    }
                    chairs = repositoryManager.GetChairRepository.GetAll(department.Alias);
                    if (null != chairAlias)
                    {
                        chair = repositoryManager.GetChairRepository.GetByAlias(chairAlias);
                    }
                    if (null == chair)
                    {
                        chair = chairs.First();
                    }
                    if (null != chair)
                    {
                        professors = repositoryManager.GetProfessorRepository.GetAll(chair.Alias);
                        if (null != professorNickName)
                        {
                            professor = repositoryManager.GetProfessorRepository.GetByNickName(professorNickName);
                        }
                        if (null == professor)
                        {
                            professor = professors.First();
                        }
                    }
                    if (null != speciality && null != educationPlan && null != chair && null != professor)
                    {
                        specialityDisciplines = repositoryManager.GetSpecialityDisciplinesRepository.GetAll(speciality.Alias, educationPlan.Alias, chair.Alias, professor.User.NickName);
                    }
                }

                ViewData["Department"] = department;
                ViewData["Departments"] = departments;
                ViewData["Speciality"] = speciality;
                ViewData["Specialities"] = specialities;
                ViewData["EducationPlan"] = educationPlan;
                ViewData["EducationPlans"] = educationPlans;
                ViewData["Chair"] = chair;
                ViewData["Chairs"] = chairs;
                ViewData["Professors"] = professors;
                ViewData["Professor"] = professor;
                ViewData["SpecialityDisciplines"] = specialityDisciplines;
            }
            catch (Exception ex)
            {
                Redirect("/Admin/SpecialityDisciplines");
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult SpecialityDisciplines(string alias)
        {
            IEnumerable<Department> departments = null;
            Department department = null;
            IEnumerable<Speciality> specialities = null;
            Speciality speciality = null;
            IEnumerable<EducationPlan> educationPlans = null;
            EducationPlan educationPlan = null;
            IEnumerable<Chair> chairs = null;
            Chair chair = null;
            IEnumerable<Professor> professors = null;
            Professor professor = null;
            IEnumerable<SpecialityDiscipline> specialityDisciplines = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
                departments = repositoryManager.GetDepartmentRepository.GetAll();
                if (null != departments)
                {
                    department = departments.First();
                    specialities = repositoryManager.GetSpecialityRepository.GetAll(department.Alias);
                    if (null != specialities)
                    {
                        speciality = specialities.First();
                    }
                    educationPlans = repositoryManager.GetEducationPlanRepository.GetAll();
                    if (null != educationPlans)
                    {
                        educationPlan = educationPlans.First();
                    }
                    chairs = repositoryManager.GetChairRepository.GetAll(department.Alias);
                    if (null != chairs)
                    {
                        chair = chairs.First();
                    }
                    if (null != chair)
                    {
                        professors = repositoryManager.GetProfessorRepository.GetAll(chair.Alias);
                        if (null != professors)
                        {
                            professor = professors.First();
                        }
                    }
                    if (null != speciality && null != educationPlan && null != chair && null != professor)
                    {
                        specialityDisciplines = repositoryManager.GetSpecialityDisciplinesRepository.GetAll(speciality.Alias, educationPlan.Alias, chair.Alias, professor.User.NickName);
                    }
                }
                ViewData["Department"] = department;
                ViewData["Departments"] = departments;
                ViewData["Speciality"] = speciality;
                ViewData["Specialities"] = specialities;
                ViewData["EducationPlan"] = educationPlan;
                ViewData["EducationPlans"] = educationPlans;
                ViewData["Chair"] = chair;
                ViewData["Chairs"] = chairs;
                ViewData["Professors"] = professors;
                ViewData["Professor"] = professor;
                ViewData["SpecialityDisciplines"] = specialityDisciplines;
            }
            catch (Exception ex)
            {
                Utility.RedirectToErrorPage("AdminController.SpecialityDisciplines: catch exception", ex);
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Users()
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Students()
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Professors()
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Metodists()
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Groups()
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
            return View();
        }

    }
}
