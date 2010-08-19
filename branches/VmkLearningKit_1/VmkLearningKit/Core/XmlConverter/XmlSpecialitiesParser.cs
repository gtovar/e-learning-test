using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.Schema;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core.XmlConverter
{
    public class XmlSpecialitiesParser : XmlAbstractParser
    {
        public XmlSpecialitiesParser(string schemaUrl) :
            base(schemaUrl)
        {
        }

        public override bool ValidateData(string xmlUrl)
        {
            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);

            string educationPlanTitle,
                   specializationChairAbbreviation;

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_SPECIALITY))
                {
                    educationPlanTitle = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_EDUCATION_PLAN);

                    if (null == repositoryManager.GetEducationPlanRepository.GetByTitle(educationPlanTitle))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_EDUCATION_PLAN, xmlReader.LineNumber, xmlReader.LinePosition));
                    }

                    while (xmlReader.Read() &&
                           xmlReader.NodeType == XmlNodeType.Element &&
                           xmlReader.Name.Equals(Constants.XML_ELEMENT_SPECIALIZATION))
                    {
                        specializationChairAbbreviation = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_CHAIR_ABBREVIATION);

                        if (null == repositoryManager.GetChairRepository.GetByAbbreviation(specializationChairAbbreviation))
                        {
                            XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_CHAIR, xmlReader.LineNumber, xmlReader.LinePosition));
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
            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);

            // Извлекаемые данные
            string educationPlanTitle,
                   specialityCode,
                   specialityAbbreviation,
                   specialityTitle,
                   specializationChairAbbreviation,
                   specializationCode,
                   specializationAbbreviation,
                   specializationTitle;

            List<Speciality>        specialitiesList    = new List<Speciality>();
            List<Specialization>    specializationsList = new List<Specialization>();

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_SPECIALITY))
                {
                    educationPlanTitle      = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_EDUCATION_PLAN);
                    specialityCode          = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_CODE);
                    specialityAbbreviation  = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_ABBREVIATION);
                    specialityTitle         = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TITLE);

                    Speciality speciality = new Speciality();
                    speciality.Abbreviation = specialityAbbreviation;
                    speciality.Alias        = Transliteration.Front(specialityAbbreviation, TransliterationType.ISO);
                    speciality.Code         = specialityCode;
                    speciality.DepartmentId = VLKConstants.VMK_DEPARTMENT_ID;
                    speciality.Title        = specialityTitle;

                    specialitiesList.Add(speciality);

                    while (xmlReader.Read() &&
                           xmlReader.NodeType == XmlNodeType.Element &&
                           xmlReader.Name.Equals(Constants.XML_ELEMENT_SPECIALIZATION))
                    {
                        specializationChairAbbreviation = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_CHAIR_ABBREVIATION);
                        specializationCode              = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_CODE);
                        specializationAbbreviation      = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_ABBREVIATION);
                        specializationTitle             = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_TITLE);

                        Specialization specialization = new Specialization();
                        specialization.Abbreviation     = specializationAbbreviation;
                        specialization.Alias            = Transliteration.Front(specializationAbbreviation, TransliterationType.ISO);
                        specialization.ChairId          = repositoryManager.GetChairRepository.GetByAbbreviation(specializationChairAbbreviation).Id;
                        specialization.Code             = specializationCode;
                        specialization.EducationPlanId  = repositoryManager.GetEducationPlanRepository.GetByTitle(educationPlanTitle).Id;
                        specialization.SpecialityId     = speciality.Id;
                        specialization.Title            = specializationTitle;

                        specializationsList.Add(specialization);

                        Specialization fakeSpecialization = new Specialization();
                        fakeSpecialization.Abbreviation     = VLKConstants.FIELD_EMPTY;
                        fakeSpecialization.Alias            = Transliteration.Front(VLKConstants.FIELD_EMPTY, TransliterationType.ISO);
                        fakeSpecialization.ChairId          = specialization.ChairId;
                        fakeSpecialization.Code             = VLKConstants.FIELD_EMPTY;
                        fakeSpecialization.EducationPlanId  = repositoryManager.GetEducationPlanRepository.GetByTitle(VLKConstants.FIELD_EMPTY).Id;
                        fakeSpecialization.SpecialityId     = speciality.Id;
                        fakeSpecialization.Title            = VLKConstants.FIELD_EMPTY;

                        specializationsList.Add(fakeSpecialization);
                    }
                }
            }

            repositoryManager.GetSpecialityRepository.Add(specialitiesList.AsEnumerable<Speciality>());
            repositoryManager.GetSpecializationRepository.Add(specializationsList.AsEnumerable<Specialization>());
        }
    }
}