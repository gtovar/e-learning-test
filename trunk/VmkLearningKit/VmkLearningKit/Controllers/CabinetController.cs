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
    public class CabinetController : AbstractController
    {
        /// <summary>
        /// Action, ������������ ����� �������� �������������� ��� ��������� � domain.ru/Cabinet/Administrator
        /// </summary>
        [AuthorizeFilter(Roles = "Admin")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Admin(string alias)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            return View();
        }

        /// <summary>
        /// Action, ������������ ����� �������� ��������� ��� ��������� � domain.ru/Cabinet/Metodist
        /// </summary>
        [AuthorizeFilter(Roles = "Metodist")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Metodist(string alias)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            return View();
        }

        /// <summary>
        /// Action, ������������ ����� �������� ������������� ��� ��������� � domain.ru/Cabinet/Professor
        /// <param name="alias">NickName �������������</param>
        /// <param name="additional">����� ����������</param>
        /// </summary>
        [AuthorizeFilter(Roles = "Professor")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Professor(string alias, string additional)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            if (null != alias && !alias.Trim().Equals(String.Empty))
            {
                // ����������� ��������� ���������� � ����������
                if (alias.Trim().Equals("Detailed"))
                {
                    if (null != additional && !additional.Trim().Equals(String.Empty))
                    {
                        SpecialityDiscipline specialityDiscipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
                        ViewData["SpecialityDiscipline"] = specialityDiscipline;
                        ViewData["Detailed"] = true;
                        ViewData["Professor"] = specialityDiscipline.Professor;
                    }
                }
                else
                {
                    Professor professor = repositoryManager.GetProfessorRepository.GetByNickName(alias);
                    ViewData["Professor"] = professor;
                    // ����������� ��� ����������
                    if (null != additional && !additional.Trim().Equals(String.Empty))
                    {
                        SpecialityDiscipline specialityDiscipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
                        ViewData["SpecialityDiscipline"] = specialityDiscipline;
                        ViewData["SpecialityDisciplineTopics"] = specialityDiscipline.SpecialityDisciplineTopics;
                    }
                    // ����������� ������ ���������
                    else
                    {
                        IEnumerable<SpecialityDiscipline> specialityDisciplines = repositoryManager.GetSpecialityDisciplineRepository.GetAllByProfessor(professor.User.NickName);
                        ViewData["ProfessorSpecialityDisciplines"] = specialityDisciplines;
                    }
                }
            }

            return View();
        }
        /// <summary>
        /// Action, ������������ ����� ����� ������ ��� ��������� � domain.ru/Cabinet/LecturePlan/<ProfessorNickName>/<SpecialityDisciplineAlias>
        /// </summary>
        /// <param name="alias">NickName �������������</param>
        /// <param name="additional">����� ����������</param>
        [AuthorizeFilter(Roles = "Professor")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult LecturePlan(string alias, string additional)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;

            if (null != alias && !alias.Trim().Equals(String.Empty) &&
                null != additional && !additional.Trim().Equals(String.Empty))
            {
                Professor professor = repositoryManager.GetProfessorRepository.GetByNickName(alias);
                ViewData["Professor"] = professor;

                SpecialityDiscipline specialityDiscipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
                ViewData["SpecialityDiscipline"] = specialityDiscipline;
            }
            return View();
        }

        /// <summary>
        /// Action, ������������ ����� ����� ������ ��� ��������� � domain.ru/Cabinet/LecturePlan/<ProfessorNickName>/<SpecialityDisciplineAlias>
        /// </summary>
        /// <param name="alias">NickName �������������</param>
        /// <param name="additional">����� ����������</param>
        [AuthorizeFilter(Roles = "Professor")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult LecturePlan(FormCollection form)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;

            return View();
        }

        /// <summary>
        /// Action, ������������ ����� ����� ������� ��� ��������� � domain.ru/Cabinet/PracticePlan/<ProfessorNickName>/<SpecialityDisciplineAlias>
        /// </summary>
        /// <param name="alias">NickName �������������</param>
        /// <param name="additional">����� ����������</param>
        [AuthorizeFilter(Roles = "Professor")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult PracticePlan(string alias, string additional)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;

            if (null != alias && !alias.Trim().Equals(String.Empty) &&
                null != additional && !additional.Trim().Equals(String.Empty))
            {
                Professor professor = repositoryManager.GetProfessorRepository.GetByNickName(alias);
                ViewData["Professor"] = professor;

                SpecialityDiscipline specialityDiscipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(additional);
                ViewData["SpecialityDiscipline"] = specialityDiscipline;
            }

            return View();
        }

        /// <summary>
        /// Action, ������������ ����� ����� ������ ��� ��������� � domain.ru/Cabinet/PracticePlan/<ProfessorNickName>/<SpecialityDisciplineAlias>
        /// </summary>
        /// <param name="alias">NickName �������������</param>
        /// <param name="additional">����� ����������</param>
        [AuthorizeFilter(Roles = "Professor")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult PracticePlan(FormCollection form)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;

            return View();
        }

        /// <summary>
        /// Action, ������������ ����� �������� ������������� ��� ��������� � domain.ru/Cabinet/Student
        /// </summary>
        [AuthorizeFilter(Roles = "Student")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Student(string alias)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            return View();
        }

        /// <summary>
        /// Action, ������������ ����� ���� (������ ����� ����������) ��� ��������� � domain.ru/Cabinet/Menu
        /// </summary>
        [AuthorizeFilter(Roles = "Admin, Professor, Metodist")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Menu()
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            return View();
        }

        /// <summary>
        /// Action, ������������ ����� ���� (������ ����� ����������) ��� ��������� � domain.ru/Cabinet/Menu
        /// </summary>
        [AuthorizeFilter(Roles = "Student, Admin, Professor, Metodist")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult AccountSettings()
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.PERSON_CABINET;
            return View();
        }

    }
}
