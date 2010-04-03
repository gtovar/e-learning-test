using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VmkLearningKit.Models.Repository;
using VmkLearningKit.Core;

namespace VmkLearningKit.Controllers
{
    [HandleError]
    public class HomeController : AbstractController
    {
        /// <summary>
        /// Действие для главной страници. Главная страница - "О факультете".
        /// </summary>
        public ActionResult Index()
        {
            GeneralMenu();
            return View();
        }

        /// <summary>
        /// Действие для отображения страниц, связанных со специальностями (ПМИ, ПМ, ИТ) 
        /// и их планами подготовки.
        /// </summary>
        /// <param name="alias">Алиас специальности</param>
        /// <param name="additional">Алиас плана подготовки</param>
        public ActionResult Specialities(string alias, string additional)
        {
            GeneralMenu();
            ViewData[Constants.PAGE_TITLE] = Constants.SPECIALITIES_TITLE;
            if (null != alias && !alias.Trim().Equals(String.Empty))
            {
                Speciality speciality = repositoryManager.GetSpecialityRepository.GetByAlias(alias);
                if (null != speciality)
                {
                    // Получаем информацию о дисциплинах и планах подготовки данной специльности
                    IEnumerable<SpecialityDiscipline> specialityDisciplines = null;
                    IEnumerable<EducationPlan> educationPlans = null;
                    try
                    {
                        specialityDisciplines = repositoryManager.GetSpecialityDisciplinesRepository.GetAll(alias);
                        educationPlans = repositoryManager.GetEducationPlanRepository.GetAll();
                    }
                    catch (Exception ex)
                    {
                        Utility.RedirectToErrorPage("HomeController.Specialities: catch exception", ex);
                    }
                    // Связываем планты подготовки и дисциплины, добавляем в список только используемые
                    // планы подготовки, то есть те, по которым есть дисциплины
                    List<EducationPlan> usableEducationPlans = new List<EducationPlan>();
                    foreach (EducationPlan educationPlan in educationPlans)
                    {
                        foreach (SpecialityDiscipline specialityDiscipline in specialityDisciplines)
                        {
                            if (specialityDiscipline.EducationPlanId == educationPlan.Id)
                            {
                                // Выбираем дисциплины только для обучающего плана с переданным алиасом в additional
                                if (null != additional && !additional.Trim().Equals(String.Empty))
                                {
                                    if (!usableEducationPlans.Contains(educationPlan) && educationPlan.Alias.Equals(additional))
                                    {
                                        usableEducationPlans.Add(educationPlan);
                                    }
                                }
                                // Выбираем дисциплины для всех обучающих планов
                                else
                                {
                                    if (!usableEducationPlans.Contains(educationPlan))
                                    {
                                        usableEducationPlans.Add(educationPlan);
                                    }
                                }
                                break;
                            }

                        }
                    }
                    ViewData["SpecialityDisciplines"] = specialityDisciplines;
                    ViewData["Speciality"] = speciality;
                    ViewData["EducationPlans"] = usableEducationPlans;
                    ViewData[Constants.SPECIALITY_ALIAS] = alias;
                    ViewData[Constants.PAGE_TITLE] = speciality.Title;
                }
                else
                {
                    Utility.RedirectToErrorPage("HomeController.Specialities: alias is null");
                }
            }
            return View();
        }

        /// <summary>
        /// Действие для отображения страниц, связанных с кафедрами: 
        /// описание кафедры и состав преподавателей
        /// </summary>
        /// <param name="alias">Алиас кафедры</param>
        /// <param name="additional">Дополнительное действие: About, Professors </param>
        public ActionResult Chairs(string alias, string additional)
        {
            if (null != alias && !alias.Trim().Equals(String.Empty))
            {
                Chair chair = repositoryManager.GetChairRepository.GetByAlias(alias);
                if (null != chair)
                {
                    ViewData["Chair"] = chair;
                    ViewData[Constants.SPECIALITY_ALIAS] = alias;
                    ViewData[Constants.PAGE_TITLE] = chair.Title;
                    ViewData[Constants.ACTION] = additional;
                }
                else
                {
                    Utility.RedirectToErrorPage("HomeController.Chairs: chair is null");
                }
            }
            else
            {
                Utility.RedirectToErrorPage("HomeController.Chairs: alias is null");
            }
            GeneralMenu();
            ViewData[Constants.MENU_TYPE] = Constants.CHAIR_MENU;
            return View();
        }

        /// <summary>
        /// Действие отображения страницы со вспомогательной информацией
        /// </summary>
        public ActionResult Help()
        {
            GeneralMenu();
            return View();
        }

        /// <summary>
        /// Действие отображения страницы с информацией о факультете
        /// </summary>
        public ActionResult About()
        {
            GeneralMenu();
            return View();
        }

        /// <summary>
        /// Действие отображения страниц ошибок в зависимости от кода
        /// </summary>
        /// <param name="alias"></param>
        public ActionResult Error(string alias)
        {
            GeneralMenu();
            switch (alias)
            {
                case "404":
                    return View(Constants.VIEW_PAGE_ERROR_404);
            }

            return View(Constants.VIEW_PAGE_ERROR);
        }
    }
}
