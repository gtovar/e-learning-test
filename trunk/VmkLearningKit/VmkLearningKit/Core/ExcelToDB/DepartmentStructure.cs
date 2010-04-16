using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core.ExcelToDB
{
    public class DepartmentStructureObj
    {
        public Department Department;
        public List<Speciality> Specialities;
        public List<EducationPlan> EducationPlans;
        public List<Chair> Chairs;
        public List<Specialization> Specializations;

        public DepartmentStructureObj Copy()
        {
            DepartmentStructureObj copy = new DepartmentStructureObj();
            // copy Department
            Department departmentCopy = new Department();
            departmentCopy.Id = Department.Id;
            departmentCopy.Title = Department.Title;
            departmentCopy.Abbreviation = Department.Abbreviation;
            departmentCopy.Description = Department.Description;
            departmentCopy.Alias = Department.Alias;
            copy.Department = departmentCopy;

            // copy EducationPlans
            List<EducationPlan> educationPlans = new List<EducationPlan>();
            foreach (EducationPlan educationPlan in EducationPlans)
            {
                EducationPlan educationPlanCopy = new EducationPlan();
                educationPlanCopy.Id = educationPlan.Id;
                educationPlanCopy.Alias = educationPlan.Alias;
                educationPlanCopy.Title = educationPlan.Title;

                educationPlans.Add(educationPlanCopy);
            }
            copy.EducationPlans = educationPlans;

            // copy Chairs
            List<Chair> chairs = new List<Chair>();
            foreach (Chair chair in Chairs)
            {
                Chair chairCopy = new Chair();
                chairCopy.Id = chair.Id;
                chairCopy.Alias = chair.Alias;
                chairCopy.Title = chair.Title;
                chairCopy.Abbreviation = chair.Abbreviation;
                chairCopy.Description = chair.Description;
                chairCopy.DepartmentId = chair.DepartmentId;

                chairs.Add(chairCopy);
            }
            copy.Chairs = chairs;

            // copy Specialities
            List<Speciality> specialities = new List<Speciality>();
            foreach (Speciality speciality in Specialities)
            {
                Speciality specialityCopy = new Speciality();
                specialityCopy.Id = speciality.Id;
                specialityCopy.Alias = speciality.Alias;
                specialityCopy.Title = speciality.Title;
                specialityCopy.Abbreviation = speciality.Abbreviation;
                specialityCopy.DepartmentId = speciality.DepartmentId;

                specialities.Add(specialityCopy);
            }
            copy.Specialities = specialities;

            // copy Specializations
            List<Specialization> specializations = new List<Specialization>();
            foreach (Specialization specialization in Specializations)
            {
                Specialization specializationCopy = new Specialization();
                specializationCopy.Id = specialization.Id;
                specializationCopy.Alias = specialization.Alias;
                specializationCopy.Title = specialization.Title;
                specializationCopy.ChairId = specialization.ChairId;
                specializationCopy.EducationPlanId = specialization.EducationPlanId;
                specializationCopy.SpecialityId = specialization.SpecialityId;

                specializations.Add(specializationCopy);
            }
            copy.Specializations = specializations;

            return copy;
        }

        public void Commit()
        {
            //DepartmentStructureObj copy = this.Copy();

            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            Department updatedDepartment = repositoryManager.GetDepartmentRepository.Add(Department);
            if (null != updatedDepartment)
            {
                List<StringBuilder> specializationsNewIds = new List<StringBuilder>();
                int index;
                foreach (EducationPlan educationPlan in EducationPlans)
                {
                    long educationPlanIdBeforeCommit = educationPlan.Id;

                    EducationPlan updatedEducationPlan = repositoryManager.GetEducationPlanRepository.Add(educationPlan);
                    index = 0;
                    foreach (Specialization specialization in Specializations)
                    {
                        if (specialization.EducationPlanId == educationPlanIdBeforeCommit)
                        {
                            StringBuilder str = new StringBuilder();
                            str.Append(specialization.Id + "-" + updatedEducationPlan.Id);
                            specializationsNewIds.Add(str);
                        }
                        index++;
                    }
                }
                foreach (Speciality speciality in Specialities)
                {
                    long specialityIdBeforeCommit = speciality.Id;

                    speciality.DepartmentId = updatedDepartment.Id;
                    Speciality updatedSpeciality = repositoryManager.GetSpecialityRepository.Add(speciality);

                    index = 0;
                    foreach (Specialization specialization in Specializations)
                    {
                        if (specialization.SpecialityId == specialityIdBeforeCommit)
                        {
                            StringBuilder str = specializationsNewIds[index];
                            str.Append("-" + updatedSpeciality.Id);
                        }
                        index++;
                    }
                }

                foreach (Chair chair in Chairs)
                {
                    long chairIdBeforeCommit = chair.Id;

                    chair.DepartmentId = updatedDepartment.Id;
                    Chair updatedChair = repositoryManager.GetChairRepository.Add(chair);

                    index = 0;
                    foreach (Specialization specialization in Specializations)
                    {
                        if (specialization.ChairId == chairIdBeforeCommit)
                        {
                            StringBuilder str = specializationsNewIds[index];
                            str.Append("-" + updatedChair.Id);
                        }
                        index++;
                    }
                }
                index = 0;
                foreach (Specialization specialization in Specializations)
                {
                    StringBuilder str = specializationsNewIds[index];
                    string[] ids = str.ToString().Split('-');
                    if (ids.Length >= 4)
                    {
                        try
                        {
                            specialization.EducationPlanId = Convert.ToInt64(ids[1]);
                            specialization.SpecialityId = Convert.ToInt64(ids[2]);
                            specialization.ChairId = Convert.ToInt64(ids[3]);
                        }
                        catch (Exception ex)
                        {
                            // FIXME: add some handler
                        }
                    }
                    Specialization updatedSpecialization = repositoryManager.GetSpecializationRepository.Add(specialization);
                    index++;
                }

                repositoryManager.SubmitChanges();
            }
        }
    }

    public class DepartmentStructure
    {
        char[] delimiters = { ' ', ',', ';' };

        public DepartmentStructure() { }

        private List<string> ParseString(string str)
        {
            List<string> result = new List<string>();
            if (null != str && !str.Trim().Equals(String.Empty))
            {
                int ind = str.IndexOf('(');

                if (ind > 0)
                {
                    string title = str.Substring(0, ind).Trim(' ', '(');
                    result.Add(title);
                    string bracketContent = str.Substring(ind).Trim(' ', '(', ')');
                    string[] parts = bracketContent.Split(delimiters);
                    foreach (string part in parts)
                    {
                        result.Add(part.Trim(delimiters));
                    }
                }
                else
                {
                    result.Add(str.Trim(delimiters));
                }
            }
            return result;
        }

        private List<string> GetContent(string str)
        {
            List<string> list = ParseString(str);
            List<string> result = new List<string>();
            try
            {
                string title = null;
                string abbreviation = null;
                string alias = null;
                if (null != list[0] && !list[0].Trim().Equals(String.Empty))
                {
                    title = list[0];
                }
                if (list.Count >= 2 && null != list[1] && !list[1].Trim().Equals(String.Empty))
                {
                    abbreviation = list[1];
                }
                else if (list.Count >= 2 && null != title && !title.Trim().Equals(String.Empty))
                {
                    string[] parts = title.Split(' ');
                    StringBuilder abbr = new StringBuilder();
                    foreach (string part in parts)
                    {
                        abbr.Append(part[0].ToString().ToUpper());
                    }
                    abbreviation = abbr.ToString();

                }
                if (list.Count >= 3 && null != list[2] && !list[2].Trim().Equals(String.Empty))
                {
                    alias = list[2];
                }
                else if (list.Count >= 3 && null != abbreviation && !abbreviation.Trim().Equals(String.Empty))
                {
                    alias = Transliteration.Front(abbreviation, TransliterationType.ISO);
                }
                result.Add(title);
                result.Add(abbreviation);
                result.Add(alias);
            }
            catch (Exception ex)
            {
                // FIXME: add some handler
            }

            return result;
        }

        private string CreateAbbreviation(string str)
        {
            string abbreviation = null;
            if (null != str)
            {
                string[] parts = str.Split(delimiters);
                StringBuilder abbr = new StringBuilder();
                foreach (string part in parts)
                {
                    if (null != part && part.Length >= 1 && null != part[0])
                    {
                        abbr.Append(part[0].ToString().ToUpper());
                    }
                }
                abbreviation = abbr.ToString();
            }

            return abbreviation;
        }

        public List<DepartmentStructureObj> FromFile(string filePath)
        {
            List<DepartmentStructureObj> departmentStructureList = null;
            ExcelParser excelParser = ExcelParser.GetExcelParser(filePath);
            if (null != excelParser)
            {
                excelParser.Open();
                excelParser.SetWorkPage(1);

                departmentStructureList = new List<DepartmentStructureObj>();
                DepartmentStructureObj departmentStructureObj = null;
                Department department = null;
                List<Speciality> specialities = null;
                List<EducationPlan> educationPlans = null;
                List<Chair> chairs = null;
                List<Specialization> specializations = null;

                string currentReadedValue = String.Empty;
                int rowIndex = 1;
                int columnIndex = 1;
                int maxColumnIndex = 100; // excelParser.GetMaxColumnCount();
                int maxRowIndex = 1000; // excelParser.GetMaxRowCount();
                int departmentColumnIndex = -1;
                int lastDepartmentId = 0;
                int specialityColumnIndex = -1;
                int lastSpecialityId = 0;
                int educationPlanColumnIndex = -1;
                int lastEducationPlanId = 0;
                int chairColumnIndex = -1;
                int lastChairId = 0;
                int specializationColumnIndex = -1;
                int lastSpecializationId = 0;

                while (true)
                {
                    currentReadedValue = excelParser.GetCell(rowIndex, columnIndex);
                    switch (currentReadedValue.Trim())
                    {
                        case "Факультет":
                            {
                                departmentColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Специальность":
                            {
                                specialityColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "План подготовки":
                            {
                                educationPlanColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Кафедра":
                            {
                                chairColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Специализация":
                            {
                                specializationColumnIndex = columnIndex;
                                maxColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                    }
                    if (!currentReadedValue.Trim().Equals(String.Empty))
                    {
                        if (columnIndex == departmentColumnIndex)
                        {
                            if (null != departmentStructureObj)
                            {
                                departmentStructureObj.Department = department;
                                departmentStructureObj.Specialities = specialities;
                                departmentStructureObj.Chairs = chairs;
                                departmentStructureObj.EducationPlans = educationPlans;
                                departmentStructureObj.Specializations = specializations;

                                departmentStructureList.Add(departmentStructureObj);
                            }
                            departmentStructureObj = new DepartmentStructureObj();
                            department = new Department();
                            specialities = new List<Speciality>();
                            educationPlans = new List<EducationPlan>();
                            chairs = new List<Chair>();
                            specializations = new List<Specialization>();

                            List<string> content = GetContent(currentReadedValue);
                            if (content.Count >= 1 && null != content[0] && !content[0].Trim().Equals(String.Empty))
                            {
                                department.Title = content[0];
                            }
                            else
                            {
                                department.Title = Constants.STRING_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff"); ;
                            }

                            if (content.Count >= 2 && null != content[1] && !content[1].Trim().Equals(String.Empty))
                            {
                                department.Abbreviation = content[1];
                            }
                            else
                            {
                                string abbreviation = CreateAbbreviation(department.Title);
                                if (null != abbreviation)
                                {
                                    department.Abbreviation = abbreviation;
                                }
                                else
                                {
                                    department.Abbreviation = Constants.ABBREVIATION_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff"); ;
                                }
                            }

                            if (content.Count >= 3 && null != content[2] && !content[2].Trim().Equals(String.Empty))
                            {
                                department.Alias = content[2];
                            }
                            else
                            {
                                string alias = null;
                                if (!department.Abbreviation.Contains(Constants.ABBREVIATION_DEFAULT_VALUE))
                                {
                                    alias = Transliteration.Front(department.Abbreviation);
                                }
                                else
                                {
                                    alias = Transliteration.Front(department.Title);
                                }
                                if (null != alias && !alias.Equals(String.Empty))
                                {
                                    department.Alias = alias;
                                }
                                else
                                {
                                    department.Alias = Constants.ALIAS_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                                }
                            }
                            department.Id = ++lastDepartmentId;
                            departmentStructureObj.Department = department;
                        }
                        else if (columnIndex == specialityColumnIndex)
                        {
                            List<string> content = GetContent(currentReadedValue);
                            Speciality speciality = new Speciality();
                            if (content.Count >= 1 && null != content[0] && !content[0].Trim().Equals(String.Empty))
                            {
                                speciality.Title = content[0];
                            }
                            else
                            {
                                speciality.Title = Constants.STRING_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff"); ;
                            }

                            if (content.Count >= 2 && null != content[1] && !content[1].Trim().Equals(String.Empty))
                            {
                                speciality.Abbreviation = content[1];
                            }
                            else
                            {
                                string abbreviation = CreateAbbreviation(speciality.Title);
                                if (null != abbreviation)
                                {
                                    speciality.Abbreviation = abbreviation;
                                }
                                else
                                {
                                    speciality.Abbreviation = Constants.ABBREVIATION_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff"); ;
                                }
                            }

                            if (content.Count >= 3 && null != content[2] && !content[2].Trim().Equals(String.Empty))
                            {
                                speciality.Alias = content[2];
                            }
                            else
                            {
                                string alias = null;
                                if (!speciality.Abbreviation.Contains(Constants.ABBREVIATION_DEFAULT_VALUE))
                                {
                                    alias = Transliteration.Front(speciality.Abbreviation);
                                }
                                else
                                {
                                    alias = Transliteration.Front(speciality.Title);
                                }
                                if (null != alias && !alias.Equals(String.Empty))
                                {
                                    speciality.Alias = alias;
                                }
                                else
                                {
                                    speciality.Alias = Constants.ALIAS_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                                }
                            }
                            speciality.Id = ++lastSpecialityId;
                            speciality.DepartmentId = lastDepartmentId;
                            specialities.Add(speciality);
                        }
                        else if (columnIndex == educationPlanColumnIndex)
                        {
                            List<string> content = GetContent(currentReadedValue);
                            EducationPlan educationPlan = new EducationPlan();
                            if (content.Count >= 1 && null != content[0] && !content[0].Trim().Equals(String.Empty))
                            {
                                educationPlan.Title = content[0];
                            }
                            else
                            {
                                educationPlan.Title = Constants.STRING_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff"); ;
                            }

                            if (content.Count >= 2 && null != content[1] && !content[1].Trim().Equals(String.Empty))
                            {
                                educationPlan.Alias = content[1];
                            }
                            else
                            {
                                string alias = Transliteration.Front(educationPlan.Title);
                                if (null != alias && !alias.Equals(String.Empty))
                                {
                                    educationPlan.Alias = alias;
                                }
                                else
                                {
                                    educationPlan.Alias = Constants.ALIAS_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                                }
                            }


                            educationPlan.Id = ++lastEducationPlanId;
                            educationPlans.Add(educationPlan);

                        }
                        else if (columnIndex == chairColumnIndex)
                        {
                            List<string> content = GetContent(currentReadedValue);
                            Chair chair = new Chair();
                            if (content.Count >= 1 && null != content[0] && !content[0].Trim().Equals(String.Empty))
                            {
                                chair.Title = content[0];
                            }
                            else
                            {
                                chair.Title = Constants.STRING_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff"); ;
                            }

                            if (content.Count >= 2 && null != content[1] && !content[1].Trim().Equals(String.Empty))
                            {
                                chair.Abbreviation = content[1];
                            }
                            else
                            {
                                string abbreviation = CreateAbbreviation(chair.Title);
                                if (null != abbreviation)
                                {
                                    chair.Abbreviation = abbreviation;
                                }
                                else
                                {
                                    chair.Abbreviation = Constants.ABBREVIATION_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff"); ;
                                }
                            }

                            if (content.Count >= 3 && null != content[2] && !content[2].Trim().Equals(String.Empty))
                            {
                                chair.Alias = content[2];
                            }
                            else
                            {
                                string alias = null;
                                if (!chair.Abbreviation.Contains(Constants.ABBREVIATION_DEFAULT_VALUE))
                                {
                                    alias = Transliteration.Front(chair.Abbreviation);
                                }
                                else
                                {
                                    alias = Transliteration.Front(chair.Title);
                                }
                                if (null != alias && !alias.Equals(String.Empty))
                                {
                                    chair.Alias = alias;
                                }
                                else
                                {
                                    chair.Alias = Constants.ALIAS_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                                }
                            }
                            chair.Id = ++lastChairId;
                            chair.DepartmentId = lastDepartmentId;
                            chairs.Add(chair);
                        }
                        else if (columnIndex == specializationColumnIndex)
                        {
                            List<string> content = GetContent(currentReadedValue);
                            Specialization specialization = new Specialization();
                            if (content.Count >= 1 && null != content[0] && !content[0].Trim().Equals(String.Empty))
                            {
                                specialization.Title = content[0];
                            }
                            else
                            {
                                specialization.Title = Constants.STRING_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff"); ;
                            }

                            if (content.Count >= 2 && null != content[1] && !content[1].Trim().Equals(String.Empty))
                            {
                                specialization.Alias = content[1];
                            }
                            else
                            {
                                string alias = Transliteration.Front(specialization.Title);
                                if (null != alias && !alias.Equals(String.Empty))
                                {
                                    specialization.Alias = alias;
                                }
                                else
                                {
                                    specialization.Alias = Constants.ALIAS_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                                }
                            }
                            specialization.Id = ++lastSpecializationId;
                            specialization.ChairId = lastChairId;
                            specialization.EducationPlanId = lastEducationPlanId;
                            specialization.SpecialityId = lastSpecialityId;
                            specializations.Add(specialization);
                        }
                        else
                        {
                            columnIndex++;
                        }
                    }
                    if (columnIndex < maxColumnIndex)
                    {
                        columnIndex++;
                        continue;
                    }
                    else if (rowIndex < maxRowIndex)
                    {
                        columnIndex = 1;
                        rowIndex++;
                        continue;
                    }
                    else
                    {
                        if (null != departmentStructureObj)
                        {
                            departmentStructureObj.Department = department;
                            departmentStructureObj.Specialities = specialities;
                            departmentStructureObj.Chairs = chairs;
                            departmentStructureObj.EducationPlans = educationPlans;
                            departmentStructureObj.Specializations = specializations;

                            departmentStructureList.Add(departmentStructureObj);
                        }
                        break;
                    }
                }
            }
            excelParser.Close();
            return departmentStructureList;
        }
    }
}
