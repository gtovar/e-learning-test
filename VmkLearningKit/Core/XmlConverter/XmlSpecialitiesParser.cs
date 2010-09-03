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

            xmlReader.WhitespaceHandling = WhitespaceHandling.None;

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
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
                         xmlReader.Name.Equals(Constants.XML_ELEMENT_SPECIALIZATION))
                {
                    specializationChairAbbreviation = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_CHAIR_ABBREVIATION);

                    if (null == repositoryManager.GetChairRepository.GetByAbbreviation(specializationChairAbbreviation))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_CHAIR, xmlReader.LineNumber, xmlReader.LinePosition));
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
            string educationPlanTitle               = String.Empty,
                   specialityCode                   = String.Empty,
                   specialityAbbreviation           = String.Empty,
                   specialityTitle                  = String.Empty,
                   specializationChairAbbreviation  = String.Empty,
                   specializationCode               = String.Empty,
                   specializationAbbreviation       = String.Empty,
                   specializationTitle              = String.Empty;

            long specialityId = VLKConstants.FAKE_VALUE;

            //List<Speciality>        specialitiesList    = new List<Speciality>();
            //List<Specialization>    specializationsList = new List<Specialization>();

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

                    repositoryManager.GetSpecialityRepository.Add(speciality);

                    specialityId            = repositoryManager.GetSpecialityRepository.GetByAbbreviation(specialityAbbreviation).Id;
                }
                else if (xmlReader.NodeType == XmlNodeType.Element &&
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
                    specialization.SpecialityId     = specialityId;
                    specialization.Title            = specializationTitle;

                    repositoryManager.GetSpecializationRepository.Add(specialization);

                    string fakeSpecializationTitle = VLKConstants.FIELD_EMPTY + repositoryManager.GetChairRepository.GetById(specialization.ChairId).Abbreviation + specialityAbbreviation;

                    Specialization fakeSpecialization = new Specialization();
                    fakeSpecialization.Abbreviation     = fakeSpecializationTitle;
                    fakeSpecialization.Alias            = Transliteration.Front(fakeSpecializationTitle, TransliterationType.ISO);
                    fakeSpecialization.ChairId          = specialization.ChairId;
                    fakeSpecialization.Code             = fakeSpecializationTitle;
                    fakeSpecialization.EducationPlanId  = repositoryManager.GetEducationPlanRepository.GetByTitle(VLKConstants.FIELD_EMPTY).Id;
                    fakeSpecialization.SpecialityId     = specialityId;
                    fakeSpecialization.Title            = fakeSpecializationTitle;

                    repositoryManager.GetSpecializationRepository.Add(fakeSpecialization);
                }
            }

            // Добавляем фэйковые специализации для каждой специальности с фэйковой кафедрой
            foreach (Speciality speciality in repositoryManager.GetSpecialityRepository.GetAll(Constants.VMK_DEPARTMENT_ALIAS))
            {
                string fakeSpecializationTitle = VLKConstants.FIELD_EMPTY + VLKConstants.FIELD_EMPTY + speciality.Abbreviation;
                
                Specialization fakeSpecialization = new Specialization();
                fakeSpecialization.Abbreviation     = fakeSpecializationTitle;
                fakeSpecialization.Alias            = Transliteration.Front(fakeSpecializationTitle, TransliterationType.ISO);
                fakeSpecialization.ChairId          = repositoryManager.GetChairRepository.GetByAbbreviation(VLKConstants.FIELD_EMPTY).Id;
                fakeSpecialization.Code             = fakeSpecializationTitle;
                fakeSpecialization.EducationPlanId  = repositoryManager.GetEducationPlanRepository.GetByTitle(VLKConstants.FIELD_EMPTY).Id;
                fakeSpecialization.SpecialityId     = speciality.Id;
                fakeSpecialization.Title            = fakeSpecializationTitle;

                repositoryManager.GetSpecializationRepository.Add(fakeSpecialization);
            }
        }
    }
}