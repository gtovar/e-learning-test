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
        public override void DeleteNotExisted()
        {
            repositoryManager.GetPracticeAndLabTimetableRepository.DeleteAll(VLKConstants.VMK_DEPARTMENT_ID);
            repositoryManager.GetLectureTimetableRepository.DeleteAll(VLKConstants.VMK_DEPARTMENT_ID);
        }
        
        public XmlSheduleParser(string schemaUrl) :
            base(schemaUrl)
        {
        }

        public override bool ValidateData(string xmlUrl)
        {
            ExistedDataIds.Clear();
            
            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);

            xmlReader.WhitespaceHandling = WhitespaceHandling.None;

            string //professorName            = String.Empty,
                   professorLastName        = String.Empty,
                   //professorFirstNameShort  = String.Empty,
                   //professorPatronymicShort = String.Empty,
                   specialityAbbreviation   = String.Empty,
                   disciplineAbbreviation   = String.Empty,
                   groupNumber              = String.Empty,
                   dayOfWeek                = String.Empty,
                   week                     = String.Empty,
                   type                     = String.Empty;

            //string[] professorData;

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
                     xmlReader.Name.Equals(Constants.XML_ELEMENT_GROUP))
                {
                    groupNumber = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_NUMBER).Trim();

                    if (null == repositoryManager.GetGroupRepository.GetByTitle(groupNumber))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_GROUP, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_PAIR))
                {
                    dayOfWeek = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_DAY_OF_WEEK).Trim();
                    week = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_WEEK).Trim();
                    type = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TYPE).Trim();

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

                    if (type != VLKConstants.TYPE_LAB &&
                        type != VLKConstants.TYPE_LECTION &&
                        type != VLKConstants.TYPE_PRACTICE)
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_TYPE, xmlReader.LineNumber, xmlReader.LinePosition));
                    }

                    disciplineAbbreviation = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_DISCIPLINE).Trim();

                    if (null == repositoryManager.GetSpecialityDisciplineRepository.GetByAbbreviation(disciplineAbbreviation))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_DISCIPLINE, xmlReader.LineNumber, xmlReader.LinePosition));
                    }

                    professorLastName = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TEACHER).Trim();

                    User professor = repositoryManager.GetUserRepository.GetProfessorByLastName(professorLastName);

                    if (null == professor)
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_PROFESSOR, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                    else if (!disciplineAbbreviation.Equals(String.Empty) && 
                             disciplineAbbreviation != null)
                    {
                        SpecialityDiscipline discipline = repositoryManager.GetSpecialityDisciplineRepository.GetByAbbreviation(disciplineAbbreviation);

                        if (discipline != null && !repositoryManager.GetSpecialityDisciplinesProfessorRepository.Exist(professor.Id, discipline.Id))
                        {
                            XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_PROFESSOR_OF_DISCIPLINE, xmlReader.LineNumber, xmlReader.LinePosition));
                        }
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
            DeleteNotExisted();

            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);

            xmlReader.WhitespaceHandling = WhitespaceHandling.None;

            // Извлекаемые данные
            string specialityAbbreviation = String.Empty,
                   disciplineAbbreviation = String.Empty,
                   educationPlanTitle = String.Empty,
                //professorName            = String.Empty,
                   professorLastName = String.Empty,
                //professorFirstNameShort  = String.Empty,
                //professorPatronymicShort = String.Empty,
                   dayOfWeek = String.Empty,
                   time = String.Empty,
                   week = String.Empty,
                   groupNumber = String.Empty,
                //part                     = String.Empty,
                   subgroup = String.Empty,
                   type = String.Empty;

            long specialityId = VLKConstants.FAKE_VALUE,
                 disciplineId = VLKConstants.FAKE_VALUE,
                 professorId = VLKConstants.FAKE_VALUE;

            short building = 0,
                  room = 0;

            //string[] professorData;

            //List<string> groupNumbers = new List<string>();

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_SPECIALITY))
                {
                    specialityAbbreviation = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_ABBREVIATION).Trim();
                    specialityId = repositoryManager.GetSpecialityRepository.GetByAbbreviation(specialityAbbreviation).Id;
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_GROUP))
                {
                    groupNumber = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_NUMBER).Trim();
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_SUBGROUP))
                {
                    subgroup = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TITLE).Trim();
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_PAIR))
                {
                    disciplineAbbreviation = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_DISCIPLINE).Trim();
                    
                    professorLastName = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TEACHER).Trim();

                    User professor = repositoryManager.GetUserRepository.GetProfessorByLastName(professorLastName);

                    if (professor != null) professorId = professor.Id;

                    if (!disciplineAbbreviation.Equals(String.Empty) && disciplineAbbreviation != null && professor != null)
                    {
                        disciplineId = repositoryManager.GetSpecialityDisciplineRepository.GetByAbbreviation(disciplineAbbreviation).Id;
                        
                        dayOfWeek = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_DAY_OF_WEEK).Trim();
                        week = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_WEEK).Trim();
                        time = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TIME);
                        type = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TYPE).Trim();
                        try
                        {
                            room     = Convert.ToInt16(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_ROOM));
                            building = Convert.ToInt16(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_BUILDING));
                        }
                        catch (FormatException exc)
                        {
                            room     = 0;
                            building = 0;
                        }
                        switch (type)
                        {
                            case VLKConstants.TYPE_LECTION:
                                {
                                    LectureTimetable lectureTimetable = new LectureTimetable();
                                    lectureTimetable.Building = building;
                                    lectureTimetable.Day = dayOfWeek;
                                    lectureTimetable.ProfessorId = professorId;
                                    lectureTimetable.Room = room;
                                    lectureTimetable.SpecialityDisciplineId = disciplineId;
                                    lectureTimetable.Time = time;
                                    lectureTimetable.Week = week;

                                    repositoryManager.GetLectureTimetableRepository.Add(lectureTimetable);

                                    long lectureTimetableId = repositoryManager.GetLectureTimetableRepository.Get(disciplineId, dayOfWeek, time, professorId).Id;

                                    GroupsLectureTimetable groupLectureTimetable = new GroupsLectureTimetable();

                                    groupLectureTimetable.GroupId = repositoryManager.GetGroupRepository.GetByTitle(groupNumber).Id;
                                    groupLectureTimetable.LectureTimetableId = lectureTimetableId;

                                    repositoryManager.GetGroupsLectureTimetableRepository.Add(groupLectureTimetable);

                                    break;
                                }
                            case VLKConstants.TYPE_PRACTICE:
                                {
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

                                    if (null != subgroup &&
                                        !String.Empty.Equals(subgroup))
                                    {
                                        practiceAndLabTimetable.Part = subgroup;
                                    }

                                    repositoryManager.GetPracticeAndLabTimetableRepository.Add(practiceAndLabTimetable);
                                    break;
                                }
                            case VLKConstants.TYPE_LAB:
                                {
                                    PracticeAndLabTimetable practiceAndLabTimetable = new PracticeAndLabTimetable();
                                    practiceAndLabTimetable.Building = building;
                                    practiceAndLabTimetable.Day = dayOfWeek;
                                    practiceAndLabTimetable.GroupId = repositoryManager.GetGroupRepository.GetByTitle(groupNumber).Id;
                                    practiceAndLabTimetable.ProfessorId = professorId;
                                    practiceAndLabTimetable.Room = room;
                                    practiceAndLabTimetable.SpecialityDisciplineId = disciplineId;
                                    practiceAndLabTimetable.SpecializationId = repositoryManager.GetSpecializationRepository.GetByAbbreviation(VLKConstants.FIELD_EMPTY + VLKConstants.FIELD_EMPTY + specialityAbbreviation).Id;
                                    practiceAndLabTimetable.Time = time;
                                    practiceAndLabTimetable.Type = Constants.PRACTICE_TYPE_LAB;
                                    practiceAndLabTimetable.Week = week;

                                    if (null != subgroup &&
                                        !String.Empty.Equals(subgroup))
                                    {
                                        practiceAndLabTimetable.Part = subgroup;
                                    }

                                    repositoryManager.GetPracticeAndLabTimetableRepository.Add(practiceAndLabTimetable);

                                    break;
                                }
                        }
                    }
                }
            }
        }
    }
}