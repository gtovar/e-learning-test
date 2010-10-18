﻿using System;
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
        public override void DeleteNotExisted()
        {
            foreach (User user in repositoryManager.GetUserRepository.GetAll())
            {
                if (user.Role == Constants.STUDENT_ROLE && !ExistedDataIds.Contains(user.Id))
                {
                    repositoryManager.GetUserRepository.DeleteStudent(user.Id);
                }
            }
        }
        
        public XmlStudentsParser(string schemaUrl) :
            base(schemaUrl)
        {
        }

        public override bool ValidateData(string xmlUrl)
        {
            ExistedDataIds.Clear();
            
            XmlTextReader xmlReader = new XmlTextReader(xmlUrl);

            xmlReader.WhitespaceHandling = WhitespaceHandling.None;
            
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

                    string specialityAbbreviation = String.Empty;

                    if (null == repositoryManager.GetGroupRepository.GetByTitle(studentGroupNumber))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_GROUP, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                    else
                    {
                        specialityAbbreviation = repositoryManager.GetGroupRepository.GetByTitle(studentGroupNumber).Speciality.Abbreviation;
                    }
                    
                    if (studentSpecializationAbbreviation == VLKConstants.FIELD_EMPTY)
                    {
                        studentSpecializationAbbreviation += (studentChairAbbreveation + specialityAbbreviation);
                    }

                    if (null == repositoryManager.GetChairRepository.GetByAbbreviation(studentChairAbbreveation))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_CHAIR, xmlReader.LineNumber, xmlReader.LinePosition));
                    }
                    if (null == repositoryManager.GetSpecializationRepository.GetByAbbreviation(studentSpecializationAbbreviation))
                    {
                        XmlDataErrorLog.Add(new LogRecord(Constants.XML_DATA_ERROR_NOT_EXIST_SPECIALIZATION, xmlReader.LineNumber, xmlReader.LinePosition));
                    }

                    string studentLastName      = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_LASTNAME);
                    string studentFirstName     = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_FIRSTNAME);
                    string studentPatronymic    = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_PATRONYMIC);

                    User user = repositoryManager.GetUserRepository.GetByFIO(studentFirstName, studentLastName, studentPatronymic);

                    if (user != null)
                    {
                        ExistedDataIds.Add(user.Id);
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
            string studentChairAbbreveation,
                   studentSpecializationAbbreviation,
                   studentGroupNumber,
                   studentLastName,
                   studentFirstName,
                   studentPatronymic;

            //List<User>      usersList       = new List<User>();
            //List<Student>   studentsList    = new List<Student>();

            while (xmlReader.Read())
            {
                if (xmlReader.NodeType == XmlNodeType.Element &&
                    xmlReader.Name.Equals(Constants.XML_ELEMENT_STUDENT))
                {
                    studentChairAbbreveation            = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_CHAIR_ABBREVIATION);
                    studentSpecializationAbbreviation   = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_SPECIALIZATION_ABBREVIATION);
                    studentGroupNumber                  = xmlReader.GetAttribute(Constants.XML_ATTRIBUTE_GROUP_NUMBER);

                    string specialityAbbreviation       = repositoryManager.GetGroupRepository.GetByTitle(studentGroupNumber).Speciality.Abbreviation;

                    if (studentSpecializationAbbreviation == VLKConstants.FIELD_EMPTY)
                    {
                        studentSpecializationAbbreviation += (studentChairAbbreveation + specialityAbbreviation);
                    }

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
                    user.Role       = Constants.STUDENT_ROLE;
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

                    repositoryManager.GetUserRepository.Add(user);

                    long userId = repositoryManager.GetUserRepository.GetByLogin(user.Login).Id;

                    Student student = new Student();
                    student.ChairId             = repositoryManager.GetChairRepository.GetByAbbreviation(studentChairAbbreveation).Id;
                    student.UserId              = userId;
                    student.GroupId             = repositoryManager.GetGroupRepository.GetByTitle(studentGroupNumber).Id;
                    student.SpecializationId    = repositoryManager.GetSpecializationRepository.GetByAbbreviation(studentSpecializationAbbreviation).Id;

                    if (repositoryManager.GetStudentRepository.GetById(userId) != null)
                    {
                        repositoryManager.GetStudentRepository.Update(student);
                    }
                    else
                    {
                        repositoryManager.GetStudentRepository.Add(student);
                    }

                    //usersList.Add(user);
                    //studentsList.Add(student);
                }
            }

            //repositoryManager.GetUserRepository.Add(usersList.AsEnumerable<User>());
            //repositoryManager.GetStudentRepository.Add(studentsList.AsEnumerable<Student>());

            // Здесь делаем рассылку паролей по email
        }
    }
}