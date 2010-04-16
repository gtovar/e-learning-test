using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Models.Repository
{
    public class SpecialityDisciplineCategory
    {
        public static string GetCategoryString(string category)
        {
            string[] categoryTitles = category.Split(':');
            StringBuilder categories = new StringBuilder();
            foreach (string categoryTitle in categoryTitles)
            {
                string abbreviation = GetAbbreviation(categoryTitle);
                if(null != abbreviation && !abbreviation.Trim().Equals(String.Empty))
                {
                    categories.Append(abbreviation + ":");
                }
            }
            return categories.ToString().Trim(':', ' ');
        }

        public static string GetAbbreviation(string categoryTitle)
        {
            string abbreviation = null;
            switch (categoryTitle.Trim().ToLower())
            {
                case "дисциплины направления":
                    {
                        abbreviation = "ДН";
                        break;
                    }
                case "федеральный компонент":
                    {
                        abbreviation = "ФК";
                        break;
                    }
                case "региональный компонент":
                    {
                        abbreviation = "РК";
                        break;
                    }
                case "вузовский компонент":
                    {
                        abbreviation = "ВК";
                        break;
                    }
                case "дисциплины по выбору":
                    {
                        abbreviation = "ДПВ";
                        break;
                    }
                case "дисциплины специализации":
                    {
                        abbreviation = "ДС";
                        break;
                    }
                case "специальные дисциплины":
                    {
                        abbreviation = "СПД";
                        break;
                    }
                default:
                    {
                        Specialization specialization = RepositoryManager.GetRepositoryManager.GetSpecializationRepository.GetByTitle(categoryTitle);
                        if (null != specialization)
                        {
                            abbreviation = specialization.Id.ToString();
                        }
                        break;
                    }
            }
            return abbreviation;
        }

        public static string GetTitle(string abbreviation)
        {
            string title = null;
            switch (abbreviation.Trim(':', ' ', ',', ';').ToUpper())
            {
                case "ДН":
                    {
                        title = "Дисциплины направления";
                        break;
                    }
                case "ФК":
                    {
                        title = "Федеральный компонент";
                        break;
                    }
                case "РК":
                    {
                        title = "Региональный компонент";
                        break;
                    }
                case "ВК":
                    {
                        title = "Вузовский компонент";
                        break;
                    }
                case "ДПВ":
                    {
                        title = "Дисциплины по выбору";
                        break;
                    }
                case "ДС":
                    {
                        title = "Дисциплины специализации";
                        break;
                    }
                case "СПД":
                    {
                        title = "Специальные дисциплины";
                        break;
                    }
            }
            return title;
        }
    }
}
