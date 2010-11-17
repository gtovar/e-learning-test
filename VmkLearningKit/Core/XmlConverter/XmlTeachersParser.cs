using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.Schema;
using VmkLearningKit.Models.Repository;
using System.Net.Mail;
using System.Net.Mime;
using System.Net;

namespace VmkLearningKit.Core.XmlConverter
{
    public class XmlTeachersParser : XmlAbstractParser
    {
        public override void DeleteNotExisted()
        {
        }
        
        public XmlTeachersParser(string schemaUrl) :
            base(schemaUrl)
        {
        }

        public override bool ValidateData(string xmlUrl)
        {
            ExistedDataIds.Clear();
            
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
            DeleteNotExisted();
            
            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);
            
            // Извлекаемые данные
            string teacherChair,
                   teacherLastName,
                   teacherFirstName,
                   teacherPatronymic,
                   teacherDegree,
                   teacherPosition,
                   teacherRank,
                   teacherSite,
                   teacherEmail;

            //List<User>      usersList       = new List<User>();
            //List<Professor> professorsList  = new List<Professor>();
            
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
                    teacherSite         = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_SITE);
                    teacherEmail        = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_EMAIL);

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
                    
                    user.Login      = teacherLastNameFull.ToLower() + "." + 
                                      teacherFirstNameShort.ToLower() + "." +
                                      teacherPatronymicShort.ToLower();
                    
                    user.Password   = Hash.ComputeHash(password);

                    if (teacherEmail != null &&
                        !teacherEmail.Equals(String.Empty))
                    {
                        user.Email = teacherEmail;
                    }
                    else
                    {
                        user.Email = teacherLastNameFull.ToLower() + "." +
                                     teacherFirstNameShort.ToLower() + "." +
                                     teacherPatronymicShort.ToLower() + Constants.DEFAULT_EMAIL_DOMEN;
                    }

                    repositoryManager.GetUserRepository.Add(user);

                    // Отправляем пароль по email

                    // Авторизация на SMTP сервере
                    SmtpClient smtp  = new SmtpClient(Constants.VLK_SMTP, 25);
                    smtp.Credentials = new NetworkCredential(Constants.VLK_EMAIL, Constants.VLK_PASSWORD);

                    // Формирование письма
                    MailMessage message = new MailMessage();
                    message.From        = new MailAddress(Constants.VLK_EMAIL, "Администрация портала е-ВМК");
                    message.To.Add(new MailAddress(user.Email));
                    message.Subject     = "Регистрация на портале е-ВМК";
                    message.Body        = "Здравствуйте, " + teacherFirstName + " " + teacherPatronymic + "!" + Environment.NewLine +
                                          "Добро пожаловать на портал е-ВМК!" + Environment.NewLine + Environment.NewLine +
                                          "Ваши данные для доступа к порталу:" + Environment.NewLine +
                                          "Логин:  " + user.Login + Environment.NewLine +
                                          "Пароль: " + password + Environment.NewLine + Environment.NewLine +
                                          "С уважением," + Environment.NewLine +
                                          "Администрация портала е-ВМК";

                    smtp.Send(message);
                    // ---

                    long userId = repositoryManager.GetUserRepository.GetByLogin(user.Login).Id;

                    Professor professor = new Professor();
                    professor.ChairId   = repositoryManager.GetChairRepository.GetByAbbreviation(teacherChair).Id;
                    professor.Degree    = teacherDegree;
                    professor.Position  = teacherPosition;
                    professor.Rank      = teacherRank;
                    professor.UserId    = userId;
                    if (teacherSite != null &&
                        !teacherSite.Equals(String.Empty))
                    {
                        professor.About = HttpUtility.HtmlDecode("<a href=\"" + teacherSite + "\">Сайт преподавателя</a>");
                    }

                    if (repositoryManager.GetProfessorRepository.GetById(userId) != null)
                    {
                        repositoryManager.GetProfessorRepository.Update(professor);
                    }
                    else
                    {
                        repositoryManager.GetProfessorRepository.Add(professor);
                    }

                    //usersList.Add(user);
                    //professorsList.Add(professor);
                }
            }

            //repositoryManager.GetUserRepository.Add(usersList.AsEnumerable<User>());
            //repositoryManager.GetProfessorRepository.Add(professorsList.AsEnumerable<Professor>());
        }
    }
}