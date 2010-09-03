using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.Schema;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core.XmlConverter
{
    public class XmlSheduleParser : XmlAbstractParser
    {
        public XmlSheduleParser(string schemaUrl) :
            base(schemaUrl)
        {
        }

        public override bool ValidateData(string xmlUrl)
        {
            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);

            xmlReader.WhitespaceHandling = WhitespaceHandling.None;

            string professorName            = String.Empty,
                   professorLastName        = String.Empty,
                   professorFirstNameShort  = String.Empty,
                   professorPatronymicShort = String.Empty,
                   specialityAbbreviation   = String.Empty,
                   disciplineAbbreviation   = String.Empty,
                   groupNumber              = String.Empty,
                   dayOfWeek                = String.Empty,
                   week                     = String.Empty;

            string[] professorData;

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_SPECIALITY))
                {
                    specialityAbbreviation = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_ABBREVIATION).Trim();

                    if (null == repositoryManager.GetSpecialityRepository.GetByAbbreviation(specialityAbbreviation))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_SPECIALITY, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_DISCIPLINE))
                {
                    disciplineAbbreviation = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_ABBREVIATION).Trim();

                    if (null == repositoryManager.GetSpecialityDisciplineRepository.GetByAbbreviation(disciplineAbbreviation))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_DISCIPLINE, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_LECTIONS))
                {
                    professorName = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TEACHER).Trim();
                    professorData = professorName.Split(' ', '.');

                    if (4 == professorData.Length)
                    {
                        professorLastName           = professorData[0].ToLower();
                        professorFirstNameShort     = professorData[1].ToLower();
                        professorPatronymicShort    = professorData[2].ToLower();

                        User professor = repositoryManager.GetUserRepository.GetByLogin(Transliteration.Front(professorLastName, TransliterationType.ISO) +
                                                                                        "." +
                                                                                        Transliteration.Front(professorFirstNameShort, TransliterationType.ISO) +
                                                                                        "." +
                                                                                        Transliteration.Front(professorPatronymicShort, TransliterationType.ISO));

                        if (null == professor)
                        {
                            XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_PROFESSOR, xmlReader.LineNumber, xmlReader.LinePosition));
                        }
                        else
                        {
                            SpecialityDiscipline discipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAbbreviation(disciplineAbbreviation); 

                            if (discipline != null && !repositoryManager.GetSpecialityDisciplinesProfessorRepository.Exist(professor.Id, discipline.Id))
                            {
                                XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_PROFESSOR_OF_DISCIPLINE, xmlReader.LineNumber, xmlReader.LinePosition));
                            }
                        }
                    }
                    else
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_VALID_FORMAT, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_GROUP))
                {
                    groupNumber = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_NUMBER).Trim();

                    if (null == repositoryManager.GetGroupRepository.GetByTitle(groupNumber))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_GROUP, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_LECTION))
                {
                    dayOfWeek = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_DAY_OF_WEEK).Trim();
                    week      = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_WEEK).Trim();

                    if (dayOfWeek != Constants.DAY_MONDAY &&
                        dayOfWeek != Constants.DAY_TUESDAY &&
                        dayOfWeek != Constants.DAY_WEDNESDAY &&
                        dayOfWeek != Constants.DAY_THURSDAY &&
                        dayOfWeek != Constants.DAY_FRIDAY &&
                        dayOfWeek != Constants.DAY_SATURDAY &&
                        dayOfWeek != Constants.DAY_SUNDAY)
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_DAY_OF_WEEK, xmlReader.LineNumber, xmlReader.LinePosition));
                    }

                    if (week != VLKConstants.DOWN_WEEK &&
                        week != VLKConstants.EVERY_WEEK &&
                        week != VLKConstants.UP_WEEK)
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_WEEK, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_PRACTICE))
                {
                    professorName = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TEACHER).Trim();
                    professorData = professorName.Split(' ', '.');

                    if (4 == professorData.Length)
                    {
                        professorLastName           = professorData[0].ToLower();
                        professorFirstNameShort     = professorData[1].ToLower();
                        professorPatronymicShort    = professorData[2].ToLower();

                        User professor = repositoryManager.GetUserRepository.GetByLogin(Transliteration.Front(professorLastName, TransliterationType.ISO) +
                                                                                        "." +
                                                                                        Transliteration.Front(professorFirstNameShort, TransliterationType.ISO) +
                                                                                        "." +
                                                                                        Transliteration.Front(professorPatronymicShort, TransliterationType.ISO));

                        if (null == professor)
                        {
                            XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_PROFESSOR, xmlReader.LineNumber, xmlReader.LinePosition));
                        }
                        else
                        {
                            SpecialityDiscipline discipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAbbreviation(disciplineAbbreviation);

                            if (discipline != null && !repositoryManager.GetSpecialityDisciplinesProfessorRepository.Exist(professor.Id, discipline.Id))
                            {
                                XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_PROFESSOR_OF_DISCIPLINE, xmlReader.LineNumber, xmlReader.LinePosition));
                            }
                        }
                    }
                    else
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_PROFESSOR, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                    
                    dayOfWeek = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_DAY_OF_WEEK).Trim();
                    week      = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_WEEK).Trim();

                    if (dayOfWeek != Constants.DAY_MONDAY &&
                        dayOfWeek != Constants.DAY_TUESDAY &&
                        dayOfWeek != Constants.DAY_WEDNESDAY &&
                        dayOfWeek != Constants.DAY_THURSDAY &&
                        dayOfWeek != Constants.DAY_FRIDAY &&
                        dayOfWeek != Constants.DAY_SATURDAY &&
                        dayOfWeek != Constants.DAY_SUNDAY)
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_DAY_OF_WEEK, xmlReader.LineNumber, xmlReader.LinePosition));
                    }

                    if (week != VLKConstants.DOWN_WEEK &&
                        week != VLKConstants.EVERY_WEEK &&
                        week != VLKConstants.UP_WEEK)
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_WEEK, xmlReader.LineNumber, xmlReader.LinePosition));
                    }

                    groupNumber = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_GROUP_NUMBER).Trim();

                    if (null == repositoryManager.GetGroupRepository.GetByTitle(groupNumber))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_GROUP, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_LAB))
                {
                    professorName = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TEACHER).Trim();
                    professorData = professorName.Split(' ', '.');

                    if (4 == professorData.Length)
                    {
                        professorLastName           = professorData[0].ToLower();
                        professorFirstNameShort     = professorData[1].ToLower();
                        professorPatronymicShort    = professorData[2].ToLower();

                        User professor = repositoryManager.GetUserRepository.GetByLogin(Transliteration.Front(professorLastName, TransliterationType.ISO) +
                                                                                        "." +
                                                                                        Transliteration.Front(professorFirstNameShort, TransliterationType.ISO) +
                                                                                        "." +
                                                                                        Transliteration.Front(professorPatronymicShort, TransliterationType.ISO));

                        if (null == professor)
                        {
                            XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_PROFESSOR, xmlReader.LineNumber, xmlReader.LinePosition));
                        }
                        else
                        {
                            SpecialityDiscipline discipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAbbreviation(disciplineAbbreviation);

                            if (discipline != null && !repositoryManager.GetSpecialityDisciplinesProfessorRepository.Exist(professor.Id, discipline.Id))
                            {
                                XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_PROFESSOR_OF_DISCIPLINE, xmlReader.LineNumber, xmlReader.LinePosition));
                            }
                        }
                    }
                    else
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_PROFESSOR, xmlReader.LineNumber, xmlReader.LinePosition));
                    }

                    dayOfWeek   = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_DAY_OF_WEEK).Trim();
                    week        = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_WEEK).Trim();

                    if (dayOfWeek != Constants.DAY_MONDAY &&
                        dayOfWeek != Constants.DAY_TUESDAY &&
                        dayOfWeek != Constants.DAY_WEDNESDAY &&
                        dayOfWeek != Constants.DAY_THURSDAY &&
                        dayOfWeek != Constants.DAY_FRIDAY &&
                        dayOfWeek != Constants.DAY_SATURDAY &&
                        dayOfWeek != Constants.DAY_SUNDAY)
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_DAY_OF_WEEK, xmlReader.LineNumber, xmlReader.LinePosition));
                    }

                    if (week != VLKConstants.DOWN_WEEK &&
                        week != VLKConstants.EVERY_WEEK &&
                        week != VLKConstants.UP_WEEK)
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_WEEK, xmlReader.LineNumber, xmlReader.LinePosition));
                    }

                    groupNumber = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_GROUP_NUMBER).Trim();

                    if (null == repositoryManager.GetGroupRepository.GetByTitle(groupNumber))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_GROUP, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                }
            }

            if (0 == XmlDataErrorLog.Count)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public override void ParseXml(string xmlUrl)
        {
            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);

            xmlReader.WhitespaceHandling = WhitespaceHandling.None;

            // Извлекаемые данные
            string specialityAbbreviation   = String.Empty,
                   disciplineAbbreviation   = String.Empty,
                   educationPlanTitle       = String.Empty,
                   professorName            = String.Empty,
                   professorLastName        = String.Empty,
                   professorFirstNameShort  = String.Empty,
                   professorPatronymicShort = String.Empty,
                   dayOfWeek                = String.Empty,
                   time                     = String.Empty,
                   week                     = String.Empty,
                   groupNumber              = String.Empty,
                   part                     = String.Empty;
            
            long specialityId   = VLKConstants.FAKE_VALUE,
                 disciplineId   = VLKConstants.FAKE_VALUE,
                 professorId    = VLKConstants.FAKE_VALUE;

            short building   = 0,
                  room       = 0;

            string[] professorData;

            List<string> groupNumbers = new List<string>();

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_SPECIALITY))
                {
                    specialityAbbreviation  = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_ABBREVIATION).Trim();
                    specialityId            = repositoryManager.GetSpecialityRepository.GetByAbbreviation(specialityAbbreviation).Id;
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_DISCIPLINE))
                {
                    groupNumbers.Clear();

                    disciplineAbbreviation  = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_ABBREVIATION).Trim();
                    disciplineId            = repositoryManager.GetSpecialityDisciplineRepository.GetByAbbreviation(disciplineAbbreviation).Id;
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_GROUP))
                {
                    groupNumber = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_NUMBER).Trim();

                    groupNumbers.Add(groupNumber);
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_LECTIONS))
                {
                    professorName = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TEACHER).Trim();
                    professorData = professorName.Split(' ', '.');

                    professorLastName           = professorData[0].ToLower();
                    professorFirstNameShort     = professorData[1].ToLower();
                    professorPatronymicShort    = professorData[2].ToLower();

                    professorId = repositoryManager.GetUserRepository.GetByLogin(Transliteration.Front(professorLastName, TransliterationType.ISO) +
                                                                                 "." +
                                                                                 Transliteration.Front(professorFirstNameShort, TransliterationType.ISO) +
                                                                                 "." +
                                                                                 Transliteration.Front(professorPatronymicShort, TransliterationType.ISO)).Id;
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_LECTION))
                {
                    dayOfWeek   = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_DAY_OF_WEEK).Trim();
                    week        = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_WEEK).Trim();
                    time        = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TIME);
                    part        = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_PART);

                    room        = Convert.ToInt16(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_ROOM));
                    building    = Convert.ToInt16(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_BUILDING));

                    LectureTimetable lectureTimetable = new LectureTimetable();
                    lectureTimetable.Building               = building;
                    lectureTimetable.Day                    = dayOfWeek;
                    lectureTimetable.ProfessorId            = professorId;
                    lectureTimetable.Room                   = room;
                    lectureTimetable.SpecialityDisciplineId = disciplineId;
                    lectureTimetable.Time                   = time;
                    lectureTimetable.Week                   = week;

                    repositoryManager.GetLectureTimetableRepository.Add(lectureTimetable);

                    long lectureTimetableId = repositoryManager.GetLectureTimetableRepository.Get(disciplineId, dayOfWeek, time).Id;

                    foreach (string groupTitle in groupNumbers)
                    {
                        GroupsLectureTimetable groupLectureTimetable = new GroupsLectureTimetable();

                        groupLectureTimetable.GroupId               = repositoryManager.GetGroupRepository.GetByTitle(groupTitle).Id;
                        groupLectureTimetable.LectureTimetableId    = lectureTimetableId;

                        repositoryManager.GetGroupsLectureTimetableRepository.Add(groupLectureTimetable);
                    }
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_PRACTICE))
                {
                    professorName = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TEACHER).Trim();
                    professorData = professorName.Split(' ', '.');

                    professorLastName = professorData[0].ToLower();
                    professorFirstNameShort = professorData[1].ToLower();
                    professorPatronymicShort = professorData[2].ToLower();

                    professorId = repositoryManager.GetUserRepository.GetByLogin(Transliteration.Front(professorLastName, TransliterationType.ISO) +
                                                                                 "." +
                                                                                 Transliteration.Front(professorFirstNameShort, TransliterationType.ISO) +
                                                                                 "." +
                                                                                 Transliteration.Front(professorPatronymicShort, TransliterationType.ISO)).Id;

                    dayOfWeek = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_DAY_OF_WEEK).Trim();
                    groupNumber = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_GROUP_NUMBER).Trim();
                    week = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_WEEK).Trim();
                    time = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TIME);
                    part = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_PART);

                    room = Convert.ToInt16(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_ROOM));
                    building = Convert.ToInt16(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_BUILDING));

                    PracticeAndLabTimetable practiceAndLabTimetable = new PracticeAndLabTimetable();
                    practiceAndLabTimetable.Building = building;
                    practiceAndLabTimetable.Day = dayOfWeek;
                    practiceAndLabTimetable.GroupId = repositoryManager.GetGroupRepository.GetByTitle(groupNumber).Id;
                    practiceAndLabTimetable.ProfessorId = professorId;
                    practiceAndLabTimetable.Room = room;
                    practiceAndLabTimetable.SpecialityDisciplineId = disciplineId;
                    practiceAndLabTimetable.SpecializationId = repositoryManager.GetSpecializationRepository.GetByAbbreviation(VLKConstants.FIELD_EMPTY + VLKConstants.FIELD_EMPTY + specialityAbbreviation).Id;
                    practiceAndLabTimetable.Time = time;
                    practiceAndLabTimetable.Type = Constants.PRACTICE_TYPE_PRACTICE;
                    practiceAndLabTimetable.Week = week;

                    if (null != part &&
                        !String.Empty.Equals(part))
                    {
                        practiceAndLabTimetable.Part = part;
                    }

                    repositoryManager.GetPracticeAndLabTimetableRepository.Add(practiceAndLabTimetable);


                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_LAB))
                {
                    professorName = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TEACHER).Trim();
                    professorData = professorName.Split(' ', '.');

                    professorLastName = professorData[0].ToLower();
                    professorFirstNameShort = professorData[1].ToLower();
                    professorPatronymicShort = professorData[2].ToLower();

                    professorId = repositoryManager.GetUserRepository.GetByLogin(Transliteration.Front(professorLastName, TransliterationType.ISO) +
                                                                                 "." +
                                                                                 Transliteration.Front(professorFirstNameShort, TransliterationType.ISO) +
                                                                                 "." +
                                                                                 Transliteration.Front(professorPatronymicShort, TransliterationType.ISO)).Id;

                    dayOfWeek = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_DAY_OF_WEEK).Trim();
                    groupNumber = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_GROUP_NUMBER).Trim();
                    week = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_WEEK).Trim();
                    time = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TIME);
                    part = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_PART);

                    room = Convert.ToInt16(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_ROOM));
                    building = Convert.ToInt16(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_BUILDING));

                    PracticeAndLabTimetable practiceAndLabTimetable = new PracticeAndLabTimetable();
                    practiceAndLabTimetable.Building = building;
                    practiceAndLabTimetable.Day = dayOfWeek;
                    practiceAndLabTimetable.GroupId = repositoryManager.GetGroupRepository.GetByTitle(groupNumber).Id;
                    practiceAndLabTimetable.ProfessorId = professorId;
                    practiceAndLabTimetable.Room = room;
                    practiceAndLabTimetable.SpecialityDisciplineId = disciplineId;
                    practiceAndLabTimetable.SpecializationId = repositoryManager.GetSpecializationRepository.GetByAbbreviation(specialityAbbreviation + VLKConstants.FIELD_EMPTY).Id;
                    practiceAndLabTimetable.Time = time;
                    practiceAndLabTimetable.Type = Constants.PRACTICE_TYPE_LAB;
                    practiceAndLabTimetable.Week = week;

                    if (null != part &&
                        !String.Empty.Equals(part))
                    {
                        practiceAndLabTimetable.Part = part;
                    }

                    repositoryManager.GetPracticeAndLabTimetableRepository.Add(practiceAndLabTimetable);
                }
            }
        }
    }
}