using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core.ExcelToDB
{
    public class Term
    {
        public byte term;
        public string value;
    }

    public class SpecialityDisciplineStructureObj
    {
        public Department Department;
        public List<Speciality> Specialities;
        public List<EducationPlan> EducationPlans;
        public List<Chair> Chairs;
        public List<SpecialityDiscipline> SpecialityDisciplines;
        public List<Professor> Professors;
        public List<SpecialityDisciplineTerm> SpecialityDisciplineTerms;

        public void Commit()
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
            long departmentIdBeforeCommit = Department.Id;
            Department departmentFromDB = repositoryManager.GetDepartmentRepository.GetByAbbreviation(Department.Abbreviation);
            
            if (null != departmentFromDB)
            {
                foreach (Speciality speciality in Specialities)
                {
                    if (speciality.DepartmentId == departmentIdBeforeCommit)
                    {
                        long specialityIdBeforeCommit = speciality.Id;
                        Speciality specialityFromDB = repositoryManager.GetSpecialityRepository.GetByAbbreviation(speciality.Abbreviation);
                        if (null != specialityFromDB)
                        {
                            foreach (EducationPlan educationPlan in EducationPlans)
                            {
                                long educationPlanIdBeforeCommit = educationPlan.Id;
                                EducationPlan educationPlanFromDB = repositoryManager.GetEducationPlanRepository.GetByTitle(educationPlan.Title);
                                if (null != educationPlanFromDB)
                                {
                                    foreach (Chair chair in Chairs)
                                    {
                                        if (chair.DepartmentId == departmentIdBeforeCommit)
                                        {
                                            long chairIdBeforeCommit = chair.Id;
                                            Chair chairFromDB = repositoryManager.GetChairRepository.GetByAbbreviation(chair.Abbreviation);
                                            if (null != chairFromDB)
                                            {
                                                foreach (Professor professor in Professors)
                                                {
                                                    if (professor.ChairId == chairIdBeforeCommit)
                                                    {
                                                        Professor professorCopy = Utility.Copy(professor);
                                                        professorCopy.ChairId = chairFromDB.Id;
                                                        long userIdBeforeCommit = professor.User.Id;
                                                        Professor professorFromDB = null;

                                                        User userFromDB = repositoryManager.GetUserRepository.GetByLogin(professor.User.Login);
                                                        if (null == userFromDB)
                                                        {
                                                            userFromDB = repositoryManager.GetUserRepository.Add(professorCopy.User);
                                                            if (null != userFromDB)
                                                            {
                                                                professorCopy.UserId = userFromDB.Id;
                                                                professorFromDB = repositoryManager.GetProfessorRepository.Add(professorCopy);
                                                            }
                                                        }
                                                        else
                                                        {
                                                            professorFromDB = repositoryManager.GetProfessorRepository.GetById(userFromDB.Id);
                                                            if (null == professorFromDB)
                                                            {
                                                                professorCopy.UserId = userFromDB.Id;
                                                                professorFromDB = repositoryManager.GetProfessorRepository.Add(professorCopy);
                                                            }
                                                        }
                                                        if (null != professorFromDB)
                                                        {
                                                            foreach (SpecialityDiscipline specialityDiscipline in SpecialityDisciplines)
                                                            {
                                                                if (specialityDiscipline.ChairId == chairIdBeforeCommit &&
                                                                   specialityDiscipline.EducationPlanId == educationPlanIdBeforeCommit &&
                                                                   specialityDiscipline.SpecialityId == specialityIdBeforeCommit &&
                                                                   specialityDiscipline.ProfessorId == userIdBeforeCommit)
                                                                {
                                                                    long specialityDisciplineIdBeforeCommit = specialityDiscipline.Id;

                                                                    SpecialityDiscipline specialityDisciplineFromDB = repositoryManager.GetSpecialityDisciplineRepository.GetByAlias(specialityDiscipline.Alias);
                                                                    if (null == specialityDisciplineFromDB)
                                                                    {
                                                                        SpecialityDiscipline specialityDisciplineCopy = Utility.Copy(specialityDiscipline);

                                                                        specialityDisciplineCopy.ChairId = chairFromDB.Id;
                                                                        specialityDisciplineCopy.EducationPlanId = educationPlanFromDB.Id;
                                                                        specialityDisciplineCopy.ProfessorId = professorFromDB.User.Id;
                                                                        specialityDisciplineCopy.SpecialityId = specialityFromDB.Id;
                                                                        specialityDisciplineFromDB = repositoryManager.GetSpecialityDisciplineRepository.Add(specialityDisciplineCopy);
                                                                        if (null != specialityDisciplineFromDB)
                                                                        {
                                                                            foreach (SpecialityDisciplineTerm specialityDisciplineTerm in SpecialityDisciplineTerms)
                                                                            {
                                                                                if (specialityDisciplineTerm.SpecialityDisciplineId == specialityDisciplineIdBeforeCommit)
                                                                                {
                                                                                    SpecialityDisciplineTerm specialityDisciplineTermCopy = Utility.Copy(specialityDisciplineTerm);
                                                                                    specialityDisciplineTermCopy.SpecialityDisciplineId = specialityDisciplineFromDB.Id;

                                                                                    SpecialityDisciplineTerm specialityDisciplineTermFromDB = repositoryManager.GetSpecialityDisciplineTermRepository.Add(specialityDisciplineTermCopy);
                                                                                    if (null == specialityDisciplineTermFromDB)
                                                                                    {
                                                                                        // FIXME: can't add to db
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    public class SpecialityDisciplineStructure
    {
        char[] delimiters = { ' ', ',', ';' };

        public SpecialityDisciplineStructure() { }

        private List<Term> ParseTerm(string str)
        {
            List<Term> result = new List<Term>();
            Term term = null;
            string[] termParts = str.Split(',');
            if (null != termParts && termParts.Length > 0)
            {
                foreach (string termPart in termParts)
                {
                    string[] parts = termPart.Split(':');
                    term = new Term();
                    if (parts.Length >= 1 && null != parts[0] && !parts[0].Trim().Equals(String.Empty))
                    {
                        try
                        {
                            term.term = Convert.ToByte(parts[0]);
                        }
                        catch (Exception ex)
                        {
                            Utility.WriteToLog("SpecialityDisciplineStructure.ParseTerm: convert string to byte failed", ex);
                        }
                    }
                    if (parts.Length >= 2 && null != parts[1] && !parts[1].Trim().Equals(String.Empty))
                    {
                        term.value = parts[1];
                    }
                    result.Add(term);
                }
            }
            return result;
        }

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
                    alias = list[1];
                }
                else if (list.Count >= 1 && null != title && !title.Trim().Equals(String.Empty))
                {
                    alias = Transliteration.Front(title, TransliterationType.ISO);
                }
                result.Add(title);
                result.Add(alias);
            }
            catch (Exception ex)
            {
                // FIXME: add some handler
            }

            return result;
        }

        public List<SpecialityDisciplineStructureObj> FromFile(string filePath)
        {
            ExcelParser excelParser = ExcelParser.GetExcelParser(filePath);
            List<SpecialityDisciplineStructureObj> specialityDisciplineStructureList = null;
            if (null != excelParser)
            {
                excelParser.Open();
                excelParser.SetWorkPage(1);

                specialityDisciplineStructureList = new List<SpecialityDisciplineStructureObj>();
                SpecialityDisciplineStructureObj specialityDisciplineStructureObj = null;
                Department department = null;
                List<Speciality> specialities = null;
                List<EducationPlan> educationPlans = null;
                List<Chair> chairs = null;
                string category = null;
                List<SpecialityDiscipline> specialityDisciplines = null;
                SpecialityDiscipline specialityDiscipline = null;
                //SpecialityDisciplineTerm specialityDisciplineTerm = null;
                //Professor professor = null;
                List<Professor> professors = null;
                List<SpecialityDisciplineTerm> specialityDisciplineTerms = null;

                string currentReadedValue = String.Empty;
                int rowIndex = 1;
                int columnIndex = 1;
                int maxColumnIndex = 100; // excelParser.GetMaxColumnCount();
                int maxRowIndex = 100; // excelParser.GetMaxRowCount();
                long departmentColumnIndex = -1;
                long lastDepartmentId = RepositoryManager.GetRepositoryManager.GetDepartmentRepository.GetMaxId() + 1;
                long specialityColumnIndex = -1;
                long lastSpecialityId = RepositoryManager.GetRepositoryManager.GetSpecialityRepository.GetMaxId() + 1;
                long educationPlanColumnIndex = -1;
                long lastEducationPlanId = RepositoryManager.GetRepositoryManager.GetEducationPlanRepository.GetMaxId() + 1;
                long categoryColumnIndex = -1;
                long specialityDisciplineColumnIndex = -1;
                long lastSpecialityDisciplineId = RepositoryManager.GetRepositoryManager.GetSpecialityDisciplineRepository.GetMaxId() + 1;
                long lectionVolumeColumnIndex = -1;
                long practiceVolumeColumnIndex = 1;
                long labVolumeColumnIndex = -1;
                long termColumnIndex = -1;
                long lastSpecialityDisciplineTermId = RepositoryManager.GetRepositoryManager.GetSpecialityDisciplineTermRepository.GetMaxId() + 1;
                long reportingColumnIndex = -1;
                long chairColumnIndex = -1;
                long lastChairId = 0; //RepositoryManager.GetRepositoryManager.GetChairRepository.GetMaxId() + 1;

                long professorFIOColumnIndex = -1;
                long professorDegreeColumnIndex = -1;
                long professorPositionColumnIndex = -1;
                long lastProfessorId = RepositoryManager.GetRepositoryManager.GetProfessorRepository.GetMaxId() + 1;

                Random rndPasswd = new Random(DateTime.Now.Millisecond);

                while (true)
                {
                    currentReadedValue = excelParser.GetCell(rowIndex, columnIndex);
                    //currentReadedValue = currentReadedValue.ToLower();
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
                        case "Категория":
                            {
                                categoryColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Название дисциплины":
                            {
                                specialityDisciplineColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Часов в неделю: лекций":
                            {
                                lectionVolumeColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Часов в неделю: практик":
                            {
                                practiceVolumeColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Часов в неделю: лабораторных работ":
                            {
                                labVolumeColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Семестр":
                            {
                                termColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Отчетность":
                            {
                                reportingColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Кафедра":
                            {
                                chairColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "ФИО преподавателя":
                            {
                                professorFIOColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Ученая степень преподавателя":
                            {
                                professorDegreeColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Звание преподавателя":
                            {
                                professorPositionColumnIndex = columnIndex;
                                maxColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                    }
                    //if (!currentReadedValue.Trim().Equals(String.Empty))
                    {
                        if (columnIndex == departmentColumnIndex)
                        {
                            if (!currentReadedValue.Trim().Equals(String.Empty))
                            {
                                if (null != specialityDisciplineStructureObj)
                                {
                                    specialityDisciplineStructureObj.Department = department;
                                    specialityDisciplineStructureObj.Specialities = specialities;
                                    specialityDisciplineStructureObj.EducationPlans = educationPlans;
                                    specialityDisciplineStructureObj.Chairs = chairs;
                                    specialityDisciplineStructureObj.SpecialityDisciplines = specialityDisciplines;
                                    specialityDisciplineStructureObj.Professors = professors;
                                    specialityDisciplineStructureObj.SpecialityDisciplineTerms = specialityDisciplineTerms;

                                    specialityDisciplineStructureList.Add(specialityDisciplineStructureObj);
                                }
                                specialityDisciplineStructureObj = new SpecialityDisciplineStructureObj();
                                department = new Department();
                                specialities = new List<Speciality>();
                                educationPlans = new List<EducationPlan>();
                                chairs = new List<Chair>();
                                specialityDisciplines = new List<SpecialityDiscipline>();
                                professors = new List<Professor>();
                                specialityDisciplineTerms = new List<SpecialityDisciplineTerm>();

                                department.Abbreviation = currentReadedValue;
                                department.Id = ++lastDepartmentId;
                                specialityDisciplineStructureObj.Department = department;
                            }
                        }
                        else if (columnIndex == specialityColumnIndex)
                        {
                            if (!currentReadedValue.Trim().Equals(String.Empty))
                            {
                                Speciality speciality = new Speciality();
                                speciality.Abbreviation = currentReadedValue;
                                speciality.Id = ++lastSpecialityId;
                                speciality.DepartmentId = lastDepartmentId;
                                specialities.Add(speciality);
                            }
                        }
                        else if (columnIndex == educationPlanColumnIndex)
                        {
                            if (!currentReadedValue.Trim().Equals(String.Empty))
                            {
                                EducationPlan educationPlan = new EducationPlan();
                                educationPlan.Title = currentReadedValue;
                                educationPlan.Id = ++lastEducationPlanId;
                                educationPlans.Add(educationPlan);
                            }
                        }
                        else if (columnIndex == categoryColumnIndex)
                        {
                            if (!currentReadedValue.Trim().Equals(String.Empty))
                            {
                                category = currentReadedValue;
                            }
                        }
                        else if (columnIndex == chairColumnIndex)
                        {
                            Chair chair = new Chair();
                            if(null != currentReadedValue && !currentReadedValue.Trim().Equals(String.Empty))
                            {
                                chair.Abbreviation = currentReadedValue;
                            }
                            else
                            {
                                chair.Abbreviation = Constants.DEFAULT_CHAIR_NAME;
                            }
                            // not increment, increment is done in specialityDiscipline section
                            chair.Id = lastChairId;
                            chair.DepartmentId = lastDepartmentId;
                            
                            chairs.Add(chair);
                        }
                        else if (columnIndex == specialityDisciplineColumnIndex)
                        {
                            if (!currentReadedValue.Trim().Equals(String.Empty))
                            {
                                specialityDiscipline = new SpecialityDiscipline();
                                List<string> content = GetContent(currentReadedValue);
                                if (content.Count >= 1 && null != content[0] && !content[0].Trim().Equals(String.Empty))
                                {
                                    specialityDiscipline.Title = content[0];
                                }
                                else
                                {
                                    specialityDiscipline.Title = Constants.STRING_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                                }
                                if (content.Count >= 2 && null != content[1] && !content[1].Trim().Equals(String.Empty))
                                {
                                    specialityDiscipline.Alias = content[1];
                                }
                                else
                                {
                                    specialityDiscipline.Alias = Constants.ALIAS_DEFAULT_VALUE + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                                }

                                string specialityDisciplineAbbreviation = excelParser.GetCell(rowIndex, columnIndex + 1);
                                if (null != specialityDisciplineAbbreviation &&
                                    !specialityDisciplineAbbreviation.Trim().Equals(String.Empty))
                                {
                                    specialityDiscipline.Alias = specialityDisciplineAbbreviation;
                                }
                                else
                                {
                                    specialityDisciplineAbbreviation = String.Empty;
                                    string[] titleParts = specialityDiscipline.Title.Split(' ', '-');
                                    if(null != titleParts && titleParts.Length > 0)
                                    {
                                        foreach(string titlePart in titleParts)
                                        {
                                            if(null != titlePart && !titlePart.Trim().Equals(String.Empty))
                                            {
                                                specialityDisciplineAbbreviation += titlePart[0].ToString().ToUpper();
                                            }
                                        }
                                    }
                                    specialityDiscipline.Alias = specialityDisciplineAbbreviation;
                                }

                                specialityDiscipline.Category = SpecialityDisciplineCategory.GetCategoryString(category);

                                specialityDiscipline.Id = ++lastSpecialityDisciplineId;
                                specialityDiscipline.SpecialityId = lastSpecialityId;
                                specialityDiscipline.EducationPlanId = lastEducationPlanId;
                                // chair must be before specialityDiscipline, but it is after in excel file
                                // so we need to increment it here
                                specialityDiscipline.ChairId = ++lastChairId;
                            }
                            else
                            {
                                columnIndex += maxColumnIndex;
                            }
                        }
                        else if (columnIndex == lectionVolumeColumnIndex)
                        {
                            string lectionVolume = currentReadedValue;
                            string practiceVolume = excelParser.GetCell(rowIndex, columnIndex + 1);
                            string labVolume = excelParser.GetCell(rowIndex, columnIndex + 2);
                            string term = excelParser.GetCell(rowIndex, columnIndex + 3);
                            string reporting = excelParser.GetCell(rowIndex, columnIndex + 4);
                            columnIndex += 4;

                            List<Term> termLectionVolumes = null;
                            List<Term> termPracticeVolumes = null;
                            List<Term> termLabVolumes = null;
                            List<Term> terms = null;
                            List<Term> termReportings = null;
                            int maxLength = 0;
                            if(null != lectionVolume && !lectionVolume.Trim().Equals(String.Empty) && !lectionVolume.Equals("0"))
                            {
                                termLectionVolumes = ParseTerm(lectionVolume);
                                maxLength = Math.Max(maxLength, termLectionVolumes.Count);
                            }

                            if (null != practiceVolume && !practiceVolume.Trim().Equals(String.Empty) && !practiceVolume.Equals("0"))
                            {
                                termPracticeVolumes = ParseTerm(practiceVolume);
                                maxLength = Math.Max(maxLength, termPracticeVolumes.Count);
                            }

                            if (null != labVolume && !labVolume.Trim().Equals(String.Empty) && !labVolume.Equals("0"))
                            {
                                termLabVolumes = ParseTerm(labVolume);
                                maxLength = Math.Max(maxLength, termLabVolumes.Count);
                            }

                            if(null != term && !term.Trim().Equals(String.Empty))
                            {
                                terms = ParseTerm(term);
                                maxLength = Math.Max(maxLength, terms.Count);
                            }

                            if(null != reporting && !reporting.Trim().Equals(String.Empty))
                            {
                                termReportings = ParseTerm(reporting);
                                maxLength = Math.Max(maxLength, termReportings.Count);
                            }

                            for(int ind = 0; ind < maxLength; ind++)
                            {
                                SpecialityDisciplineTerm specialityDisciplineTerm = new SpecialityDisciplineTerm();
                                specialityDisciplineTerm.Id = ++lastSpecialityDisciplineTermId;
                                specialityDisciplineTerm.SpecialityDisciplineId = lastSpecialityDisciplineId;
                                if(null != termLectionVolumes && termLectionVolumes.Count >= ind && null != termLectionVolumes[ind])
                                {
                                    try
                                    {
                                        specialityDisciplineTerm.LectureVolume = Convert.ToInt16(termLectionVolumes[ind].value);
                                    }
                                    catch (Exception ex)
                                    {
                                        specialityDisciplineTerm.LectureVolume = 0;
                                        Utility.WriteToLog("SpecialityDisciplineStructure: convert string to short int failed", ex);
                                    }
                                }
                                else
                                {
                                    specialityDisciplineTerm.LectureVolume = 0;
                                }

                                if (null != termPracticeVolumes && termPracticeVolumes.Count >= ind && null != termPracticeVolumes[ind])
                                {
                                    try
                                    {
                                        specialityDisciplineTerm.PracticeVolume = Convert.ToInt16(termPracticeVolumes[ind].value);
                                    }
                                    catch (Exception ex)
                                    {
                                        specialityDisciplineTerm.LectureVolume = 0;
                                        Utility.WriteToLog("SpecialityDisciplineStructure: convert string to short int failed", ex);
                                    }
                                }
                                else
                                {
                                    specialityDisciplineTerm.PracticeVolume = 0;
                                }

                                if (null != termLabVolumes && termLabVolumes.Count >= ind && null != termLabVolumes[ind])
                                {
                                    try
                                    {
                                        specialityDisciplineTerm.LabVolume = Convert.ToInt16(termLabVolumes[ind].value);
                                    }
                                    catch (Exception ex)
                                    {
                                        specialityDisciplineTerm.LectureVolume = 0;
                                        Utility.WriteToLog("SpecialityDisciplineStructure: convert string to short int failed", ex);
                                    }
                                }
                                else
                                {
                                    specialityDisciplineTerm.LabVolume = 0;
                                }

                                if (null != terms && terms.Count >= ind && null != terms[ind])
                                {
                                    try
                                    {
                                        specialityDisciplineTerm.Term = Convert.ToInt16(terms[ind].term);
                                    }
                                    catch (Exception ex)
                                    {
                                        specialityDisciplineTerm.LectureVolume = Convert.ToInt16(ind + 1);
                                        Utility.WriteToLog("SpecialityDisciplineStructure: convert string to short int failed", ex);
                                    }
                                    
                                }
                                else
                                {
                                    specialityDisciplineTerm.Term = 0;
                                }

                                if (null != termReportings && termReportings.Count >= ind && null != termReportings[ind])
                                {
                                    switch (termReportings[ind].value.ToLower())
                                    {
                                        case "э":
                                            {
                                                specialityDisciplineTerm.Reporting = "Экзамен";
                                                break;
                                            }
                                        case "з":
                                            {
                                                specialityDisciplineTerm.Reporting = "Зачет";
                                                break;
                                            }
                                        case "кр":
                                            {
                                                specialityDisciplineTerm.Reporting = "Кур. раб.";
                                                break;
                                            }
                                        default:
                                            {
                                                specialityDisciplineTerm.Reporting = Constants.TERM_DEFAULT_REPORTING;
                                                break;
                                            }
                                    }
                                }
                                else
                                {
                                    specialityDisciplineTerm.Reporting = Constants.TERM_DEFAULT_REPORTING;
                                }

                                specialityDisciplineTerms.Add(specialityDisciplineTerm);
                            }

                        }
                        /*
                        else if (columnIndex == practiceVolumeColumnIndex)
                        {

                        }
                        else if (columnIndex == labVolumeColumnIndex)
                        {

                        }
                        else if (columnIndex == termColumnIndex)
                        {

                        }
                        else if (columnIndex == reportingColumnIndex)
                        {

                        }
                        */
                        else if (columnIndex == professorFIOColumnIndex)
                        {
                            string professorFIO = currentReadedValue;
                            string professorDegree = excelParser.GetCell(rowIndex, columnIndex + 1);
                            string professorPosition = excelParser.GetCell(rowIndex, columnIndex + 2);
                            columnIndex += 2;

                            Professor professor = new Professor();
                            professor.User = new User();
                            professor.ChairId = lastChairId;
                            if(null != professorFIO && !professorFIO.Trim().Equals(String.Empty))
                            {
                                string[] names = professorFIO.Split(' ');
                                if(null != names && names.Length >= 1 && null != names[0])
                                {
                                    professor.User.SecondName = names[0];
                                }
                                if(null != names && names.Length >= 2 && null != names[1])
                                {
                                    string[] letters = names[1].Trim('.', ' ').Split('.');
                                    if(null != letters && letters.Length == 2)
                                    {
                                        professor.User.FirstName = letters[0];
                                        professor.User.Patronymic = letters[1];
                                    }
                                    else
                                    {
                                        professor.User.FirstName = names[1];
                                    }
                                }
                                if(null != names && names.Length >= 3 && null != names[2])
                                {
                                    professor.User.Patronymic = names[2];
                                }
                            }
                            else
                            {
                                professor.User.FirstName = String.Empty; //Constants.PROFESSOR_DEFAULT_NAME;
                                professor.User.SecondName = Constants.PROFESSOR_DEFAULT_NAME;
                                professor.User.Patronymic = String.Empty; //Constants.PROFESSOR_DEFAULT_NAME;
                            }

                            if (null != professorDegree && !professorDegree.Trim().Equals(String.Empty))
                            {
                                professor.Degree = professorDegree;
                            }
                            else
                            {
                                professor.Degree = Constants.PROFESSOR_DEFAULT_DEGREE;
                            }

                            if (null != professorPosition && !professorPosition.Trim().Equals(String.Empty))
                            {
                                professor.Position = professorPosition;
                            }
                            else
                            {
                                professor.Position = Constants.PROFESSOR_DEFAULT_POSITION;
                            }

                            string userNickName = null;
                            string userLogin = null;
                            if(null != professor.User.FirstName &&
                               !professor.User.FirstName.Trim().Equals(String.Empty) &&
                               null != professor.User.Patronymic &&
                               !professor.User.Patronymic.Trim().Equals(String.Empty))
                            {
                                userNickName = Transliteration.Front(professor.User.SecondName +
                                                       professor.User.FirstName[0].ToString().ToUpper() +
                                                       professor.User.Patronymic[0].ToString().ToUpper());

                                userLogin = Transliteration.Front(professor.User.SecondName.ToLower() +
                                                    "." + professor.User.FirstName[0].ToString().ToLower() +
                                                    "." + professor.User.Patronymic[0].ToString().ToLower());
                            }
                            else
                            {
                                userNickName = Transliteration.Front(professor.User.SecondName +
                                                     "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff"));
                                userLogin = Transliteration.Front(professor.User.SecondName);
                            }

                            if (null != userLogin && !userLogin.Trim().Equals(String.Empty))
                            {
                                professor.User.Login = userLogin;
                            }
                            else
                            {
                                professor.User.Login = Constants.PROFESSOR_DEFAULT_LOGIN;
                            }

                            if (null != userNickName && !userNickName.Trim().Equals(String.Empty))
                            {
                                professor.User.NickName = userNickName;
                            }
                            else
                            {
                                professor.User.NickName = Constants.PROFESSOR_DEFAULT_NICKNAME + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                            }

                            professor.About = Constants.PROFESSOR_DEFAULT_ABOUT;
                            professor.User.Id = ++lastProfessorId;
                            professor.User.Role = Constants.PROFESSOR_ROLE;
                            professor.User.Email = professor.User.Login + Constants.DEFAULT_EMAIL_DOMEN;
                            professor.User.Password = Hash.ComputeHash(rndPasswd.Next(25000, 30000).ToString());
                            professors.Add(professor);

                            specialityDiscipline.ProfessorId = lastProfessorId;
                            specialityDisciplines.Add(specialityDiscipline);
                        }
                        /*
                        else if (columnIndex == professorDegreeColumnIndex)
                        {

                        }
                        else if (columnIndex == professorPositionColumnIndex)
                        {

                        }
                        */
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
                        if (null != specialityDisciplineStructureObj)
                        {
                            specialityDisciplineStructureObj.Department = department;
                            specialityDisciplineStructureObj.Specialities = specialities;
                            specialityDisciplineStructureObj.EducationPlans = educationPlans;
                            specialityDisciplineStructureObj.Chairs = chairs;
                            specialityDisciplineStructureObj.SpecialityDisciplines = specialityDisciplines;
                            specialityDisciplineStructureObj.Professors = professors;
                            specialityDisciplineStructureObj.SpecialityDisciplineTerms = specialityDisciplineTerms;

                            specialityDisciplineStructureList.Add(specialityDisciplineStructureObj);
                        }
                        break;
                    }
                }
            }
            excelParser.Close();
            return specialityDisciplineStructureList;
        }
    }
}
