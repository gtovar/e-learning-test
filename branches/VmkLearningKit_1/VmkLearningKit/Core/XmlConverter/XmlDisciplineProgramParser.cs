using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.Schema;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core.XmlConverter
{
    public class XmlDisciplineProgramParser : XmlAbstractParser
    {
        public XmlDisciplineProgramParser(string schemaUrl) :
            base(schemaUrl)
        {
        }

        public override bool ValidateData(string xmlUrl)
        {
            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);

            xmlReader.WhitespaceHandling = WhitespaceHandling.None;

            string disciplineTitle;

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_TITLE))
                {
                    xmlReader.MoveToContent();

                    disciplineTitle = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');

                    if (null == repositoryManager.GetSpecialityDisciplineRepository.GetByTitle(disciplineTitle))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_DISCIPLINE, xmlReader.LineNumber, xmlReader.LinePosition));
                    }

                    break;
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

            //xmlReader.WhitespaceHandling = WhitespaceHandling.None;

            // Извлекаемые данные
            string disciplineTitle              = String.Empty,
                   applicationDomain            = String.Empty,
                   purposes                     = String.Empty,
                   requirements                 = String.Empty,
                   disciplineVolume             = String.Empty,
                   disciplineRazdels            = String.Empty,
                   disciplineRazdelsContent     = String.Empty,
                   topicLevel1Title             = String.Empty,
                   topicLevel2Title             = String.Empty,
                   labPractice                  = String.Empty,
                   reporting                    = String.Empty,
                   markCriterias                = String.Empty,
                   questions                    = String.Empty,
                   literature                   = String.Empty,
                   additional                   = String.Empty;

            long disciplineId                   = VLKConstants.FAKE_VALUE;
            byte level,
                 lectionNumber = 0;

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_TITLE))
                {
                    disciplineTitle = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');
                    disciplineId    = repositoryManager.GetSpecialityDisciplineRepository.GetByTitle(disciplineTitle).Id;
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_APPLICATION_DOMAIN))
                {
                    applicationDomain = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_PURPOSES))
                {
                    purposes = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_REQUIREMENTS))
                {
                    requirements = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_DISCIPLINE_VOLUME))
                {
                    disciplineVolume = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_DISCIPLINE_RAZDELS))
                {
                    disciplineRazdels = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_DISCIPLINE_RAZDELS_CONTENT))
                {
                    disciplineRazdelsContent = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_TOPIC))
                {
                    level = Convert.ToByte(xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_LEVEL));

                    switch (level)
                    {
                        case 1:
                            {
                                topicLevel1Title = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TITLE);

                                break;
                            }
                        case 2:
                            {
                                topicLevel2Title = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TITLE);

                                SpecialityDisciplineTopic topic = new SpecialityDisciplineTopic();

                                topic.SpecialityDisciplineId    = disciplineId;
                                topic.Title                     = topicLevel1Title + " ::: " + topicLevel2Title;

                                repositoryManager.GetSpecialityDisciplineTopicRepository.Add(topic);

                                LecturePlan lecturePlan = new LecturePlan();
                                lecturePlan.SpecialityDisciplineId      = disciplineId;
                                lecturePlan.SpecialityDisciplineTopicId = repositoryManager.GetSpecialityDisciplineTopicRepository.GetByTitle(topic.Title).Id;

                                repositoryManager.GetLecturePlanRepository.Add(lecturePlan);

                                PracticePlan practicePlan = new PracticePlan();
                                practicePlan.SpecialityDisciplineId         = disciplineId;
                                practicePlan.SpecialityDisciplineTopicId    = repositoryManager.GetSpecialityDisciplineTopicRepository.GetByTitle(topic.Title).Id;

                                repositoryManager.GetPracticePlanRepository.Add(practicePlan);

                                break;
                            }
                        default:
                            {
                                break;
                            }
                    }
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_LAB_PRACTICE))
                {
                    labPractice = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_LITERATURE))
                {
                    literature = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_QUESTIONS))
                {
                    questions = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_MARK_CRITERIAS))
                {
                    markCriterias = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_REPORTING))
                {
                    reporting = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_ADDITIONAL))
                {
                    additional = xmlReader.ReadElementContentAsString().Trim().Trim('\n', '\r');
                }
                else if (xmlReader.NodeType == XmlNodeType.EndElement &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_DISCIPLINE_PROGRAM))
                {
                    SpecialityDisciplineProgram program = new SpecialityDisciplineProgram();

                    program.Additional              = HttpUtility.HtmlDecode(additional);
                    program.ApplicationDomain       = HttpUtility.HtmlDecode(applicationDomain);
                    program.LabPractice             = HttpUtility.HtmlDecode(labPractice);
                    program.Literature              = HttpUtility.HtmlDecode(literature);
                    program.MarkCriterias           = HttpUtility.HtmlDecode(markCriterias);
                    program.Purposes                = HttpUtility.HtmlDecode(purposes);
                    program.Questions               = HttpUtility.HtmlDecode(questions);
                    program.Razdels                 = HttpUtility.HtmlDecode(disciplineRazdels);
                    program.RazdelsContent          = HttpUtility.HtmlDecode(disciplineRazdelsContent);
                    program.Reporting               = HttpUtility.HtmlDecode(reporting);
                    program.Requirements            = HttpUtility.HtmlDecode(requirements);
                    program.SpecialityDisciplineId  = disciplineId;
                    program.Volume                  = HttpUtility.HtmlDecode(disciplineVolume);

                    repositoryManager.GetSpecialityDisciplineProgramRepository.Add(program);
                }
            }
        }
    }
}