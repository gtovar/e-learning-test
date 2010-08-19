using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.Schema;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core.XmlConverter
{
    public class XmlTeachersParser : XmlAbstractParser
    {
        public XmlTeachersParser(string schemaUrl) :
            base(schemaUrl)
        {
        }

        public override bool ValidateData(string xmlUrl)
        {
            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);

            string teacherChairAbbreveation;

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_TEACHER))
                {
                    teacherChairAbbreveation = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_CHAIR_ABBREVIATION);

                    if (null == repositoryManager.GetChairRepository.GetByAbbreviation(teacherChairAbbreveation))
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
            
            // Извлекаемые данные
            string teacherChair,
                   teacherLastName,
                   teacherFirstName,
                   teacherPatronymic,
                   teacherDegree,
                   teacherPosition,
                   teacherRank;

            List<User>      usersList       = new List<User>();
            List<Professor> professorsList  = new List<Professor>();
            
            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_TEACHER))
                {
                    teacherChair        = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_CHAIR_ABBREVIATION);
                    teacherLastName     = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_LASTNAME);
                    teacherFirstName    = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_FIRSTNAME);
                    teacherPatronymic   = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_PATRONYMIC);
                    teacherDegree       = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_DEGREE);
                    teacherPosition     = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_POSITION);
                    teacherRank         = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_RANK);
                    
                    string teacherFirstNameShort    = Transliteration.Front(teacherFirstName.Substring(0, 1), TransliterationType.ISO).ToLower();
                    string teacherLastNameShort     = Transliteration.Front(teacherLastName.Substring(0, 1), TransliterationType.ISO).ToLower();
                    string teacherPatronymicShort   = Transliteration.Front(teacherPatronymic.Substring(0, 1), TransliterationType.ISO).ToLower();
                    string teacherLastNameFull      = Transliteration.Front(teacherLastName, TransliterationType.ISO).ToLower();
                    string password                 = PasswordGenetrator.Generate(VLKConstants.PASSWORD_DEFAULT_LENGTH);

                    User user = new User();
                    user.FirstName  = teacherFirstName;
                    user.SecondName = teacherLastName;
                    user.Patronymic = teacherPatronymic;
                    user.Role       = Constants.PROFESSOR_ROLE;
                    user.NickName   = teacherLastNameFull.Substring(0, 1).ToUpper() + 
                                      teacherLastNameFull.Substring(1).ToLower() +
                                      teacherFirstNameShort.ToUpper() + 
                                      teacherPatronymicShort.ToUpper();
                    user.Email      = teacherLastNameFull.ToLower() + "." +
                                      teacherFirstNameShort.ToLower() + "." + 
                                      teacherPatronymicShort.ToLower() + Constants.DEFAULT_EMAIL_DOMEN;

                    user.Login      = teacherLastNameFull.ToLower() + "." + 
                                      teacherFirstNameShort.ToLower() + "." +
                                      teacherPatronymicShort.ToLower();
                    
                    user.Password   = Hash.ComputeHash(password);

                    Professor professor = new Professor();
                    professor.ChairId   = repositoryManager.GetChairRepository.GetByAbbreviation(teacherChair).Id;
                    professor.Degree    = teacherDegree;
                    professor.Position  = teacherPosition;
                    professor.Rank      = teacherRank;
                    professor.UserId    = user.Id;

                    usersList.Add(user);
                    professorsList.Add(professor);
                }
            }

            repositoryManager.GetUserRepository.Add(usersList.AsEnumerable<User>());
            repositoryManager.GetProfessorRepository.Add(professorsList.AsEnumerable<Professor>());

            // Здесь делаем рассылку паролей по email
        }
    }
}