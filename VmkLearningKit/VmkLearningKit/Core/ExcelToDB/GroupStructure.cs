﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core.ExcelToDB
{
    public class GroupStructureObj
    {
        public Department Department;
        public List<Speciality> Specialities;
        public List<Group> Groups;
        public List<Student> Students;

        public void Commit()
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
            long departmentIdBeforeCommit = Department.Id;
            Department departmentFromDB = repositoryManager.GetDepartmentRepository.GetByAbbreviation(Department.Abbreviation);

            if (null != departmentFromDB)
            {
                foreach (Speciality speciality in Specialities)
                {
                    if (speciality.DepartmentId == departmentIdBeforeCommit)
                    {
                        long specialityIdBeforeCommit = speciality.Id;
                        Speciality specialityFromDB = repositoryManager.GetSpecialityRepository.GetByAbbreviation(speciality.Abbreviation);
                        if (null != specialityFromDB)
                        {
                            foreach (Group group in Groups)
                            {
                                if (group.DepartmentId == departmentIdBeforeCommit &&
                                   group.SpecialityId == specialityIdBeforeCommit)
                                {
                                    long groupIdBeforeCommit = group.Id;
                                    Group groupCopy = Utility.Copy(group);
                                    groupCopy.DepartmentId = departmentFromDB.Id;
                                    groupCopy.SpecialityId = specialityFromDB.Id;
                                    Group groupFromDB = repositoryManager.GetGroupRepository.GetByAlias(group.Alias);
                                    if (null == groupFromDB)
                                    {
                                        groupFromDB = repositoryManager.GetGroupRepository.Add(groupCopy);
                                    }
                                    if (null != groupFromDB)
                                    {
                                        foreach (Student student in Students)
                                        {
                                            if (student.GroupId == groupIdBeforeCommit)
                                            {
                                                long studentIdBeforeCommit = student.User.Id;
                                                Student studentFromDb = null;
                                                Student studentCopy = Utility.Copy(student);
                                                studentCopy.GroupId = groupFromDB.Id;
                                                User userFromDB = repositoryManager.GetUserRepository.GetByLogin(student.User.Login);
                                                if (null == userFromDB)
                                                {
                                                    userFromDB = repositoryManager.GetUserRepository.Add(studentCopy.User);
                                                    if (null != userFromDB)
                                                    {
                                                        studentCopy.UserId = userFromDB.Id;
                                                        studentFromDb = repositoryManager.GetStudentRepository.Add(studentCopy);
                                                    }
                                                }
                                                else
                                                {
                                                    studentFromDb = repositoryManager.GetStudentRepository.GetById(userFromDB.Id);
                                                    if (null == studentFromDb)
                                                    {
                                                        studentCopy.UserId = userFromDB.Id;
                                                        studentFromDb = repositoryManager.GetStudentRepository.Add(studentCopy);
                                                    }
                                                }
                                                if (null == studentFromDb)
                                                {
                                                    // FIXME: studnet isn't added
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    public class GroupStructure
    {
        char[] delimiters = { ' ', ',', ';' };

        public GroupStructure() { }

        public List<GroupStructureObj> FromFile(string filePath)
        {
            List<GroupStructureObj> groupStructureList = null;
            ExcelParser excelParser = ExcelParser.GetExcelParser(filePath);

            if (null != excelParser)
            {
                excelParser.Open();
                excelParser.SetWorkPage(1);
                groupStructureList = new List<GroupStructureObj>();
                GroupStructureObj groupStructureObj = null;
                Department department = null;
                List<Speciality> specialities = null;
                List<Group> groups = null;
                List<Student> students = null;

                string currentReadedValue = String.Empty;
                int rowIndex = 1;
                int columnIndex = 1;
                int maxColumnIndex = 100; // excelParser.GetMaxColumnCount();
                int maxRowIndex = 1000; // excelParser.GetMaxRowCount();
                long departmentColumnIndex = -1;
                long lastDepartmentId = RepositoryManager.GetRepositoryManager.GetDepartmentRepository.GetMaxId() + 1;
                long specialityColumnIndex = -1;
                long lastSpecialityId = RepositoryManager.GetRepositoryManager.GetSpecialityRepository.GetMaxId() + 1;
                long groupColumnIndex = -1;
                long lastGroupId = RepositoryManager.GetRepositoryManager.GetGroupRepository.GetMaxId() + 1;
                long studentColumnIndex = -1;
                long lastStudentId = RepositoryManager.GetRepositoryManager.GetStudentRepository.GetMaxId() + 1;

                Random rndPasswd = new Random(DateTime.Now.Millisecond);

                while (true)
                {
                    currentReadedValue = excelParser.GetCell(rowIndex, columnIndex);
                    switch (currentReadedValue.Trim())
                    {
                        case "Факультет":
                            {
                                departmentColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Специальность":
                            {
                                specialityColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Группа":
                            {
                                groupColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Студенты":
                            {
                                studentColumnIndex = columnIndex;
                                maxColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                    }

                    if (!currentReadedValue.Trim().Equals(String.Empty))
                    {
                        if (departmentColumnIndex == columnIndex)
                        {
                            if (null != groupStructureObj)
                            {
                                groupStructureObj.Department = department;
                                groupStructureObj.Specialities = specialities;
                                groupStructureObj.Groups = groups;
                                groupStructureObj.Students = students;

                                groupStructureList.Add(groupStructureObj);
                            }

                            groupStructureObj = new GroupStructureObj();
                            specialities = new List<Speciality>();
                            groups = new List<Group>();
                            students = new List<Student>();
                            department = new Department();
                            department.Id = ++lastDepartmentId;
                            department.Abbreviation = currentReadedValue;
                        }

                        if (specialityColumnIndex == columnIndex)
                        {
                            Speciality speciality = new Speciality();
                            speciality.Id = ++lastSpecialityId;
                            speciality.DepartmentId = lastDepartmentId;
                            speciality.Abbreviation = currentReadedValue;

                            specialities.Add(speciality);
                        }
                        if (groupColumnIndex == columnIndex)
                        {
                            Group group = new Group();
                            group.Id = ++lastGroupId;
                            group.DepartmentId = lastDepartmentId;
                            group.SpecialityId = lastSpecialityId;
                            group.Title = currentReadedValue;
                            string alias = Transliteration.Front(group.Title);
                            if (null != alias && !alias.Trim().Equals(String.Empty))
                            {
                                group.Alias = alias;
                            }
                            else
                            {
                                group.Alias = Constants.GROUP_DEFAULT_ALIAS + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                            }

                            groups.Add(group);
                        }
                        if (studentColumnIndex == columnIndex)
                        {
                            Student student = new Student();
                            student.GroupId = lastGroupId;
                            student.User = new User();

                            string[] fio = currentReadedValue.Split(' ');
                            if (null != fio && fio.Length >= 1 && !fio[0].Trim().Equals(String.Empty))
                            {
                                student.User.SecondName = fio[0];
                            }
                            else
                            {
                                student.User.SecondName = Constants.STUDENT_DEFAULT_SECOND_NAME;
                            }

                            if (null != fio && fio.Length >= 2 && !fio[1].Trim().Equals(String.Empty))
                            {
                                student.User.FirstName = fio[1];
                            }
                            else
                            {
                                student.User.FirstName = String.Empty;
                            }

                            if (null != fio && fio.Length >= 3 && !fio[2].Trim().Equals(String.Empty))
                            {
                                student.User.Patronymic = fio[2];
                            }
                            else
                            {
                                student.User.Patronymic = String.Empty;
                            }

                            string userNickName = null;
                            string userLogin = null;
                            if (null != student.User.FirstName &&
                               !student.User.FirstName.Trim().Equals(String.Empty) &&
                               null != student.User.Patronymic &&
                               !student.User.Patronymic.Trim().Equals(String.Empty))
                            {
                                userNickName = Transliteration.Front(student.User.SecondName +
                                                       student.User.FirstName[0].ToString().ToUpper() +
                                                       student.User.Patronymic[0].ToString().ToUpper());

                                userLogin = Transliteration.Front(student.User.SecondName.ToLower() +
                                                    "." + student.User.FirstName[0].ToString().ToLower() +
                                                    "." + student.User.Patronymic[0].ToString().ToLower());
                            }
                            else
                            {
                                userNickName = Transliteration.Front(student.User.SecondName +
                                                     "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff"));
                                userLogin = Transliteration.Front(student.User.SecondName);
                            }

                            if (null != userLogin && !userLogin.Trim().Equals(String.Empty))
                            {
                                student.User.Login = userLogin;
                            }
                            else
                            {
                                student.User.Login = Constants.STUDENT_DEFAULT_LOGIN;
                            }

                            if (null != userNickName && !userNickName.Trim().Equals(String.Empty))
                            {
                                student.User.NickName = userNickName;
                            }
                            else
                            {
                                student.User.NickName = Constants.STUDENT_DEFAULT_NICKNAME + "_" + DateTime.Now.ToString("yyyyMMddHHmmssffff");
                            }

                            student.User.Id = ++lastStudentId;
                            student.User.Role = Constants.STUDENT_ROLE;
                            student.User.Email = student.User.Login + Constants.DEFAULT_EMAIL_DOMEN;
                            student.User.Password = Hash.ComputeHash(rndPasswd.Next(25000, 30000).ToString());
                            students.Add(student);
                        }
                    }

                    if (columnIndex < maxColumnIndex)
                    {
                        columnIndex++;
                        continue;
                    }
                    else if (rowIndex < maxRowIndex)
                    {
                        columnIndex = 1;
                        rowIndex++;
                        continue;
                    }
                    else
                    {
                        if (null != groupStructureObj)
                        {
                            groupStructureObj.Department = department;
                            groupStructureObj.Specialities = specialities;
                            groupStructureObj.Groups = groups;
                            groupStructureObj.Students = students;

                            groupStructureList.Add(groupStructureObj);
                        }
                        break;
                    }
                }
            }

            excelParser.Close();
            return groupStructureList;
        }
    }
}
