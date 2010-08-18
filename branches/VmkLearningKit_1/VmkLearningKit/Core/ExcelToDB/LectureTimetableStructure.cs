using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Models.Repository;
using VmkLearningKit.Core;

namespace VmkLearningKit.Core.ExcelToDB
{
    public class LectureTimetableStructureObj
    {
        public SpecialityDiscipline SpecialityDiscipline;
        public List<Professor> Professors;
        public List<LectureTimetable> LectureTimetables;

        public void Commit()
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;

            long specialityDisciplineIdBeforeCommit = SpecialityDiscipline.Id;
            SpecialityDiscipline specialityDisciplineFromDB = repositoryManager.GetSpecialityDisciplineRepository.GetByTitle(SpecialityDiscipline.Title);
            if (null != specialityDisciplineFromDB)
            {
                foreach (LectureTimetable lectureTimetable in LectureTimetables)
                {
                    if (lectureTimetable.SpecialityDisciplineId == specialityDisciplineIdBeforeCommit)
                    {
                        foreach (Professor professor in Professors)
                        {
                            long professorBeforeCommit = professor.User.Id;
                            if (lectureTimetable.ProfessorId == professorBeforeCommit)
                            {
                                Professor professorFromDB = repositoryManager.GetProfessorRepository.GetByFullName(professor.User.SecondName);
                                if (null != professorFromDB)
                                {
                                    LectureTimetable lectureTimetableCopy = Utility.Copy(lectureTimetable);
                                    lectureTimetableCopy.SpecialityDisciplineId = specialityDisciplineFromDB.Id;
                                    lectureTimetableCopy.ProfessorId = professorFromDB.UserId;
                                    /*
                                    LectureTimetable lectureTimetableFromDB = repositoryManager.GetLectureTimetableRepository.GetBySpecialityDisciplineId(specialityDisciplineFromDB.Id);
                                    if (null == lectureTimetableFromDB)
                                    {
                                    */ 
                                        LectureTimetable lectureTimetableFromDB = repositoryManager.GetLectureTimetableRepository.Add(lectureTimetableCopy);
                                        if (null == lectureTimetableFromDB)
                                        {
                                            // FIXME: Can't add lectureTimetable to DB
                                        }
                                    //}
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    public class LectureTimetableStructure
    {
        char[] delimiters = { ' ', ',', ';' };

        public LectureTimetableStructure() { }

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
                string building = String.Empty;
                string room = String.Empty;
                if (null != list && list.Count >= 1 && !list[0].Trim().Equals(String.Empty))
                {
                    room = list[0];
                    result.Add(room);
                }
                if (null != list && list.Count >= 2 && !list[1].Trim().Equals(String.Empty))
                {
                    building = list[1];
                    result.Add(building);
                }
            }
            catch (Exception ex)
            {
                // FIXME: add some handler
            }

            return result;
        }

        public List<LectureTimetableStructureObj> FromFile(string filePath)
        {
            List<LectureTimetableStructureObj> lectureTimetableStructureList = null;
            ExcelParser excelParser = ExcelParser.GetExcelParser(filePath);
            if (null != excelParser)
            {
                excelParser.Open();
                excelParser.SetWorkPage(1);

                lectureTimetableStructureList = new List<LectureTimetableStructureObj>();
                LectureTimetableStructureObj lectureTimetableStructureObj = null;
                SpecialityDiscipline specialityDiscipline = null;
                List<LectureTimetable> lectureTimetables = null;
                List<Professor> professors = null;

                string day = String.Empty;
                string time = String.Empty;
                string room = String.Empty;
                string building = String.Empty;
                string week = String.Empty;

                string currentReadedValue = String.Empty;
                int rowIndex = 1;
                int columnIndex = 1;
                int maxColumnIndex = 100; // excelParser.GetMaxColumnCount();
                int maxRowIndex = 1000; // excelParser.GetMaxRowCount();
                long specialityDisciplineIndex = -1;
                long lastSpecialityDisciplineId = RepositoryManager.GetRepositoryManager.GetSpecialityDisciplineRepository.GetMaxId() + 1;
                long lastLectureTimetableId = RepositoryManager.GetRepositoryManager.GetLectureTimetableRepository.GetMaxId() + 1;
                long lastProfessorId = RepositoryManager.GetRepositoryManager.GetProfessorRepository.GetMaxId() + 1;
                long professorIndex = -1;
                long dayIndex = -1;
                long timeIndex = -1;
                long roomIndex = -1;
                long weekIndex = -1;

                while (true)
                {
                    currentReadedValue = excelParser.GetCell(rowIndex, columnIndex);
                    switch (currentReadedValue.Trim())
                    {
                        case "Название дисциплины":
                            {
                                specialityDisciplineIndex = columnIndex;
                                maxColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                                break;
                            }
                        case "Преподаватель":
                            {
                                professorIndex = columnIndex;
                                maxColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                                break;
                            }
                        case "День недели":
                            {
                                dayIndex = columnIndex;
                                maxColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                                break;
                            }
                        case "Время":
                            {
                                timeIndex = columnIndex;
                                maxColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                                break;
                            }
                        case "Аудитория":
                            {
                                roomIndex = columnIndex;
                                maxColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                                break;
                            }
                        case "Неделя":
                            {
                                weekIndex = columnIndex;
                                maxColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                                break;
                            }
                    }
                    if (!currentReadedValue.Trim().Equals(String.Empty))
                    {
                        if (columnIndex == specialityDisciplineIndex)
                        {
                            if (null != lectureTimetableStructureObj)
                            {
                                lectureTimetableStructureObj.SpecialityDiscipline = specialityDiscipline;
                                lectureTimetableStructureObj.LectureTimetables = lectureTimetables;
                                lectureTimetableStructureObj.Professors = professors;

                                lectureTimetableStructureList.Add(lectureTimetableStructureObj);
                            }
                            lectureTimetableStructureObj = new LectureTimetableStructureObj();
                            specialityDiscipline = new SpecialityDiscipline();
                            professors = new List<Professor>();
                            lectureTimetables = new List<LectureTimetable>();

                            specialityDiscipline.Id = ++lastSpecialityDisciplineId;
                            specialityDiscipline.Title = currentReadedValue;

                            // новая дисциплина, обнуляем старые значения
                            day = String.Empty;
                            time = String.Empty;
                            room = String.Empty;
                            building = String.Empty;
                            week = String.Empty;
                        }
                        else if (columnIndex == professorIndex)
                        {
                            Professor professor = new Professor();
                            professor.User = new User();
                            professor.User.Id = ++lastProfessorId;
                            professor.User.SecondName = currentReadedValue;

                            professors.Add(professor);
                        }
                        else if (columnIndex == dayIndex)
                        {
                            day = currentReadedValue;
                        }
                        else if (columnIndex == timeIndex)
                        {
                            time = currentReadedValue;
                        }
                        else if (columnIndex == roomIndex)
                        {
                            List<string> content = GetContent(currentReadedValue);
                            if (null != content && content.Count >= 1)
                            {
                                room = content[0];
                            }
                            if (null != content && content.Count >= 2)
                            {
                                building = content[1];
                            }
                            else if (null != room && !room.Trim().Equals(String.Empty))
                            {
                                // занятия по-умолчанию проводятся во втором корпусе
                                building = "2";
                            }

                            if (null == content || content.Count == 0)
                            {
                                room = String.Empty;
                                building = String.Empty;
                            }
                        }
                        else if (columnIndex == weekIndex)
                        {
                            week = currentReadedValue;
                            if (null != day && !day.Trim().Equals(String.Empty) &&
                                null != time && !time.Trim().Equals(String.Empty) &&
                                null != week && !week.Trim().Equals(String.Empty))
                            {
                                LectureTimetable lectureTimetable = new LectureTimetable();
                                lectureTimetable.Id = ++lastLectureTimetableId;
                                lectureTimetable.ProfessorId = lastProfessorId;
                                lectureTimetable.SpecialityDisciplineId = lastSpecialityDisciplineId;
                                lectureTimetable.Day = day;
                                lectureTimetable.Time = time;
                                try
                                {
                                    if (null != room && !room.Trim().Equals(String.Empty))
                                    {
                                        lectureTimetable.Room = Convert.ToInt16(room);
                                    }
                                    else { lectureTimetable.Room = 0; }

                                    if (null != building && !building.Trim().Equals(String.Empty))
                                    {
                                        lectureTimetable.Building = Convert.ToInt16(building);
                                    }
                                    else { lectureTimetable.Building = 0; }
                                }
                                catch (Exception ex)
                                {
                                    lectureTimetable.Room = 0;
                                    lectureTimetable.Building = 0;
                                    Utility.WriteToLog("!!!!IMPORTANT: LectureTimetableParser: Can't convert room and building string to short: room = " + room + " building = " + building, ex);
                                }
                                lectureTimetable.Week = week;

                                lectureTimetables.Add(lectureTimetable);
                            }
                        }
                       /*
                        else
                        {
                            columnIndex++;
                        }
                        */
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
                        if (null != lectureTimetableStructureObj)
                        {
                            lectureTimetableStructureObj.SpecialityDiscipline = specialityDiscipline;
                            lectureTimetableStructureObj.LectureTimetables = lectureTimetables;
                            lectureTimetableStructureObj.Professors = professors;

                            lectureTimetableStructureList.Add(lectureTimetableStructureObj);
                        }
                        break;
                    }
                }
            }
            excelParser.Close();
            return lectureTimetableStructureList;
        }
    }
}
