using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.Schema;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core.XmlConverter
{
    public class XmlGroupsParser : XmlAbstractParser
    {
        public XmlGroupsParser(string schemaUrl) :
            base(schemaUrl)
        {
        }

        public override bool ValidateData(string xmlUrl)
        {
            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);

            string specialityAbbreveation;

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_GROUP))
                {
                    specialityAbbreveation = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_SPECIALITY_ABBREVIATION);

                    if (null == repositoryManager.GetSpecialityRepository.GetByAbbreviation(specialityAbbreveation))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_SPECIALITY, xmlReader.LineNumber, xmlReader.LinePosition));
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

            // Извлекаемые данные
            string specialityAbbreveation,
                   groupNumber;

            List<Group> groupsList = new List<Group>();

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_GROUP))
                {
                    specialityAbbreveation = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_SPECIALITY_ABBREVIATION);
                    groupNumber            = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_NUMBER);

                    Group group = new Group();
                    group.DepartmentId  = VLKConstants.VMK_DEPARTMENT_ID;
                    group.SpecialityId  = repositoryManager.GetSpecialityRepository.GetByAbbreviation(specialityAbbreveation).Id;
                    group.Title         = groupNumber;
                    group.Alias         = Transliteration.Front(groupNumber, TransliterationType.ISO);

                    groupsList.Add(group);
                }
            }

            foreach (Group group in groupsList)
            {
                repositoryManager.GetGroupRepository.Add(group);
            }
        }
    }
}