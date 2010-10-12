using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.IO;
using VmkLearningKit.Core;
using VmkLearningKit.Models.Repository;
using VmkLearningKit.Core.XmlConverter;

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
        public ActionResult Departments(string alias, string additional)
        {
            try
            {
            IEnumerable<Department> departments = null;
            Department department = null;
            
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
                if (null != alias && !alias.Trim().Equals(String.Empty))
                {   ViewData["type_partial"] = "Dapartments";
                    switch (alias)
                    {
                        case "Add":
                            {                                
                                Department newDepartment=new Department ();
                                return View(Constants.ADMIN_DEPARTMENT_VIEWS + "Add.aspx", newDepartment);
                            };break;

                        case "Edit":
                            {
                                if (null != additional && !additional.Trim().Equals(String.Empty))
                                department = repositoryManager.GetDepartmentRepository.GetByAlias(additional);
                                return View(Constants.ADMIN_DEPARTMENT_VIEWS + "Edit.aspx", department);
                            };break;

                        case "Delete": 
                            {
                                if (null != additional && !additional.Trim().Equals(String.Empty))
                                {
                                    department = repositoryManager.GetDepartmentRepository.GetByAlias(additional);
                                    repositoryManager.GetDepartmentRepository.Delete(department); 
                                    return Redirect("/Admin/Departments");                                                                      
                                };
                            };
                            break;
                    }
                }
                departments = repositoryManager.GetDepartmentRepository.GetAll();
                ViewData["Departments"] = departments;
                return View(Constants.ADMIN_DEPARTMENT_VIEWS + "Departments.aspx");
            }
            catch (Exception ex)
            {
                Utility.RedirectToErrorPage("AdminController.departments: catch exception", ex);
                ViewData["Error"] = ex;
                return View("/Views/Admin/Error.aspx");
            }
            
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Chairs(string alias, string additional, string param1, Chair chair,FormCollection form)
        {
            IEnumerable<Department> departments = null;
            Department department = null;
            IEnumerable<Chair> chairs = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
                string departmentAlias = form["Departments"];
                if (alias != null && additional != null && !alias.Trim().Equals(String.Empty) && !additional.Trim().Equals(String.Empty))
                {
                    {
                        if (form["chairAlias"] == "") chair.Alias = null;
                        else chair.Alias = form["chairAlias"];
                        chair.DepartmentId = repositoryManager.GetDepartmentRepository.GetByAlias(additional).Id;
                        if (chair.Alias == null)
                            ModelState.AddModelError("Alias", "*Алиас кафедры обязательный параметр");

                        if (chair.Abbreviation == null)
                            ModelState.AddModelError("Abbreviation", "*Аббревиатура обязательный параметр");
                        if (chair.Title == null)
                            ModelState.AddModelError("Title", "*Название кафедры обязательный параметр");

                        switch (alias)
                        {
                            case "Add":
                                {
                                    if (ModelState.IsValid)
                                    {
                                        repositoryManager.GetChairRepository.Add(chair);
                                        return Redirect("/Admin/Chairs/");
                                    }
                                    else return View(Constants.ADMIN_CHAIR_VIEWS + "Add.aspx", chair);
                                }

                            case "Edit":
                                {
                                    if (ModelState.IsValid && param1 != null)
                                    {
                                        repositoryManager.GetChairRepository.UpdateByAlias(param1, chair);
                                        return Redirect("/Admin/Chairs/");
                                    }
                                    else return View(Constants.ADMIN_CHAIR_VIEWS + "Edit.aspx", chair);
                                }
                         }
                    }
                }
                
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
            return View(Constants.ADMIN_CHAIR_VIEWS + "Chairs.aspx");
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Chairs(string alias,string additional,string param1)
        {
            Chair chair = null;
            IEnumerable<Department> departments = null;
            Department department = null;
            IEnumerable<Chair> chairs = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;

                departments = repositoryManager.GetDepartmentRepository.GetAll();
                if (null != alias && !alias.Trim().Equals(String.Empty) && additional != null && !additional.Trim().Equals(String.Empty))
                {
                    department=repositoryManager.GetDepartmentRepository.GetByAlias(additional);
                    ViewData["type_partial"] = "Chairs";
                    switch (alias)
                    {
                        case "Add":
                            {
                                Chair newChair = new Chair();
                                return View(Constants.ADMIN_CHAIR_VIEWS + "Add.aspx", newChair);
                            }; break;

                        case "Edit":
                            {
                                if (null != param1 && !param1.Trim().Equals(String.Empty))
                                    chair = repositoryManager.GetChairRepository.GetByAliasAndDepartment(param1, department.Id);
                                return View(Constants.ADMIN_CHAIR_VIEWS + "Edit.aspx", chair);
                            }; break;

                        case "Delete":
                            {
                                if (null != additional && !additional.Trim().Equals(String.Empty))
                                {
                                    if (null != param1 && !param1.Trim().Equals(String.Empty))
                                        chair = repositoryManager.GetChairRepository.GetByAliasAndDepartment(param1, department.Id);
                                    repositoryManager.GetChairRepository.Delete(chair);
                                    return Redirect("/Admin/Chairs");
                                };
                            };
                            break;
                    }
                }
                
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
            return View(Constants.ADMIN_CHAIR_VIEWS + "Chairs.aspx");
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult EducationPlans(string alias, string additional)
        {
            IEnumerable<EducationPlan> educationPlans = null;
            EducationPlan educationPlan = new EducationPlan();
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
                if (null != alias && !alias.Trim().Equals(String.Empty))
                {
                    ViewData["type_partial"] = "EducationPlans";
                    switch (alias)
                    {
                        case "Add":
                            {
                                EducationPlan newEducationPlan = new EducationPlan();
                                return View(Constants.ADMIN_EDUCATION_PLAN_VIEWS + "Add.aspx", newEducationPlan);
                            }; break;

                        case "Edit":
                            {
                                if (null != additional && !additional.Trim().Equals(String.Empty))
                                    educationPlan = repositoryManager.GetEducationPlanRepository.GetByAlias(additional);
                                return View(Constants.ADMIN_EDUCATION_PLAN_VIEWS + "Edit.aspx", educationPlan);
                            }; break;

                        case "Delete":
                            {
                                if (null != additional && !additional.Trim().Equals(String.Empty))
                                {
                                    educationPlan = repositoryManager.GetEducationPlanRepository.GetByAlias(additional);
                                    repositoryManager.GetEducationPlanRepository.Delete(educationPlan);
                                    return Redirect("/Admin/EducationPlans");
                                };
                            };
                            break;
                    }
                }


                educationPlans = repositoryManager.GetEducationPlanRepository.GetAll();
                ViewData["EducationPlans"] = educationPlans;
            }
            catch (Exception ex)
            {
                Utility.RedirectToErrorPage("AdminController.EducationPlans: catch exception", ex);
            }
            return View(Constants.ADMIN_EDUCATION_PLAN_VIEWS + "EducationPlans.aspx");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Specialities(string alias, string additional, string param1, Speciality speciality, FormCollection form)
        {
            IEnumerable<Department> departments = null;
            Department department = null;
            IEnumerable<Speciality> specialities = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;

                string departmentAlias = form["Departments"];
                if (alias != null && additional != null && !alias.Trim().Equals(String.Empty) && !additional.Trim().Equals(String.Empty))
                {
                        if (form["specialityAlias"] == "") speciality.Alias = null;
                        else speciality.Alias = form["specialityAlias"];
                        speciality.DepartmentId = repositoryManager.GetDepartmentRepository.GetByAlias(additional).Id;
                        if (speciality.Alias == null)
                            ModelState.AddModelError("Alias", "*Алиас специальности обязательный параметр");

                        if (speciality.Abbreviation == null)
                            ModelState.AddModelError("Abbreviation", "*Аббревиатура специальности обязательный параметр");
                        if (speciality.Title == null)
                            ModelState.AddModelError("Title", "*Название специальности обязательный параметр");
                        if (speciality.Code == null)
                            ModelState.AddModelError("Code", "*Код специальности обязательный параметр");

                        switch (alias)
                        {
                            case "Add":
                                {
                                    if (ModelState.IsValid)
                                    {
                                        repositoryManager.GetSpecialityRepository.Add(speciality);
                                        return Redirect("/Admin/Specialities/");
                                    }
                                    else return View(Constants.ADMIN_SPECIALITY_VIEWS + "Add.aspx", speciality);

                                }

                            case "Edit":
                                {

                                    if (ModelState.IsValid && param1 != null)
                                    {
                                        repositoryManager.GetSpecialityRepository.UpdateByAlias(param1, speciality);
                                        return Redirect("/Admin/Specialities/");
                                    }
                                    else return View(Constants.ADMIN_SPECIALITY_VIEWS + "Edit.aspx", speciality);

                                }

                        
                    }
                }
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
            return View(Constants.ADMIN_SPECIALITY_VIEWS + "Specialities.aspx");
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Specialities(string alias, string additional, string param1)
        {
            Speciality speciality = null;
            IEnumerable<Department> departments = null;
            Department department = null;
            IEnumerable<Speciality> specialities = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;

                departments = repositoryManager.GetDepartmentRepository.GetAll();
                if (null != alias && !alias.Trim().Equals(String.Empty) && additional != null && !additional.Trim().Equals(String.Empty))
                {
                    department = repositoryManager.GetDepartmentRepository.GetByAlias(additional);
                    ViewData["type_partial"] = "Specialities";
                    switch (alias)
                    {
                        case "Add":
                            {
                                Speciality newSpeciality = new Speciality();
                                return View(Constants.ADMIN_SPECIALITY_VIEWS + "Add.aspx", newSpeciality);
                            }; break;

                        case "Edit":
                            {
                                if (null != param1 && !param1.Trim().Equals(String.Empty))
                                    speciality = repositoryManager.GetSpecialityRepository.GetByAliasAndDepartment(param1,department.Id);
                                return View(Constants.ADMIN_SPECIALITY_VIEWS + "Edit.aspx", speciality);
                            }; break;

                        case "Delete":
                            {
                                if (null != additional && !additional.Trim().Equals(String.Empty))
                                {
                                    if (null != param1 && !param1.Trim().Equals(String.Empty))
                                        speciality = repositoryManager.GetSpecialityRepository.GetByAliasAndDepartment(param1, department.Id);
                                    repositoryManager.GetSpecialityRepository.Delete(speciality);
                                    return Redirect("/Admin/Specialities");
                                };
                            };
                            break;
                    }
                }
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
            return View(Constants.ADMIN_SPECIALITY_VIEWS + "Specialities.aspx");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Specializations(string alias, string additional, string param1, Specialization specialization, FormCollection form)
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
            Specialization specializationsTmp = null;
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
                    if (alias.Trim() == "Add" && (additional != null && !additional.Trim().Equals(String.Empty)))
                        department = repositoryManager.GetDepartmentRepository.GetByAlias(additional);
                    else if (null != alias && !alias.Trim().Equals(String.Empty) && (additional == null || additional.Trim().Equals(String.Empty)))
                        department = repositoryManager.GetDepartmentRepository.GetByAlias(alias);
                    else department = departments.First();
                    if (null != departmentAlias)
                    {
                        department = repositoryManager.GetDepartmentRepository.GetByAlias(departmentAlias);
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
                if (alias != null && additional != null && !alias.Trim().Equals(String.Empty) && !additional.Trim().Equals(String.Empty))
                {

                    if (form["specializationAlias"] == "") specialization.Alias = null;
                    else specialization.Alias = form["specializationAlias"];
                    specialization.EducationPlanId= Convert.ToInt64(form["educationPlanId"]);

                    specialization.ChairId = Convert.ToInt64(form["ChairId"]);
                    specialization.SpecialityId = Convert.ToInt64(form["SpecialityId"]);
                    chair = repositoryManager.GetChairRepository.GetById(Convert.ToInt64(form["ChairId"]));
                    

                    if (specialization.Alias == null)
                        ModelState.AddModelError("Alias", "*Алиас специализации обязательный параметр");

                    if (specialization.Abbreviation == null)
                        ModelState.AddModelError("Abbreviation", "*Аббревиатура специализации обязательный параметр");
                    if (specialization.Title == null)
                        ModelState.AddModelError("Title", "*Название специализации обязательный параметр");
                    if (specialization.Code == null)
                        ModelState.AddModelError("Code", "*Код специализации обязательный параметр");
                    
                    switch (alias)
                    {
                        case "Add":
                            {
                                if (ModelState.IsValid)
                                {
                                    repositoryManager.GetSpecializationRepository.Add(specialization);
                                    return Redirect("/Admin/Specializations/");
                                }
                                else return View(Constants.ADMIN_SPECIALIZATION_VIEWS + "Add.aspx", specialization);

                            }

                        case "Edit":
                            {
                                if (ModelState.IsValid && param1 != null)
                                {
                                    specializationsTmp = repositoryManager.GetSpecializationRepository.GetByAliasAndChair(param1, chair.Id);
                                    repositoryManager.GetSpecializationRepository.UpdateById(specializationsTmp.Id, specialization);
                                    return Redirect("/Admin/Specializations/");
                                }
                                else return View(Constants.ADMIN_SPECIALIZATION_VIEWS + "Edit.aspx", specialization);
                            }
                      }
                }
   
            }
            catch (Exception ex)
            {
                Redirect("/Admin/Specializations");
            }
            return View(Constants.ADMIN_SPECIALIZATION_VIEWS + "Specializations.aspx");
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Specializations(string alias, string additional, string param1)
        {
            IEnumerable<Department> departments = null;
            Department department=null;
            
            IEnumerable<Speciality> specialities = null;
            Speciality speciality = null;

            IEnumerable<EducationPlan> educationPlans = null;
            EducationPlan educationPlan = null;
            
            IEnumerable<Chair> chairs = null;
            Chair chair = null;
            IEnumerable<Specialization> specializations = null;
            Specialization specialization=null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
                departments = repositoryManager.GetDepartmentRepository.GetAll();
                if (null != departments)
                {
                    if(alias.Trim()=="Add" && (additional!= null && !additional.Trim().Equals(String.Empty)))
                        department=repositoryManager.GetDepartmentRepository.GetByAlias(additional);
                    else if (null != alias && !alias.Trim().Equals(String.Empty) && (additional == null || additional.Trim().Equals(String.Empty)))
                        department = repositoryManager.GetDepartmentRepository.GetByAlias(alias);
                    else department = departments.First();
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

               if (null != alias && !alias.Trim().Equals(String.Empty) && additional != null && !additional.Trim().Equals(String.Empty))
                {
                    chair  = repositoryManager.GetChairRepository.GetByAlias(additional);
                    ViewData["type_partial"] = "Specializations";
                    switch (alias)
                    {
                       case "Add":
                            {
                                Specialization newSpecialization = new Specialization();
                                return View(Constants.ADMIN_SPECIALIZATION_VIEWS + "Add.aspx", newSpecialization);
                            }; break;
                       

                        case "Edit":
                            {
                                if (null != param1 && !param1.Trim().Equals(String.Empty))
                                {
                                    specialization = repositoryManager.GetSpecializationRepository.GetByAliasAndChair(param1, chair.Id);
                                    ViewData["EducationPlan"] = specialization.EducationPlan;
                                    ViewData["Speciality"] = specialization.Speciality;
                                    ViewData["Chair"] = specialization.Chair;
                                }
                                return View(Constants.ADMIN_SPECIALIZATION_VIEWS + "Edit.aspx", specialization);
                            }; break;

                        case "Delete":
                            {
                                if (null != additional && !additional.Trim().Equals(String.Empty))
                                {
                                    if (null != param1 && !param1.Trim().Equals(String.Empty))
                                        specialization = repositoryManager.GetSpecializationRepository.GetByAliasAndChair(param1, chair.Id);
                                    repositoryManager.GetSpecializationRepository.Delete(specialization);
                                    return Redirect("/Admin/Specializations");
                                };
                            };
                            break;
                    }
                }
                           
            }
            catch (Exception ex)
            {
                Utility.RedirectToErrorPage("AdminController.Specializations: catch exception", ex);
            }
            return View(Constants.ADMIN_SPECIALIZATION_VIEWS + "Specializations.aspx");
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
                        if (null == professor || professor.ChairId != chair.Id)
                        {
                            professor = professors.First();
                        }
                    }
                    if (null != speciality && null != educationPlan && null != chair && null != professor)
                    {
                        specialityDisciplines = repositoryManager.GetSpecialityDisciplineRepository.GetAll(speciality.Alias, educationPlan.Alias, chair.Alias, professor.User.NickName);
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
            return View(Constants.ADMIN_SPECIALITY_DISCIPLINE_VIEWS + "SpecialityDisciplines.aspx");
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
                        specialityDisciplines = repositoryManager.GetSpecialityDisciplineRepository.GetAll(speciality.Alias, educationPlan.Alias, chair.Alias, professor.User.NickName);
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
            return View(Constants.ADMIN_SPECIALITY_DISCIPLINE_VIEWS + "SpecialityDisciplines.aspx");
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Users()
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
            return View(Constants.ADMIN_USER_VIEWS + "Users.aspx");
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Groups()
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
            return View(Constants.ADMIN_GROUP_VIEWS + "Groups.aspx");
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult XmlParse()
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = "Загрузка образовательных документов";
            ViewData["Nickname"] = ((VmkLearningKit.Models.Domain.User)Session[Constants.SESSION_USER]).DbUser.NickName;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult XmlParse(string alias, FormCollection form)
        {
            try
            {
                foreach (string inputTagName in Request.Files)
                {
                    HttpPostedFileBase file     = Request.Files[inputTagName];

                    if (file.ContentLength > 0 && file.FileName.EndsWith(".xml"))
                    {
                        XmlAbstractParser abstractParser;

                        string xmlName = String.Empty;

                        switch (alias)
                        {
                            case VLKConstants.XML_UPLOAD_ALIAS_CHAIRS:
                                {
                                    string xmlPath      = HttpContext.Server.MapPath("/Uploads/Xml/Chairs");
                                    string xmlSchema    = HttpContext.Server.MapPath("/Core/XmlConverter/XmlSchemas/XMLSchemaChairs.xsd");
                                    
                                    DirectoryInfo targetDir = new DirectoryInfo(xmlPath);                                 
                                    long xmlIndex           = targetDir.GetFiles("*.xml").Length;
                                    xmlName          = xmlPath + "\\" + xmlIndex.ToString() + ".xml";
                                    file.SaveAs(xmlName);

                                    abstractParser = new XmlChairsParser(xmlSchema);
                                    
                                    break;
                                }
                            case VLKConstants.XML_UPLOAD_ALIAS_TEACHERS:
                                {
                                    string xmlPath      = HttpContext.Server.MapPath("/Uploads/Xml/Teachers");
                                    string xmlSchema    = HttpContext.Server.MapPath("/Core/XmlConverter/XmlSchemas/XMLSchemaTeachers.xsd");
                                    
                                    DirectoryInfo targetDir = new DirectoryInfo(xmlPath);
                                    long xmlIndex           = targetDir.GetFiles("*.xml").Length;
                                    xmlName          = xmlPath + "\\" + xmlIndex.ToString() + ".xml";
                                    file.SaveAs(xmlName);

                                    abstractParser = new XmlTeachersParser(xmlSchema);
                                    
                                    break;
                                }
                            case VLKConstants.XML_UPLOAD_ALIAS_STUDENTS:
                                {
                                    string xmlPath      = HttpContext.Server.MapPath("/Uploads/Xml/Students");
                                    string xmlSchema    = HttpContext.Server.MapPath("/Core/XmlConverter/XmlSchemas/XMLSchemaStudents.xsd");

                                    DirectoryInfo targetDir = new DirectoryInfo(xmlPath);
                                    long xmlIndex = targetDir.GetFiles("*.xml").Length;
                                    xmlName = xmlPath + "\\" + xmlIndex.ToString() + ".xml";
                                    file.SaveAs(xmlName);

                                    abstractParser = new XmlStudentsParser(xmlSchema);
                                    
                                    break;
                                }
                            case VLKConstants.XML_UPLOAD_ALIAS_GROUPS:
                                {
                                    string xmlPath = HttpContext.Server.MapPath("/Uploads/Xml/Groups");
                                    string xmlSchema = HttpContext.Server.MapPath("/Core/XmlConverter/XmlSchemas/XMLSchemaGroups.xsd");

                                    DirectoryInfo targetDir = new DirectoryInfo(xmlPath);
                                    long xmlIndex = targetDir.GetFiles("*.xml").Length;
                                    xmlName = xmlPath + "\\" + xmlIndex.ToString() + ".xml";
                                    file.SaveAs(xmlName);

                                    abstractParser = new XmlGroupsParser(xmlSchema);
                                    
                                    break;
                                }
                            case VLKConstants.XML_UPLOAD_ALIAS_SPECIALITIES:
                                {
                                    string xmlPath = HttpContext.Server.MapPath("/Uploads/Xml/Specialities");
                                    string xmlSchema = HttpContext.Server.MapPath("/Core/XmlConverter/XmlSchemas/XMLSchemaSpecialities.xsd");

                                    DirectoryInfo targetDir = new DirectoryInfo(xmlPath);
                                    long xmlIndex = targetDir.GetFiles("*.xml").Length;
                                    xmlName = xmlPath + "\\" + xmlIndex.ToString() + ".xml";
                                    file.SaveAs(xmlName);

                                    abstractParser = new XmlSpecialitiesParser(xmlSchema);
                                    
                                    break;
                                }
                            case VLKConstants.XML_UPLOAD_ALIAS_EDUCATION_PLAN:
                                {
                                    string xmlPath = HttpContext.Server.MapPath("/Uploads/Xml/EducationPlans");
                                    string xmlSchema = HttpContext.Server.MapPath("/Core/XmlConverter/XmlSchemas/XMLSchemaEducationPlan.xsd");

                                    DirectoryInfo targetDir = new DirectoryInfo(xmlPath);
                                    long xmlIndex = targetDir.GetFiles("*.xml").Length;
                                    xmlName = xmlPath + "\\" + xmlIndex.ToString() + ".xml";
                                    file.SaveAs(xmlName);

                                    abstractParser = new XmlEducationPlanParser(xmlSchema);
                                    
                                    break;
                                }
                            case VLKConstants.XML_UPLOAD_ALIAS_SHEDULE:
                                {
                                    string xmlPath      = HttpContext.Server.MapPath("/Uploads/Xml/Shedules");
                                    string xmlSchema    = HttpContext.Server.MapPath("/Core/XmlConverter/XmlSchemas/XMLSchemaShedule.xsd");

                                    DirectoryInfo targetDir = new DirectoryInfo(xmlPath);
                                    long xmlIndex   = targetDir.GetFiles("*.xml").Length;
                                    xmlName  = xmlPath + "\\" + xmlIndex.ToString() + ".xml";
                                    file.SaveAs(xmlName);

                                    abstractParser = new XmlSheduleParser(xmlSchema);
                                    
                                    break;
                                }
                            case VLKConstants.XML_UPLOAD_ALIAS_DISCIPLINE_PROGRAM:
                                {
                                    string xmlPath      = HttpContext.Server.MapPath("/Uploads/Xml/DisciplinePrograms");
                                    string xmlSchema    = HttpContext.Server.MapPath("/Core/XmlConverter/XmlSchemas/XMLSchemaDisciplineProgram.xsd");

                                    DirectoryInfo targetDir = new DirectoryInfo(xmlPath);
                                    long xmlIndex = targetDir.GetFiles("*.xml").Length;
                                    xmlName = xmlPath + "\\" + xmlIndex.ToString() + ".xml";
                                    file.SaveAs(xmlName);

                                    abstractParser = new XmlDisciplineProgramParser(xmlSchema);
                                    
                                    break;
                                }
                            default:
                                {
                                    return RedirectToAction("Error", "Home");
                                }
                        }

                        if (abstractParser.ValidateXml(xmlName) & abstractParser.ValidateData(xmlName))
                        {
                            abstractParser.ParseXml(xmlName);
                            ViewData["XmlParseOK"] = true;
                        }
                        else
                        {
                            ViewData["XmlParseStructureErrors"] = abstractParser.XmlStructureErrorLog.AsEnumerable<LogRecord>();
                            ViewData["XmlParseDataErrors"]      = abstractParser.XmlDataErrorLog.AsEnumerable<LogRecord>();
                        }
                    }
                }
            }
            catch (Exception exc)
            {
                return RedirectToAction("Error", "Home");
            }

            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = "Загрузка образовательных документов";
            
            return View("XmlParse");
        }



        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Departments(string alias,string additional,string departmentAlias, Department department)
        {
            if (null != alias && !alias.Trim().Equals(String.Empty))
                {
                    if (departmentAlias == "") department.Alias = null;
                    else department.Alias = departmentAlias;
                    if (department.Alias == null)
                        ModelState.AddModelError("Alias", "*Алиас дисциплины обязательный параметр");

                    if (department.Abbreviation == null)
                        ModelState.AddModelError("Abbreviation", "*Аббревиатура обязательный параметр");
                    if (department.Title == null)
                        ModelState.AddModelError("Title", "*Название дисциплины обязательный параметр");

                    switch (alias)
                    {
                        case "Add": 
                            {
                                if (ModelState.IsValid)
                                {
                                    repositoryManager.GetDepartmentRepository.Add(department);
                                    return Redirect("/Admin/Departments/");
                                }
                                else return View(Constants.ADMIN_DEPARTMENT_VIEWS + "Add.aspx", department);
                                                                
                            }
                            
                        case "Edit":
                            {
                                if (ModelState.IsValid)
                                {
                                    repositoryManager.GetDepartmentRepository.UpdateByAlias(additional, department);
                                    return Redirect("/Admin/Departments/");
                                }
                                else return View(Constants.ADMIN_DEPARTMENT_VIEWS + "Edit.aspx", department);
                              
                            }
                           
                    }
                }
               
           return View(Constants.ADMIN_DEPARTMENT_VIEWS + "Departments.aspx");
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EducationPlans(string alias, string additional, string educationPlanAlias, EducationPlan educationPlan)
        {
            if (null != alias && !alias.Trim().Equals(String.Empty))
            {
                if (educationPlanAlias == "") educationPlan.Alias = null;
                else educationPlan.Alias = educationPlanAlias;
                if (educationPlan.Alias == null)
                    ModelState.AddModelError("Alias", "*Алиас дисциплины обязательный параметр");

                if (educationPlan.Title == null)
                    ModelState.AddModelError("Title", "*Название дисциплины обязательный параметр");

                switch (alias)
                {
                    case "Add":
                        {
                            if (ModelState.IsValid)
                            {
                                repositoryManager.GetEducationPlanRepository.Add(educationPlan);
                                return Redirect("/Admin/EducationPlans/");
                            }
                            else return View(Constants.ADMIN_EDUCATION_PLAN_VIEWS + "Add.aspx", educationPlan);

                        }

                    case "Edit":
                        {
                            if (ModelState.IsValid)
                            {
                                repositoryManager.GetEducationPlanRepository.UpdateByAlias(additional, educationPlan);
                                return Redirect("/Admin/EducationPlans/");
                            }
                            else return View(Constants.ADMIN_EDUCATION_PLAN_VIEWS + "Edit.aspx", educationPlan);

                        }

                }
            }

            return View(Constants.ADMIN_EDUCATION_PLAN_VIEWS + "EducationPlans.aspx");
        }
   }
}
