using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.Schema;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core.XmlConverter
{
    public class XmlEducationPlanParser : XmlAbstractParser
    {
        public override void DeleteNotExisted()
        {
        }
        
        public XmlEducationPlanParser(string schemaUrl) :
            base(schemaUrl)
        {
        }

        public override bool ValidateData(string xmlUrl)
        {
            ExistedDataIds.Clear();
            
            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);

            xmlReader.WhitespaceHandling = WhitespaceHandling.None;

            string professorName,
                   professorLastName,
                   professorFirstNameShort,
                   professorPatronymicShort,
                   specialityCode,
                   educationPlanTitle;

            string[] professorData;

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_TEACHER))
                {
                    professorName = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_NAME).Trim();
                    professorData = professorName.Split(' ', '.');

                    if (4 == professorData.Length)
                    {
                        professorLastName           = professorData[0].ToLower();
                        professorFirstNameShort     = professorData[1].ToLower();
                        professorPatronymicShort    = professorData[2].ToLower();

                        if (null == repositoryManager.GetUserRepository.GetByLogin(Transliteration.Front(professorLastName, TransliterationType.ISO) +
                                                                                   "." +
                                                                                   Transliteration.Front(professorFirstNameShort, TransliterationType.ISO) +
                                                                                   "." +
                                                                                   Transliteration.Front(professorPatronymicShort, TransliterationType.ISO)))
                        {
                            XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_PROFESSOR, xmlReader.LineNumber, xmlReader.LinePosition));
                        }
                    }
                    else
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_VALID_FORMAT, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_SPECIALITY))
                {
                    specialityCode = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_CODE);

                    if (null == repositoryManager.GetSpecialityRepository.GetByCode(specialityCode))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_SPECIALITY, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_EDUCATION_PLAN))
                {
                    educationPlanTitle = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TITLE);

                    if (null == repositoryManager.GetEducationPlanRepository.GetByTitle(educationPlanTitle))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_EDUCATION_PLAN, xmlReader.LineNumber, xmlReader.LinePosition));
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
            string   specialityCode             = String.Empty,
                     category1                  = String.Empty,
                     category2                  = String.Empty,
                     disciplineAbbreviation     = String.Empty,
                     disciplineCode             = String.Empty,
                     disciplineTitle            = String.Empty,
                     educationPlanTitle         = String.Empty,
                     professorName              = String.Empty,
                     professorLastName          = String.Empty,
                     professorFirstNameShort    = String.Empty,
                     professorPatronymicShort   = String.Empty,
                     reportings                 = String.Empty;
            byte     localTermNumber            = 0,
                     localTermWeeks             = 0,
                     lectionsCount              = 0,
                     practicesCount             = 0,
                     labsCount                  = 0;
            bool     required                   = true;
            long     specialityId               = VLKConstants.FAKE_VALUE,
                     educationPlanId            = VLKConstants.FAKE_VALUE,
                     chairId                    = VLKConstants.FAKE_VALUE,
                     professorId                = VLKConstants.FAKE_VALUE,
                     specialityDisciplineId     = VLKConstants.FAKE_VALUE;
            bool     termStart                  = true;
            string[] professorData;

            List<long> professorIds             = new List<long>();

            Dictionary<byte, byte> terms    = new Dictionary<byte, byte>();

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_SPECIALITY))
                {
                    specialityCode = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_CODE);
                    specialityId   = repositoryManager.GetSpecialityRepository.GetByCode(specialityCode).Id;
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_EDUCATION_PLAN))
                {
                    educationPlanTitle  = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TITLE);
                    educationPlanId     = repositoryManager.GetEducationPlanRepository.GetByTitle(educationPlanTitle).Id;
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_TERMS))
                {
                    while (xmlReader.Read() &&
                           xmlReader.Name.Equals(Constants.XML_ELEMENT_TERM))
                    {
                        terms.Add(Convert.ToByte(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_NUMBER)),
                                  Convert.ToByte(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_WEEKS)));
                    }
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_CATEGORY_1))
                {
                    category1 = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TITLE);
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_CATEGORY_2))
                {
                    category2 = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TITLE);
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_DISCIPLINE))
                {
                    disciplineAbbreviation  = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_ABBREVIATION);
                    disciplineCode          = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_CODE);
                    disciplineTitle         = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TITLE);
                    chairId                 = repositoryManager.GetChairRepository.GetByAbbreviation(VLKConstants.FIELD_EMPTY).Id;
                    
                    try
                    {
                        if (0 == Convert.ToByte(xmlReader.GetAttribute("required")))
                            required = false;
                        else
                            required = true;
                    }
                    catch (FormatException exc)
                    {
                        required = true;
                    }
                    termStart               = true;
                    professorIds.Clear();
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_TEACHER))
                {
                    professorName = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_NAME).Trim();
                    professorData = professorName.Split(' ', '.');

                    professorLastName        = professorData[0].ToLower();
                    professorFirstNameShort  = professorData[1].ToLower();
                    professorPatronymicShort = professorData[2].ToLower();

                    professorId = repositoryManager.GetUserRepository.GetByLogin(Transliteration.Front(professorLastName, TransliterationType.ISO) +
                                                                                 "." +
                                                                                 Transliteration.Front(professorFirstNameShort, TransliterationType.ISO) +
                                                                                 "." +
                                                                                 Transliteration.Front(professorPatronymicShort, TransliterationType.ISO)).Id;

                    professorIds.Add(professorId);
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_TERM) &&
                         professorIds.Count != 0)
                {
                    if (termStart)
                    {
                        SpecialityDiscipline discipline = new SpecialityDiscipline();
                        discipline.Abbreviation     = disciplineAbbreviation;
                        discipline.Alias            = Transliteration.Front(disciplineAbbreviation, TransliterationType.ISO);
                        discipline.Category         = category1 + ":" + category2;
                        discipline.ChairId          = chairId;
                        discipline.Code             = disciplineCode;
                        discipline.EducationPlanId  = educationPlanId;
                        discipline.SpecialityId     = specialityId;
                        discipline.Title            = disciplineTitle;
                        discipline.Required         = required;

                        repositoryManager.GetSpecialityDisciplineRepository.Add(discipline);

                        specialityDisciplineId      = repositoryManager.GetSpecialityDisciplineRepository.GetByTitle(disciplineTitle).Id;

                        foreach (long id in professorIds)
                        {
                            SpecialityDisciplinesProfessor temp = new SpecialityDisciplinesProfessor();

                            temp.ProfessorId            = id;
                            temp.SpecialityDisciplineId = specialityDisciplineId;

                            repositoryManager.GetSpecialityDisciplinesProfessorRepository.Add(temp);
                        }
                    }

                    termStart = false;

                    localTermNumber = Convert.ToByte(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_NUMBER));
                    localTermWeeks  = terms[localTermNumber];
                    lectionsCount   = Convert.ToByte(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_LECTIONS));
                    practicesCount  = Convert.ToByte(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_PRACTICES));
                    labsCount       = Convert.ToByte(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_LABS));
                    reportings      = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_REPORTINGS);

                    SpecialityDisciplineTerm term = new SpecialityDisciplineTerm();
                    term.LabVolume              = labsCount;
                    term.LectureVolume          = lectionsCount;
                    term.PracticeVolume         = practicesCount;
                    term.Reporting              = reportings;
                    term.SpecialityDisciplineId = specialityDisciplineId;
                    term.Term                   = localTermNumber;
                    term.WeeksVolume            = localTermWeeks;

                    repositoryManager.GetSpecialityDisciplineTermRepository.Add(term);
                }
            }
        }
    }
}