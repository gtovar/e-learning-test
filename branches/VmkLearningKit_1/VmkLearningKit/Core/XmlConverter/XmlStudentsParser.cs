using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.Schema;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core.XmlConverter
{
    public class XmlStudentsParser : XmlAbstractParser
    {
        public XmlStudentsParser(string schemaUrl) :
            base(schemaUrl)
        {
        }

        public override bool ValidateData(string xmlUrl)
        {
            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);
            /*
            string studentChairAbbreveation,
                   studentSpecializationAbbreviation,
                   studentGroupNumber;

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_STUDENT))
                {
                    studentChairAbbreveation          = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_CHAIR_ABBREVIATION);
                    studentSpecializationAbbreviation = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_SPECIALIZATION_ABBREVIATION);
                    studentGroupNumber                = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_GROUP_NUMBER);

                    if (null == repositoryManager.GetChairRepository.GetByAbbreviation(studentChairAbbreveation) |
                        null == repositoryManager.GetSpecializationRepository.GetByAbbreviation(studentSpecializationAbbreviation)
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_CHAIR, xmlReader.LineNumber, xmlReader.LinePosition));
                    }

                }
            }
            */

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
            
        }
    }
}