using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VmkLearningKit.Core;
using VmkLearningKit.Models.Repository;

namespace VmkLearningKit.Core.ExcelToDB
{
    public class SpecialityDisciplineTopicStructureObj
    {
        public SpecialityDiscipline SpecialityDiscipline;
        public List<SpecialityDisciplineTopic> SpecialityDisciplineTopics;

        public void Commit()
        {
            RepositoryManager repositoryManager = RepositoryManager.GetRepositoryManager;
            long specialityDisciplineIdBeforeCommit = SpecialityDiscipline.Id;
            SpecialityDiscipline specialityDisciplineFromDB = repositoryManager.GetSpecialityDisciplineRepository.GetByTitle(SpecialityDiscipline.Title);
            if (null != specialityDisciplineFromDB)
            {
                foreach (SpecialityDisciplineTopic specialityDisciplineTopic in SpecialityDisciplineTopics)
                {
                    specialityDisciplineTopic.SpecialityDisciplineId = SpecialityDiscipline.Id;
                    SpecialityDisciplineTopic specialityDisciplineTopicFromDB = repositoryManager.GetSpecialityDisciplineTopicRepository.GetByTitle(specialityDisciplineTopic.Title);
                    if (null == specialityDisciplineTopicFromDB)
                    {
                        specialityDisciplineTopicFromDB = repositoryManager.GetSpecialityDisciplineTopicRepository.Add(specialityDisciplineTopic);
                        if (null == specialityDisciplineTopicFromDB)
                        {
                            // FIXME: specialityDisciplineTopic isn't added
                        }
                    }
                }
            }
        }
    }

    public class SpecialityDisciplineTopicStructure
    {
        char[] delimiters = { ' ', ',', ';' };

        public SpecialityDisciplineTopicStructure() { }

        public List<SpecialityDisciplineTopicStructureObj> FromFile(string filePath)
        {
            List<SpecialityDisciplineTopicStructureObj> specialityDisciplineTopicStructureList = null;
            ExcelParser excelParser = ExcelParser.GetExcelParser(filePath);

            if (null != excelParser)
            {
                excelParser.Open();
                excelParser.SetWorkPage(1);
                specialityDisciplineTopicStructureList = new List<SpecialityDisciplineTopicStructureObj>();
                SpecialityDisciplineTopicStructureObj specialityDisciplineTopicStructureObj = null;
                SpecialityDiscipline specialityDiscipline = null;
                List<SpecialityDisciplineTopic> specialityDisciplineTopics = null;

                string currentReadedValue = String.Empty;
                int rowIndex = 1;
                int columnIndex = 1;
                int maxColumnIndex = 100; // excelParser.GetMaxColumnCount();
                int maxRowIndex = 1000; // excelParser.GetMaxRowCount();
                int specialityDisciplineColumnIndex = -1;
                int lastSpecialityDisciplineId = 0;
                int specialityDisciplineTopicColumnIndex = -1;
                int lastSpecialityDisciplineTopicId = 0;

                while (true)
                {
                    currentReadedValue = excelParser.GetCell(rowIndex, columnIndex);
                    switch (currentReadedValue.Trim())
                    {
                        case "Дисциплина":
                            {
                                specialityDisciplineColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                        case "Тема":
                            {
                                specialityDisciplineTopicColumnIndex = columnIndex;
                                maxColumnIndex = columnIndex;
                                columnIndex++;
                                continue;
                            }
                    }

                    if (!currentReadedValue.Trim().Equals(String.Empty))
                    {
                        if (specialityDisciplineColumnIndex == columnIndex)
                        {
                            if (null != specialityDisciplineTopicStructureObj)
                            {
                                specialityDisciplineTopicStructureObj.SpecialityDiscipline = specialityDiscipline;
                                specialityDisciplineTopicStructureObj.SpecialityDisciplineTopics = specialityDisciplineTopics;

                                specialityDisciplineTopicStructureList.Add(specialityDisciplineTopicStructureObj);
                            }

                            specialityDisciplineTopicStructureObj = new SpecialityDisciplineTopicStructureObj();
                            specialityDiscipline = new SpecialityDiscipline();
                            specialityDiscipline.Id = ++lastSpecialityDisciplineId;
                            specialityDiscipline.Title = currentReadedValue;
                        }

                        if (specialityDisciplineTopicColumnIndex == columnIndex)
                        {
                            SpecialityDisciplineTopic specialityDisciplineTopic = new SpecialityDisciplineTopic();
                            specialityDisciplineTopic.Id = ++lastSpecialityDisciplineTopicId;
                            specialityDisciplineTopic.Title = currentReadedValue;

                            specialityDisciplineTopics.Add(specialityDisciplineTopic);
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
                        if (null != specialityDisciplineTopicStructureObj)
                        {
                            specialityDisciplineTopicStructureObj.SpecialityDiscipline = specialityDiscipline;
                            specialityDisciplineTopicStructureObj.SpecialityDisciplineTopics = specialityDisciplineTopics;

                            specialityDisciplineTopicStructureList.Add(specialityDisciplineTopicStructureObj);
                        }
                        break;
                    }
                }
            }

            excelParser.Close();
            return specialityDisciplineTopicStructureList;
        }
    }
}
