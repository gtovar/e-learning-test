using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.IO;
using VmkLearningKit.Core;
using VmkLearningKit.Models.Repository;
using VmkLearningKit.Core.ExcelToDB;

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

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(FormCollection form)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;

            List<string> filePathes = new List<string>();
            foreach (string file in Request.Files)
            {
                var postedFile = Request.Files[file];
                if (null != postedFile && !postedFile.FileName.Trim().Equals(String.Empty))
                {
                    string filePath = Server.MapPath(Constants.EXCEL_FILE_UPLOAD_PATH) + Path.GetFileNameWithoutExtension(postedFile.FileName) + "_" + DateTime.Now.ToString("yyyyMMdd_HHmmss_ffff") + Path.GetExtension(postedFile.FileName);
                    postedFile.SaveAs(filePath);

                    filePathes.Add(filePath);
                }
            }
            bool isFileLoadOk = false;
            if (filePathes.Count > 0)
            {
                foreach (string filePath in filePathes)
                {
                    if (null != filePath && !filePath.Trim().Equals(String.Empty))
                    {
                        if (null != form["DepartmentStructure"])
                        {
                            DepartmentStructure departmentStructure = new DepartmentStructure();
                            List<DepartmentStructureObj> departmentStructureList = departmentStructure.FromFile(filePath);
                            foreach (DepartmentStructureObj obj in departmentStructureList)
                            {
                                string dbBackupFilePath = Server.MapPath(Constants.DB_BACKUP_PATH) + Constants.DB_BACKUP_NAME + "DepartmentStructure_" + DateTime.Now.ToString("yyyyMMdd_HHmmss_ffff") + ".bak";
                                DB.Backup(dbBackupFilePath);
                                obj.Commit();
                            }
                            isFileLoadOk = true;
                        }
                        if (null != form["SpecialityDisciplineStructure"])
                        {
                            SpecialityDisciplineStructure specialityDisciplineStructure = new SpecialityDisciplineStructure();
                            List<SpecialityDisciplineStructureObj> specialityDisciplineStructureList = specialityDisciplineStructure.FromFile(filePath);
                            foreach (SpecialityDisciplineStructureObj obj in specialityDisciplineStructureList)
                            {
                                string dbBackupFilePath = Server.MapPath(Constants.DB_BACKUP_PATH) + Constants.DB_BACKUP_NAME + "SpecialityDisciplineStructure_" + DateTime.Now.ToString("yyyyMMdd_HHmmss_ffff") + ".bak";
                                DB.Backup(dbBackupFilePath);
                                obj.Commit();
                            }
                            isFileLoadOk = true;
                        }
                        if (null != form["SpecialityDisciplineTopicStructure"])
                        {
                            SpecialityDisciplineTopicStructure specialityDisciplineTopicStructure = new SpecialityDisciplineTopicStructure();
                            List<SpecialityDisciplineTopicStructureObj> specialityDisciplineTopicStructureList = specialityDisciplineTopicStructure.FromFile(filePath);
                            foreach (SpecialityDisciplineTopicStructureObj obj in specialityDisciplineTopicStructureList)
                            {
                                string dbBackupFilePath = Server.MapPath(Constants.DB_BACKUP_PATH) + Constants.DB_BACKUP_NAME + "SpecialityDisciplineTopicStructure_" + DateTime.Now.ToString("yyyyMMdd_HHmmss_ffff") + ".bak";
                                DB.Backup(dbBackupFilePath);
                                obj.Commit();
                            }
                            isFileLoadOk = true;
                        }
                        if (null != form["GroupStructure"])
                        {
                            GroupStructure groupStructure = new GroupStructure();
                            List<GroupStructureObj> groupStructureList = groupStructure.FromFile(filePath);
                            foreach (GroupStructureObj obj in groupStructureList)
                            {
                                string dbBackupFilePath = Server.MapPath(Constants.DB_BACKUP_PATH) + Constants.DB_BACKUP_NAME + "GroupStructure_" + DateTime.Now.ToString("yyyyMMdd_HHmmss_ffff") + ".bak";
                                DB.Backup(dbBackupFilePath);
                                obj.Commit();
                            }
                            isFileLoadOk = true;
                        }
                        if (null != form["LectureTimetableStructure"])
                        {
                            LectureTimetableStructure lectureTimetableStructure = new LectureTimetableStructure();
                            List<LectureTimetableStructureObj> lectureTimetableStructureList = lectureTimetableStructure.FromFile(filePath);
                            foreach (LectureTimetableStructureObj obj in lectureTimetableStructureList)
                            {
                                string dbBackupFilePath = Server.MapPath(Constants.DB_BACKUP_PATH) + Constants.DB_BACKUP_NAME + "LectureTimetableStructure_" + DateTime.Now.ToString("yyyyMMdd_HHmmss_ffff") + ".bak";
                                DB.Backup(dbBackupFilePath);
                                obj.Commit();
                            }
                            isFileLoadOk = true;
                        }
                    }
                }
            }

            ViewData["IsFileLoadOk"] = isFileLoadOk;

            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Departments(string alias, string additional)
        {
            IEnumerable<Department> departments = null;
            Department department = null;
            try
            {
                GeneralMenu();
                ViewData[Constants.PAGE_TITLE] = Constants.ADMIN_PANEL_TITLE;
                if (null != alias && !alias.Trim().Equals(String.Empty))
                {
                    switch (alias)
                    {
                        case "Add":
                            return View(Constants.ADMIN_DEPARTMENT_VIEWS + "Add.aspx");
                            break;
                        case "Edit":
                            if (null != additional && !additional.Trim().Equals(String.Empty))
                            {
                                department = repositoryManager.GetDepartmentRepository.GetByAlias(additional);
                                ViewData["Department"] = department;

                                return View(Constants.ADMIN_DEPARTMENT_VIEWS + "Edit.aspx", department);
                            }
                            break;
                    }
                }
                departments = repositoryManager.GetDepartmentRepository.GetAll();
            }
            catch (Exception ex)
            {
                Utility.RedirectToErrorPage("AdminController.departments: catch exception", ex);
            }
            ViewData["Departments"] = departments;
            return View(Constants.ADMIN_DEPARTMENT_VIEWS + "Departments.aspx");
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
            return View(Constants.ADMIN_CHAIR_VIEWS + "Chairs.aspx");
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
            return View(Constants.ADMIN_CHAIR_VIEWS + "Chairs.aspx");
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
            return View(Constants.ADMIN_EDUCATION_PLAN_VIEWS + "EducationPlans.aspx");
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
            return View(Constants.ADMIN_SPECIALITY_VIEWS + "Specialities.aspx");
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
            return View(Constants.ADMIN_SPECIALITY_VIEWS + "Specialities.aspx");
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
            return View(Constants.ADMIN_SPECIALIZATION_VIEWS + "Specializations.aspx");
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

    }
}
