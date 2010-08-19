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

                    if (null == repositoryManager.GetChairRepository.GetByAbbreviation(studentChairAbbreveation))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_CHAIR, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                    if (null == repositoryManager.GetSpecializationRepository.GetByAbbreviation(studentSpecializationAbbreviation))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_SPECIALIZATION, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                    if (null == repositoryManager.GetGroupRepository.GetByTitle(studentGroupNumber))
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

            // Извлекаемые данные
            string studentChairAbbreveation,
                   studentSpecializationAbbreviation,
                   studentGroupNumber,
                   studentLastName,
                   studentFirstName,
                   studentPatronymic;

            List<User>      usersList       = new List<User>();
            List<Student>   studentsList    = new List<Student>();

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_STUDENT))
                {
                    studentChairAbbreveation            = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_CHAIR_ABBREVIATION);
                    studentSpecializationAbbreviation   = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_SPECIALIZATION_ABBREVIATION);
                    studentGroupNumber                  = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_GROUP_NUMBER);
                    studentLastName                     = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_LASTNAME);
                    studentFirstName                    = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_FIRSTNAME);
                    studentPatronymic                   = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_PATRONYMIC);

                    string studentFirstNameShort    = Transliteration.Front(studentFirstName.Substring(0, 1), TransliterationType.ISO).ToLower();
                    string studentLastNameShort     = Transliteration.Front(studentLastName.Substring(0, 1), TransliterationType.ISO).ToLower();
                    string studentPatronymicShort   = Transliteration.Front(studentPatronymic.Substring(0, 1), TransliterationType.ISO).ToLower();
                    string studentLastNameFull      = Transliteration.Front(studentLastName, TransliterationType.ISO).ToLower();
                    string password                 = PasswordGenetrator.Generate(VLKConstants.PASSWORD_DEFAULT_LENGTH);

                    User user = new User();
                    user.FirstName  = studentFirstName;
                    user.SecondName = studentLastName;
                    user.Patronymic = studentPatronymic;
                    user.Role       = Constants.PROFESSOR_ROLE;
                    user.NickName   = studentLastNameFull.Substring(0, 1).ToUpper() +
                                      studentLastNameFull.Substring(1).ToLower() +
                                      studentFirstNameShort.ToUpper() +
                                      studentPatronymicShort.ToUpper();
                    user.Email      = studentLastNameFull.ToLower() + "." +
                                      studentFirstNameShort.ToLower() + "." +
                                      studentPatronymicShort.ToLower() + Constants.DEFAULT_EMAIL_DOMEN;

                    user.Login      = studentLastNameFull.ToLower() + "." +
                                      studentFirstNameShort.ToLower() + "." +
                                      studentPatronymicShort.ToLower();

                    user.Password   = Hash.ComputeHash(password);

                    Student student = new Student();
                    student.ChairId             = repositoryManager.GetChairRepository.GetByAbbreviation(studentChairAbbreveation).Id;
                    student.UserId              = user.Id;
                    student.GroupId             = repositoryManager.GetGroupRepository.GetByTitle(studentGroupNumber).Id;
                    student.SpecializationId    = repositoryManager.GetSpecializationRepository.GetByAbbreviation(studentSpecializationAbbreviation).Id;

                    usersList.Add(user);
                    studentsList.Add(student);
                }
            }

            repositoryManager.GetUserRepository.Add(usersList.AsEnumerable<User>());
            repositoryManager.GetStudentRepository.Add(studentsList.AsEnumerable<Student>());

            // Здесь делаем рассылку паролей по email
        }
    }
}